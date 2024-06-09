/*
    Usecase: Deze procedure heeft betrekking tot de functionaliteit "Geschiedenis opslaan".
    Beschrijving:
       Dit stored procedure voegt aan alle bestaande tabellen geschiedenis tabellen toe.
       Op deze manier is het altijd achterhaalbaar welke data op welke moment in de tabel heeft gestaan.
*/


USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_generateHistoryTables
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

        --define variables
		DECLARE @TableName NVARCHAR(128)
        DECLARE @SchemaName NVARCHAR(128)
        DECLARE @FullTableName NVARCHAR(260)
        DECLARE @SQL NVARCHAR(MAX)
        DECLARE @HistoryTable NVARCHAR(260)

        -- Cursor to iterate over all user tables in the current database
        DECLARE table_cursor CURSOR FOR
        SELECT SCHEMA_NAME(t.schema_id) AS SchemaName, t.name AS TableName
        FROM sys.tables t
        WHERE t.is_ms_shipped = 0 -- Exclude system tables

        OPEN table_cursor
        FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Construct the full table name with schema and filter history tables
        	IF (@TableName NOT LIKE '%_History')
        	BEGIN
            SET @FullTableName = QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName)
            SET @HistoryTable = QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName + '_History')

            -- Construct the dynamic SQL to add the columns and enable system versioning
            SET @SQL = '
            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(''' + @FullTableName + ''') AND name = ''ValidFrom'')
            BEGIN
                ALTER TABLE ' + @FullTableName + '
                ADD [ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
                    [ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
                    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo]);
            END'

            -- Print the SQL for debugging (optional)
            --PRINT @SQL

            -- Execute the dynamic SQL to add the columns and period
            EXEC sp_executesql @SQL

            -- Construct the dynamic SQL to enable system versioning
            SET @SQL = '
            ALTER TABLE ' + @FullTableName + '
            SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = ' + @HistoryTable + '));'

            -- Print the SQL for debugging (optional)
            --PRINT @SQL

            -- Execute the dynamic SQL to enable system versioning
            EXEC sp_executesql @SQL
        	END;

            FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName
        END;

        CLOSE table_cursor
        DEALLOCATE table_cursor

		COMMIT TRANSACTION; -- lower trancount with 1 when at end of TRY.
	END TRY
	BEGIN CATCH
		--a rollback is possible if a transaction is "doomed", but only if @startTrancount = 0
		--If @startTrancount is higher, the calling sproc/system is responsible for rolling back.
		IF XACT_STATE() = -1 AND @startTrancount = 0
		BEGIN
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			--if the transactions is not doomed, the work of this sproc can be undone.
			--Other work in the whole transaction, might still be able to be commited.
			--so a rollback to savepoint is necessary and transactions counter substracted by 1  ;
			IF XACT_STATE() = 1
			--transaction not doomed, but work needs to be undone.
			--your not in this CATCH block for nothing.
			BEGIN
				ROLLBACK TRANSACTION @savepoint; --undo work of this sproc
				COMMIT TRANSACTION; --trancount - 1
			END;
		END;
		DECLARE @errormessage varchar(2000);
		SET @errormessage = 'Error occured in sproc ''' + OBJECT_NAME(@@procid) + '''. Original message: ''' + ERROR_MESSAGE() + '''';
		THROW 50000, @errormessage, 1;
	END CATCH;
END;
GO
