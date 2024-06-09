USE Formule_1
GO
WITH raceResult AS
(
SELECT R.LANDNAAM, R.STARTDATUM, R.EINDDATUM, R.PLAATS, ROC.CIRCUITNAAM, D.COUREURID ,D.TEAM, D.LAP, D.FINISHTIJD
FROM RACE R INNER JOIN RACEOPCIRCUIT ROC
ON R.STARTDATUM = ROC.STARTDATUM
INNER JOIN DEELNEMENDECOUREUR D
ON R.STARTDATUM = D.STARTDATUM
)
SELECT rR.LANDNAAM,rR.STARTDATUM, rR.EINDDATUM, rR.PLAATS, rR.CIRCUITNAAM, rR.TEAM, rR.LAP, rR.FINISHTIJD, C.VOORNAAM, C.ACHTERNAAM
FROM raceResult rR INNER JOIN COUREUR C
ON rR.COUREURID = C.COUREURID





