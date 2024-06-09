/* Beschrijving:
        Dit bestand defineerd de verschillende rollen
        die in de database bestaan. Deze rollen zorgen
        ervoor dat niet iedereen alles kan doen in de database
*/

USE Formule_1

CREATE LOGIN F1Beheerder WITH PASSWORD = 'F1Beheerder' 
CREATE LOGIN RaceExpert WITH PASSWORD = 'RaceExpert' 


CREATE USER F1BeheerderUser FROM LOGIN F1Beheerder
CREATE USER RaceExpertUser FROM LOGIN RaceExpert


CREATE ROLE F1BeheerderRole
CREATE ROLE RaceExpertRole

GRANT EXECUTE ON dbo.SP_addCountry TO F1BeheerderRole
GRANT EXECUTE ON dbo.SP_addTeam TO F1BeheerderRole
GRANT EXECUTE ON dbo.SP_addCoureur TO F1BeheerderRole
GRANT EXECUTE ON dbo.SP_addCircuit TO F1BeheerderRole
GRANT EXECUTE ON dbo.SP_addCountry TO F1BeheerderRole
GRANT EXECUTE ON dbo.SP_updateCoureur TO F1BeheerderRole
GRANT EXECUTE ON dbo.SP_deleteThisCoureur TO F1BeheerderRole
GRANT EXECUTE ON dbo.SP_deleteThisDeelnemendeCoureur TO F1BeheerderRole
GRANT EXECUTE ON dbo.SP_deleteLapForThisCoureur TO F1BeheerderRole
GRANT EXECUTE ON dbo.SP_deletePitStopsForThisCoureur TO F1BeheerderRole

GRANT EXECUTE ON dbo.SP_addLap TO RaceExpertRole
GRANT EXECUTE ON dbo.SP_updateDeelnemendeCoureur TO RaceExpertRole
GRANT EXECUTE ON dbo.SP_addDeelnemendeCoureur TO RaceExpertRole
GRANT EXECUTE ON dbo.SP_updateLap TO RaceExpertRole
GRANT EXECUTE ON dbo.SP_addRacePlanning TO RaceExpertRole
GRANT EXECUTE ON dbo.SP_updateRacePlanning TO RaceExpertRole

ALTER ROLE [F1BeheerderRole] ADD MEMBER [F1BeheerderUser]