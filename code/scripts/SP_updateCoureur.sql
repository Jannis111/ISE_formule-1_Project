/*
    Usecase: Deze procedure heeft betrekking tot het usecase "CRUD Coureur".
    Beschrijving:
       Dit stored procedure veranderd data in coureur tabel.
*/


USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_updateCoureur
    --define parameters used in the stored procedure
    @ID int,
    @voornaam varchar(60),
    @achternaam varchar(60),
    @geboortedatum date,
    @geboorteplaats varchar(255),
    @geboorteland varchar(60),
    @nationaliteit varchar(60)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

         -- Controleer of een record met het gegeven ID bestaat
            IF EXISTS (SELECT 1 FROM Coureur WHERE COUREURID = @ID)
            BEGIN
                -- Update het record met het gegeven ID
                UPDATE Coureur
                SET
                    VOORNAAM = @voornaam,
                    ACHTERNAAM = @achternaam,
                    GEBOORTEDATUM = @geboortedatum,
                    GEBOORTEPLAATS = @geboorteplaats,
                    GEBOORTELAND = @geboorteland,
                    NATIONALITEIT = @nationaliteit
                WHERE COUREURID = @ID;
            END
            ELSE
            BEGIN
                -- Voeg een foutmelding toe als het record niet bestaat
                RAISERROR('Record met ID %d bestaat niet.', 16, 1, @ID);
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
