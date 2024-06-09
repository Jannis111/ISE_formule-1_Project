/*
    Beschrijving:
        Dit script bevat de unittests voor de stored procedures in de Formule_1 database.
*/


USE Formule_1
GO
--test voor constriant opdracht CKStartdatumKleinerEinddatum ? check-constraint op de tabel Race: startdatum < einddatum.
EXECUTE tSQLt.NewTestClass [CKStartdatumKleinerEinddatum]
GO

CREATE or ALTER PROC [CKStartdatumKleinerEinddatum].[Test of er een error wordt gegooid als de startdatum later is dan de einddatum.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.RACE'
	EXEC tSQLt.ApplyConstraint @TableName='dbo.RACE', @ConstraintName = 'CKStartdatumKleinerEinddatum'

	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%CKStartdatumKleinerEinddatum%'
	INSERT INTO RACE(STARTDATUM, EINDDATUM)
	VALUES('2022-12-01', '2021-12-01')
	END
GO

CREATE or ALTER PROC [CKStartdatumKleinerEinddatum].[Test de main succesion flow.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.RACE'
	EXEC tSQLt.ApplyConstraint @TableName='dbo.RACE', @ConstraintName = 'CKStartdatumKleinerEinddatum'

	EXEC tSQLt.ExpectNoException
	INSERT INTO RACE(STARTDATUM, EINDDATUM)
	VALUES('2021-12-01', '2022-12-01')
	END
GO

CREATE or ALTER PROC [CKStartdatumKleinerEinddatum].[Test of die slaagt als die op de zelfde dag eindigt.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.RACE'
	EXEC tSQLt.ApplyConstraint @TableName='dbo.RACE', @ConstraintName = 'CKStartdatumKleinerEinddatum'

	EXEC tSQLt.ExpectNoException
	INSERT INTO RACE(STARTDATUM, EINDDATUM)
	VALUES('2021-12-01', '2021-12-01')
	END
GO
EXEC tSQLt.RunTestClass CKStartdatumKleinerEinddatum

--unit test voor trigger TR_enforce_coureur_count ? Trigger op tabel deelnemendeCoureur die checkt of 20 coureurs zijn per Race op startdatum.
EXECUTE tSQLt.NewTestClass [TR_enforce_coureur_count]
GO
CREATE or ALTER PROC [TR_enforce_coureur_count].[Test of er een error wordt gegooigd wanneer er minder dan 20 racers zijn.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'
	EXEC tSQLt.FakeTable @TableName='dbo.RACE'

	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_enforce_coureur_count'

	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%Een race moet ten minste 20 coureurs bevatten.%'

	INSERT INTO RACE(CIRCUITNAAM, STARTDATUM)
	VALUES('Zandvoort', '2000-06-01')

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, CIRCUITNAAM, STARTDATUM)
	VALUES(1, 'Zandvoort', '2000-06-01'),
	(1, 'Zandvoort', '2000-06-01'),
	(2, 'Zandvoort', '2000-06-01'),
	(3, 'Zandvoort', '2000-06-01'),
	(4, 'Zandvoort', '2000-06-01'),
	(5, 'Zandvoort', '2000-06-01'),
	(6, 'Zandvoort', '2000-06-01'),
	(7, 'Zandvoort', '2000-06-01')
END
GO

CREATE or ALTER PROC [TR_enforce_coureur_count].[Test of er een error wordt gegooigd wanneer er minder dan 20 racers zijn.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'
	EXEC tSQLt.FakeTable @TableName='dbo.RACE'

	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_enforce_coureur_count'

	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%Een race moet ten minste 20 coureurs bevatten.%'

	INSERT INTO RACE(CIRCUITNAAM, STARTDATUM)
	VALUES('Zandvoort', '2000-06-01')

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, CIRCUITNAAM, STARTDATUM)
	VALUES(1, 'Zandvoort', '2000-06-01'),
	(2, 'Zandvoort', '2000-06-01'),
	(3, 'Zandvoort', '2000-06-01'),
	(4, 'Zandvoort', '2000-06-01'),
	(5, 'Zandvoort', '2000-06-01'),
	(6, 'Zandvoort', '2000-06-01'),
	(7, 'Zandvoort', '2000-06-01')
END
GO

CREATE or ALTER PROC [TR_enforce_coureur_count].[Test of er een error wordt gegooigd wanneer er meer dan 20 racers zijn.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'
	EXEC tSQLt.FakeTable @TableName='dbo.RACE'

	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_enforce_coureur_count'

	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%Een race moet ten minste 20 coureurs bevatten.%'

	INSERT INTO RACE(CIRCUITNAAM, STARTDATUM)
	VALUES('Zandvoort', '2000-06-01')

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, CIRCUITNAAM, STARTDATUM)
	VALUES(1, 'Zandvoort', '2000-06-01'),
	(2, 'Zandvoort', '2000-06-01'),
	(3, 'Zandvoort', '2000-06-01'),
	(4, 'Zandvoort', '2000-06-01'),
	(5, 'Zandvoort', '2000-06-01'),
	(6, 'Zandvoort', '2000-06-01'),
	(7, 'Zandvoort', '2000-06-01'),
	(8, 'Zandvoort', '2000-06-01'),
	(9, 'Zandvoort', '2000-06-01'),
	(10, 'Zandvoort', '2000-06-01'),
	(11, 'Zandvoort', '2000-06-01'),
	(12, 'Zandvoort', '2000-06-01'),
	(13, 'Zandvoort', '2000-06-01'),
	(14, 'Zandvoort', '2000-06-01'),
	(15, 'Zandvoort', '2000-06-01'),
	(16, 'Zandvoort', '2000-06-01'),
	(17, 'Zandvoort', '2000-06-01'),
	(18, 'Zandvoort', '2000-06-01'),
	(19, 'Zandvoort', '2000-06-01'),
	(20, 'Zandvoort', '2000-06-01'),
	(21, 'Zandvoort', '2000-06-01')
END
GO


CREATE or ALTER PROC [TR_enforce_coureur_count].[Test de main succes scenario.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'
	EXEC tSQLt.FakeTable @TableName='dbo.RACE'

	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_enforce_coureur_count'

	EXEC tSQLt.ExpectNoException

	INSERT INTO RACE(CIRCUITNAAM, STARTDATUM)
	VALUES('Zandvoort', '2000-06-01'),
	('Yas marinas', '2000-07-01')

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, CIRCUITNAAM, STARTDATUM)
	VALUES(1, 'Zandvoort', '2000-06-01'),
	(2, 'Zandvoort', '2000-06-01'),
	(3, 'Zandvoort', '2000-06-01'),
	(4, 'Zandvoort', '2000-06-01'),
	(5, 'Zandvoort', '2000-06-01'),
	(6, 'Zandvoort', '2000-06-01'),
	(7, 'Zandvoort', '2000-06-01'),
	(8, 'Zandvoort', '2000-06-01'),
	(9, 'Zandvoort', '2000-06-01'),
	(10, 'Zandvoort', '2000-06-01'),
	(11, 'Zandvoort', '2000-06-01'),
	(12, 'Zandvoort', '2000-06-01'),
	(13, 'Zandvoort', '2000-06-01'),
	(14, 'Yas marinas', '2000-07-01'),
	(15, 'Zandvoort', '2000-06-01'),
	(16, 'Zandvoort', '2000-06-01'),
	(17, 'Zandvoort', '2000-06-01'),
	(18, 'Zandvoort', '2000-06-01'),
	(19, 'Zandvoort', '2000-06-01'),
	(20, 'Zandvoort', '2000-06-01'),
	(1, 'Yas marinas', '2000-07-01'),
	(2, 'Yas marinas', '2000-07-01'),
	(3, 'Yas marinas', '2000-07-01'),
	(4, 'Yas marinas', '2000-07-01'),
	(5, 'Yas marinas', '2000-07-01'),
	(6, 'Yas marinas', '2000-07-01'),
	(7, 'Yas marinas', '2000-07-01'),
	(8, 'Yas marinas', '2000-07-01'),
	(9, 'Yas marinas', '2000-07-01'),
	(10, 'Yas marinas', '2000-07-01'),
	(11, 'Yas marinas', '2000-07-01'),
	(12, 'Yas marinas', '2000-07-01'),
	(13, 'Yas marinas', '2000-07-01'),
	(14, 'Zandvoort', '2000-06-01'),
	(15, 'Yas marinas', '2000-07-01'),
	(16, 'Yas marinas', '2000-07-01'),
	(17, 'Yas marinas', '2000-07-01'),
	(18, 'Yas marinas', '2000-07-01'),
	(19, 'Yas marinas', '2000-07-01'),
	(20, 'Yas marinas', '2000-07-01')
END
GO

EXEC tSQLt.RunTestClass [TR_enforce_coureur_count]
GO

-- Create the test class
EXEC tSQLt.NewTestClass [SP_InsertCircuit];
GO

-- Create or alter the stored procedure for the test
CREATE OR ALTER PROCEDURE [SP_addCircuit].[Test of een record word geinsert wanneer alles klopt]
AS
BEGIN
    -- Fake the necessary tables
    EXEC tSQLt.FakeTable @TableName='dbo.CIRCUIT';
    EXEC tSQLt.FakeTable @TableName='dbo.LAND';
	INSERT INTO LAND (LANDNAAM) VALUES ('TestLand');
    EXEC dbo.SP_addCircuit @newCircuitName = 'TestBaan', @newCircuitCity = 'TestPlaatsnaam', @newCircuitCountry = 'TestLand';
END
GO

---RUN TEST
EXEC tSQLt.RunTestClass [SP_InsertCircuit]
GO

--Test the procedure SP_addCountry procedure adds new country to the table LAND.
EXECUTE tSQLt.NewTestClass [SP_addCountry]
GO

CREATE or ALTER PROC [SP_addCountry].[Test the main succes scenario.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.LAND'

	EXEC tSQLt.ExpectNoException

	INSERT INTO LAND(LANDNAAM)
	VALUES('Nederland')


	EXEC dbo.SP_addCountry @landNaam = 'Verenigde Staten'

	END
GO

exec tSQLt.RunTestClass SP_addCountry
GO

exec tSQLt.RunTestClass SP_addTeam
GO

--Test the procedure SP_addCountry � procedure adds new country to the table LAND.
EXECUTE tSQLt.NewTestClass [SP_addTeam]
GO

CREATE or ALTER PROC [SP_addTeam].[Test the main succes scenario.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.TEAM'

	EXEC tSQLt.ExpectNoException

	INSERT INTO TEAM(TEAMNAAM, LANDNAAM)
	VALUES('Red bull', 'Oostenrijk' )


	EXEC dbo.SP_addTeam @teamNaam = 'ferrari', @landNaam = 'Itali�'

	END
GO

exec tSQLt.RunTestClass SP_addTeam
GO

EXECUTE tSQLt.NewTestClass [SP_addCoureur]
GO

CREATE or ALTER PROC [SP_addCoureur].[Test the main succes scenario.]

AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.COUREUR'

	EXEC tSQLt.ExpectNoException

	INSERT INTO COUREUR(VOORNAAM,ACHTERNAAM,GEBOORTEDATUM,GEBOORTEPLAATS,GEBOORTELAND,NATIONALITEIT)
	VALUES('Max', 'Verstappen', 2000-01-01, 'hassalt', 'Belgi�', 'Nederland')


	EXEC dbo.SP_addCoureur @voornaam = 'Max', @achternaam = 'Verstappen', @geboortedatum = '2000-01-01', @geboorteplaats = 'hassalt', @geboorteland = 'Belgi�', @nationaliteit = 'Nederland';

	END
GO

exec tSQLt.RunTestClass SP_addCoureur
GO

--Test the trigger TR_volgnummerUnique � trigger prevents follow number from not being unique per race.
EXECUTE tSQLt.NewTestClass [TR_volgnummerUnique]
GO

CREATE or ALTER PROC [TR_volgnummerUnique].[Test if the trigger will allow an unique follow number per race single line]
--Test the procedure SP_updateDeelnemendeCoureur � procedure update the deelnemendeCoureur tabel.
EXECUTE tSQLt.NewTestClass [SP_updateDeelnemendeCoureur]
GO
CREATE or ALTER PROC [SP_updateDeelnemendeCoureur].[Test the main succes scenario.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, VOLGNUMMER, CIRCUITNAAM, STARTDATUM)
	VALUES(1, 1, 'circuit', '2000-06-01'),
	(2, 2, 'circuit', '2000-06-01'),
	(1, 1, 'circuit', '2001-06-01'),
	(1, 1, 'different circuit', '2000-06-01')

	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_volgnummerUnique'

	EXEC tSQLt.ExpectNoException

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, VOLGNUMMER, CIRCUITNAAM, STARTDATUM)
	VALUES(3, 3, 'circuit', '2000-06-01')
	INSERT INTO DEELNEMENDECOUREUR(COUREURID, CIRCUITNAAM, STARTDATUM, TEAMNAAM, FINISHTIJD, PUNTEN, VOLGNUMMER)
	VALUES(1, 'Circuit Zandvoort', '2000-01-01', 'team', 1000, 20, 1)

		EXEC tSQLt.ExpectNoException

	EXEC dbo.SP_updateDeelnemendeCoureur @coureurID = 1, @circuitName = 'Circuit Zandvoort', @startDate = '2000-01-01', @teamName = 'test', @finishTime = 2000, @points = 10, @followNummer = 1




EXECUTE tSQLt.NewTestClass [SP_updateCoureur]
GO

CREATE or ALTER PROC [SP_updateCoureur].[Test the main succes scenario.]

AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.COUREUR'

	EXEC tSQLt.ExpectNoException

	INSERT INTO COUREUR(COUREURID,VOORNAAM,ACHTERNAAM,GEBOORTEDATUM,GEBOORTEPLAATS,GEBOORTELAND,NATIONALITEIT)
	VALUES(1, 'Max', 'Verstappen', 2000-01-01, 'hassalt', 'Belgi�', 'Nederland')

	UPDATE Coureur
        SET
            VOORNAAM = 'Lando',
            ACHTERNAAM = 'Norris',
            GEBOORTEDATUM = 2000-01-01,
            GEBOORTEPLAATS = 'Monaco',
            GEBOORTELAND = 'Monaco',
            NATIONALITEIT = 'Monaco'
        WHERE COUREURID = 1

	EXEC dbo.SP_updateCoureur @ID = 1, @voornaam = 'Lando', @achternaam = 'Norris', @geboortedatum = '2000-01-01', @geboorteplaats = 'Monaco', @geboorteland = 'Monaco', @nationaliteit = 'Monaco';

	END
GO

CREATE or ALTER PROC [TR_volgnummerUnique].[Test if the trigger will allow an unique follow number per race multiline]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, VOLGNUMMER, CIRCUITNAAM, STARTDATUM)
	VALUES(1, 1, 'circuit', '2000-06-01'),
	(2, 2, 'circuit', '2000-06-01'),
	(1, 1, 'circuit', '2001-06-01'),
	(1, 1, 'different circuit', '2000-06-01')

	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_volgnummerUnique'

	EXEC tSQLt.ExpectNoException

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, VOLGNUMMER, CIRCUITNAAM, STARTDATUM)
	VALUES(3, 3, 'circuit', '2000-06-01'),
	(4, 4, 'circuit', '2000-06-01')

EXEC tSQLt.RunTestClass SP_updateDeelnemendeCoureur
GO


--Test the procedure updateLap � procedure update the laptijd.
EXECUTE tSQLt.NewTestClass [SP_update]
GO

CREATE or ALTER PROC [SP_updateLap].[Test if the updates is correct.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.LAP'


	INSERT INTO LAP(CIRCUITNAAM, COUREURID, STARTDATUM, HUIDIGELAP, LAPTIJD)
	VALUES('Circuit Zandvoort', 1, '2000-01-01', 1, 1000)

	CREATE TABLE EXPECTED(
	CIRCUITNAAM NVARCHAR(60),
	COUREURID INT,
	STARTDATUM DATETIME,
	HUIDIGELAP INT,
	LAPTIJD BIGINT
	)

	
	INSERT INTO EXPECTED(CIRCUITNAAM, COUREURID, STARTDATUM, HUIDIGELAP, LAPTIJD)
	VALUES('Circuit Zandvoort', 1, '2000-01-01', 1, 2000)

	EXEC dbo.SP_updateLap @circuitName = 'Circuit Zandvoort', @coureurID = 1, @startDate = '2000-01-01', @currentLap = 1, @lapTime = 2000

	EXEC tSQLt.AssertEqualsTable @Expected = 'EXPECTED', @Actual = 'LAP'
exec tSQLt.RunTestClass SP_updateCoureur
GO


exec tSQLt.NewTestClass SP_addRacePlanning
GO


CREATE or ALTER PROC [SP_addRacePlanning].[Test the main succes scenario.]

AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.LAND'
	EXEC tSQLt.FakeTable @TableName='dbo.CIRCUIT'
	EXEC tSQLt.FakeTable @TableName='dbo.RACE'

	EXEC tSQLt.ExpectNoException

	INSERT INTO LAND (LANDNAAM) VALUES ('Nederland');

	INSERT INTO CIRCUIT (CIRCUITNAAM, LANDNAAM, PLAATS) VALUES ('Circuit Zandvoort', 'Nederland', 'Zandvoort')

	INSERT INTO Race (CIRCUITNAAM, STARTDATUM, EINDDATUM, AANTALLAPS) VALUES ('Circuit Zandvoort', '2000-01-01', '2000-01-03', 10 );

	EXEC dbo.SP_addRacePlanning @Circuitnaam = 'Circuit Zanvoort', @Startdatum  = '2000-01-01', @Einddatum = '2000-01-03', @aantalLaps = 5;

	END
GO

CREATE or ALTER PROC [TR_volgnummerUnique].[Test if the trigger will throw an error when the follow number is not unique]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, VOLGNUMMER, CIRCUITNAAM, STARTDATUM)
	VALUES(1, 1, 'circuit', '2000-06-01'),
	(2, 2, 'circuit', '2000-06-01'),
	(1, 1, 'circuit', '2001-06-01'),
	(1, 1, 'different circuit', '2000-06-01')

	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_volgnummerUnique'

	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%The followNumber is supposed to be unique per race.%'

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, VOLGNUMMER, CIRCUITNAAM, STARTDATUM)
	VALUES(3, 3, 'circuit', '2000-06-01'),
	(3, 1, 'circuit', '2000-06-01')

	END
GO

EXEC tSQLt.RunTestClass TR_volgnummerUnique
GO

--Test the trigger TR_deelnemendeCoureurOuderDanVijftien � trigger prevents deelnemendeCoureur from being younger than 16 .
EXECUTE tSQLt.NewTestClass [TR_deelnemendeCoureurOuderDanVijftien]
GO

CREATE or ALTER PROC [TR_deelnemendeCoureurOuderDanVijftien].[Test if the trigger will allow a deelnemendeCoureur which is older than 15 single line]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'
	EXEC tSQLt.FakeTable @TableName='dbo.COUREUR'

	INSERT INTO COUREUR(COUREURID, GEBOORTEDATUM)
	VALUES(1, '2000-06-01')

	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_deelnemendeCoureurOuderDanVijftien'

	EXEC tSQLt.ExpectNoException

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, STARTDATUM)
	VALUES(1, '2017-06-01')
