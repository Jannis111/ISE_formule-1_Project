/*
    Usecase: Deze procedure heeft betrekking tot het usecase "Ophalen van race uitslag".
    Beschrijving:
       Deze stored procedure stuurd een race uitslag naar de API.
*/

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_returnRaceResult
    @circuit nvarchar(60),
    @startdatum DATE
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
            DECLARE @RaceUitslagen NVARCHAR(MAX);
            WITH raceResult AS
            (
            SELECT R.CIRCUITNAAM, R.STARTDATUM, R.EINDDATUM, D.COUREURID ,D.TEAMNAAM, D.LAP, D.FINISHTIJD
            FROM RACE R
            INNER JOIN DEELNEMENDECOUREUR D
            ON R.STARTDATUM = D.STARTDATUM AND R.CIRCUITNAAM = D.CIRCUITNAAM AND @startdatum = R.STARTDATUM
            )
            SELECT @RaceUitslagen = (
                --generate unique identifier
                SELECT CONCAT (@circuit,'/',@startdatum) AS name,
                       (
                           SELECT rR.CIRCUITNAAM, rR.STARTDATUM, rR.EINDDATUM, rR.TEAMNAAM, rR.LAP, rR.FINISHTIJD, C.VOORNAAM, C.ACHTERNAAM
                           FROM raceResult rR
                           INNER JOIN COUREUR C ON rR.COUREURID = C.COUREURID
                           FOR JSON PATH, ROOT('data')
                       ) AS data
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
            );

            --send json object to api
            EXEC SP_sendJsonToApi @RaceUitslagen;
            ;
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
