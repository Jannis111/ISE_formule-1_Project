USE Formule_1
GO

CREATE OR ALTER TRIGGER TR_volgnummerUnique
ON DEELNEMENDECOUREUR
AFTER insert, update 
AS
BEGIN
IF @@ROWCOUNT = 0
RETURN
SET NOCOUNT ON 
	IF EXISTS	
	(
	SELECT 1
	FROM inserted i INNER JOIN DEELNEMENDECOUREUR D
	ON i.COUREURID = D.COUREURID
	WHERE i.STARTDATUM = D.STARTDATUM AND i.CIRCUITNAAM = D.CIRCUITNAAM
	GROUP BY D.VOLGNUMMER
	HAVING COUNT(D.VOLGNUMMER) > 1
	) 
	BEGIN
		RAISERROR ('The followNumber is supposed to be unique per race.', 16, 1);
	END
END
