USE [Formule_1]
GO

INSERT INTO [dbo].[LAND]
           ([LANDNAAM])
     VALUES
           ('Nederland'),('België'),('United States'),('Japan'),('China'),('Brazilië'),('Mexico'),('Oostenrijk');
GO

INSERT INTO [dbo].[COUREUR] ([COUREURID],[VOORNAAM], [ACHTERNAAM])
	VALUES
			(1, 'Max', 'Verstappen'),
			(2, 'Lewis', 'Hamilton'),
			(3, 'Fernando', 'Alonso'),
			(4, 'Lando', 'Norris');

INSERT INTO [dbo].[CIRCUIT] ([CIRCUITNAAM])
	VALUES
			('Miami International Autodrome'),
			('Red Bull Ring'),
			('Circuit Zandvoort'),
			('Autodrome Hermanos Rodriguez')

INSERT INTO [dbo].[RACE]([LANDNAAM],[PLAATS],[STARTDATUM],[EINDDATUM])
	VALUES
			('Nederland', 'Zandvoort', '1-1-2000', '3-1-2000'),
			('United States', 'Miami', '3-1-2000', '6-1-2000'),
			('België', 'spa', '6-1-2003', '9-1-2003')

INSERT INTO [dbo].[PUNTENSYSTEEM] ([EISVANPUNTEN],[PUNTEN])
	VALUES
			('Eerste plek', 25),
			('Tweede plek',18),
			('Derde plek',15),
			('Vierde plek', 12),
			('Vijfde plek', 10),
			('Zesde plek', 8),
			('Zevende plek', 6),
			('Achtste plek', 4),
			('Negende plek', 2),
			('Tiende plek', 1),
			('Snelsde ronden', 1)

INSERT INTO [dbo].[DEELNEMENDECOUREUR] ([COUREURID],[STARTDATUM],[TEAM],[FINISHTIJD],[LAP],[LANDNAAM])
	VALUES
			(1, '1-1-2000', 'Red bull', 5880000, 47, 'Nederland'),
			(2, '3-1-2000', 'Mercedes', 5880000, 58, 'United States'),
			(3, '3-1-2000', 'McLaren', 5880000, 53, 'United States'),
			(3, '6-1-2003', 'McLaren', 5880000, 53, 'België');

INSERT INTO [dbo].[RACEOPCIRCUIT] ([CIRCUITNAAM],[LANDNAAM],[STARTDATUM])
	VALUES 
			('Circuit Zandvoort', 'Nederland', '1-1-2000'),
			('Miami International Autodrome','United States','3-1-2000')
