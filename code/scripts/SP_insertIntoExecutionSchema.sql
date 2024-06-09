/*
    Usecase: Deze procedure heeft betrekking tot de usecases die te maken hebben met het toevoegen/updaten van data in mongodb..
    Beschrijving:
       Dit stored procedure voegt een entry toe aan de EXECUTION_SCHEMA tabel.
       Die word later uitgevoerd door de SP_job.
*/

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_insertIntoExecutionSchema
    --define parameters
    @storedProcedureID INT,
    @correspondingExecutionID INT,
	@parentProcessID INT,
	@parameter NVARCHAR(MAX)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

		SET NOCOUNT ON;
            DECLARE @procedureID INT;
            DECLARE @correspondingID INT;
            DECLARE @requestAlreadyExists BIT;
            SET @procedureID = @storedProcedureID;
            SET @correspondingID = @correspondingExecutionID;
            SET @requestAlreadyExists = 0;
            --check if requestAlreadyExists
        	IF EXISTS (SELECT 1 FROM dbo.EXECUTION_SCHEMA WHERE STOREDPROCEDURE_ID = @procedureID)
        		BEGIN
        			SET @requestAlreadyExists = 1;
        		END
        	IF @requestAlreadyExists = 0 --Insert into EXECUTION_SCHEMA
                BEGIN
                    --request inserted
                    INSERT INTO EXECUTION_SCHEMA (EXECUTION_COUNT, STOREDPROCEDURE_ID, CORRESPONDING_EXECUTION_ID, PARENTPROCESS_ID, PARAMETER) VALUES (0, @procedureID, @correspondingID, @parentProcessID, @parameter);
                END
        	ELSE
        	BEGIN
        		RAISERROR ('Entry already exists for stored procedure ID %d', 16, 1, @procedureID);
        	END

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
