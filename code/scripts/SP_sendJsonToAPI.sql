/*
    Usecase: Deze procedure heeft betrekking tot alle usecases die data in mongodb willen hebben.
    Beschrijving:
         Dit stored procedure stuurt een JSON object naar een API, door een verbinding te openen.
*/

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_sendJsonToApi
    --Define parameters used in the stored procedure
    @json NVARCHAR(MAX)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

		DECLARE @token INT;
        	DECLARE @ret INT;
        	DECLARE @url NVARCHAR(MAX);
        	DECLARE @data NVARCHAR(MAX) = @json;
        	-- Set the API port, was picked because it wasn't used on any of the developers machines.
        	DECLARE @apiPort INT = 4444;

        	SET @url = 'http://localhost:'+ CAST(@apiPort AS NVARCHAR) + '/';

        	EXEC @ret = sp_OACreate 'MSXML2.ServerXMLHTTP', @token OUT;
        	IF @ret <> 0 RAISERROR('Unable to create HTTP Connection', 10 ,1);

        	-- Open a connection to the specified URL
        	EXEC @ret = sp_OAMethod @token, 'open', NULL, 'POST', @url, 'false';
        	IF @ret <> 0 RAISERROR('Unable to open HTTP connection', 10 ,1);

        	-- Set headers
        	EXEC @ret = sp_OAMethod @token, 'setRequestHeader', NULL, 'Content-Type', 'application/json';
        	IF @ret <> 0 RAISERROR('Unable to set request header', 10 ,1);

        	-- Send the request with JSON payload
        	EXEC @ret = sp_OAMethod @token, 'send', NULL, @data;
        	IF @ret <> 0 RAISERROR('Unable to send request', 10 ,1);

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