CREATE or ALTER PROC [SP_updateLap].[Test the main succes scenario.]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.LAP'

	INSERT INTO LAP(CIRCUITNAAM, COUREURID, STARTDATUM, HUIDIGELAP, LAPTIJD)
	VALUES('Circuit Zandvoort', 1, '2000-01-01', 1, 1000)

		EXEC tSQLt.ExpectNoException

	EXEC dbo.SP_updateLap @circuitName = 'Circuit Zandvoort', @coureurID = 1, @startDate = '2000-01-01', @currentLap = 1, @lapTime = 2000

exec tSQLt.RunTestClass SP_addRacePlanning
GO




EXECUTE tSQLt.NewTestClass [SP_updateRacePlanning]
GO

CREATE or ALTER PROC [SP_updateRacePlanning].[Test the main succes scenario.]

AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.LAND'
	EXEC tSQLt.FakeTable @TableName='dbo.CIRCUIT'
	EXEC tSQLt.FakeTable @TableName='dbo.RACE'

	EXEC tSQLt.ExpectNoException

	INSERT INTO LAND(LANDNAAM)VALUES('Nederland');
	INSERT INTO CIRCUIT(CIRCUITNAAM, LANDNAAM, PLAATS) VALUES ('Circuit Zandvoort', 'Nederland', 'Zandvoort');
	INSERT INTO RACE(CIRCUITNAAM,STARTDATUM, EINDDATUM, AANTALLAPS) VALUES ('Circuit Zandvoort', '2000-01-01' , '2000-01-03', 5)

	UPDATE RACE
        SET
            CIRCUITNAAM = 'Zandvoort' ,
			EINDDATUM = '2000-01-03',
			AANTALLAPS = 10
		WHERE STARTDATUM = '2000-01-01'

	EXEC dbo.SP_updateRacePlanning @circuitNaam = 'Circuit Zandvoort', @startDatum = '2000-01-01', @eindDatum = '2000-01-03', @aantalLaps = 10;

	END
