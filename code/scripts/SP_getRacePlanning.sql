/*
    Usecase: Deze procedure heeft betrekking tot het usecase " Ophalen Raceplanning".
    Beschrijving:
       Dit stored procedure voegt een raceplanning toe aan de mongodb database.
*/


USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_getRacePlanning
   --define parameters
    @startDatum Date
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

        --create json object
        DECLARE @RacePlanning NVARCHAR(MAX);
        SELECT @RacePlanning = (
            SELECT CONCAT ('RacePlanning/',Year(@startDatum)) AS name,
                   (
                       SELECT * FROM RACE WHERE YEAR(STARTDATUM )= YEAR(@startDatum)
                       FOR JSON PATH, ROOT('data')
                   ) AS data
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
        );
        --send json object to api
        exec SP_sendJsonToApi @RacePlanning;


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