GO

CREATE or ALTER PROC [TR_deelnemendeCoureurOuderDanVijftien].[Test if the trigger will allow a deelnemendeCoureur which is older than 15 multiline]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'
	EXEC tSQLt.FakeTable @TableName='dbo.COUREUR'

	INSERT INTO COUREUR(COUREURID, GEBOORTEDATUM)
	VALUES(1, '2000-06-01')
	INSERT INTO COUREUR(COUREURID, GEBOORTEDATUM)
	VALUES(2, '2000-06-01')

	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_deelnemendeCoureurOuderDanVijftien'

	EXEC tSQLt.ExpectNoException

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, STARTDATUM)
	VALUES(1, '2017-06-01')
	INSERT INTO DEELNEMENDECOUREUR(COUREURID, STARTDATUM)
	VALUES(2, '2017-06-01')

	END
GO

CREATE or ALTER PROC [TR_deelnemendeCoureurOuderDanVijftien].[Test if the trigger will raise an error when the deelNemendeCoureur is younger than 16]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'
	EXEC tSQLt.FakeTable @TableName='dbo.COUREUR'

	INSERT INTO COUREUR(COUREURID, GEBOORTEDATUM)
	VALUES(1, '2017-06-01')


	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_deelnemendeCoureurOuderDanVijftien'

	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%A coureur must be 16 or older to participate in a race.%'

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, STARTDATUM)
	VALUES(1, '2000-06-01')

	END
GO

CREATE or ALTER PROC [TR_deelnemendeCoureurOuderDanVijftien].[Test if the trigger will raise an error when the deelNemendeCoureur is younger than 16 in months but not in years]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.DEELNEMENDECOUREUR'
	EXEC tSQLt.FakeTable @TableName='dbo.COUREUR'

	INSERT INTO COUREUR(COUREURID, GEBOORTEDATUM)
	VALUES(1, '2000-12-31')


	EXEC tSQLt.ApplyTrigger @TableName='dbo.DEELNEMENDECOUREUR', @TriggerName = 'TR_deelnemendeCoureurOuderDanVijftien'

	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%A coureur must be 16 or older to participate in a race.%'

	INSERT INTO DEELNEMENDECOUREUR(COUREURID, STARTDATUM)
	VALUES(1, '2016-01-01')

	END
GO

EXEC tSQLt.RunTestClass TR_deelnemendeCoureurOuderDanVijftien

EXEC tSQLt.RunTestClass SP_updateLap
exec tSQLt.RunTestClass [SP_updateRacePlanning]
GO
