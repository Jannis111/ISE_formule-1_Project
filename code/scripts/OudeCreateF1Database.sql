/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     14/05/2024 12:05:01                          */
/*==============================================================*/
USE MASTER
DROP DATABASE IF EXISTS Formule_1
GO
CREATE DATABASE Formule_1
GO
USE Formule_1
GO
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CIRCUIT') and o.name = 'FK_CIRCUIT_CIRCUITIN_LAND')
alter table CIRCUIT
   drop constraint FK_CIRCUIT_CIRCUITIN_LAND
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DEELNEMENDECOUREUR') and o.name = 'FK_DEELNEME_DEELNEMEN_COUREUR')
alter table DEELNEMENDECOUREUR
   drop constraint FK_DEELNEME_DEELNEMEN_COUREUR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DEELNEMENDECOUREUR') and o.name = 'FK_DEELNEME_DEELNEMEN_RACE')
alter table DEELNEMENDECOUREUR
   drop constraint FK_DEELNEME_DEELNEMEN_RACE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DEELNEMENDECOUREUR') and o.name = 'FK_DEELNEME_DEELNEMEN_TEAM')
alter table DEELNEMENDECOUREUR
   drop constraint FK_DEELNEME_DEELNEMEN_TEAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RACE') and o.name = 'FK_RACE_RACEOPCIR_CIRCUIT')
alter table RACE
   drop constraint FK_RACE_RACEOPCIR_CIRCUIT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CIRCUIT')
            and   name  = 'CIRCUITINLAND_FK'
            and   indid > 0
            and   indid < 255)
   drop index CIRCUIT.CIRCUITINLAND_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CIRCUIT')
            and   type = 'U')
   drop table CIRCUIT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COUREUR')
            and   type = 'U')
   drop table COUREUR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DEELNEMENDECOUREUR')
            and   name  = 'DEELNEMENDECOUREURINTEAM_FK'
            and   indid > 0
            and   indid < 255)
   drop index DEELNEMENDECOUREUR.DEELNEMENDECOUREURINTEAM_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DEELNEMENDECOUREUR')
            and   name  = 'DEELNEMENDECOUREURINRACE_FK'
            and   indid > 0
            and   indid < 255)
   drop index DEELNEMENDECOUREUR.DEELNEMENDECOUREURINRACE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DEELNEMENDECOUREUR')
            and   name  = 'DEELNEMENDECOUREURBEVATCOUREUR_FK'
            and   indid > 0
            and   indid < 255)
   drop index DEELNEMENDECOUREUR.DEELNEMENDECOUREURBEVATCOUREUR_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DEELNEMENDECOUREUR')
            and   type = 'U')
   drop table DEELNEMENDECOUREUR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LAND')
            and   type = 'U')
   drop table LAND
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PUNTENSYSTEEM')
            and   type = 'U')
   drop table PUNTENSYSTEEM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RACE')
            and   name  = 'RACEOPCIRCUIT_FK'
            and   indid > 0
            and   indid < 255)
   drop index RACE.RACEOPCIRCUIT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RACE')
            and   type = 'U')
   drop table RACE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEAM')
            and   type = 'U')
   drop table TEAM
go

if exists(select 1 from systypes where name='BESCHRIJVING')
   drop type BESCHRIJVING
go

if exists(select 1 from systypes where name='DATUM')
   drop type DATUM
go

if exists(select 1 from systypes where name='ID')
   drop type ID
go

if exists(select 1 from systypes where name='LAP')
   drop type LAP
go

if exists(select 1 from systypes where name='NAAM')
   drop type NAAM
go

if exists(select 1 from systypes where name='PUNTEN')
   drop type PUNTEN
go

if exists(select 1 from systypes where name='TIJD')
   drop type TIJD
go

/*==============================================================*/
/* Domain: BESCHRIJVING                                         */
/*==============================================================*/
create type BESCHRIJVING
   from varchar(255)
go

/*==============================================================*/
/* Domain: DATUM                                                */
/*==============================================================*/
create type DATUM
   from datetime
go

/*==============================================================*/
/* Domain: ID                                                   */
/*==============================================================*/
create type ID
   from int
go

/*==============================================================*/
/* Domain: LAP                                                  */
/*==============================================================*/
create type LAP
   from int
go

/*==============================================================*/
/* Domain: NAAM                                                 */
/*==============================================================*/
create type NAAM
   from varchar(60)
go

/*==============================================================*/
/* Domain: PUNTEN                                               */
/*==============================================================*/
create type PUNTEN
   from int
go

/*==============================================================*/
/* Domain: TIJD                                                 */
/*==============================================================*/
create type TIJD
   from bigint
go

/*==============================================================*/
/* Table: CIRCUIT                                               */
/*==============================================================*/
create table CIRCUIT (
   CIRCUITNAAM          NAAM                 not null,
   LANDNAAM             NAAM                 not null,
   PLAATS               NAAM                 not null,
   constraint PK_CIRCUIT primary key (CIRCUITNAAM)
)
go

/*==============================================================*/
/* Index: CIRCUITINLAND_FK                                      */
/*==============================================================*/
create index CIRCUITINLAND_FK on CIRCUIT (
LANDNAAM ASC
)
go

/*==============================================================*/
/* Table: COUREUR                                               */
/*==============================================================*/
create table COUREUR (
   COUREURID            ID                   not null,
   VOORNAAM             NAAM                 not null,
   ACHTERNAAM           NAAM                 not null,
   constraint PK_COUREUR primary key (COUREURID)
)
go

/*==============================================================*/
/* Table: DEELNEMENDECOUREUR                                    */
/*==============================================================*/
create table DEELNEMENDECOUREUR (
   COUREURID            ID                   not null,
   CIRCUITNAAM          NAAM                 not null,
   STARTDATUM           DATUM                not null,
   TEAMNAAM             NAAM                 not null,
   LAP                  LAP                  null,
   FINISHTIJD           TIJD                 null,
   constraint PK_DEELNEMENDECOUREUR primary key (CIRCUITNAAM, COUREURID, STARTDATUM)
)
go

/*==============================================================*/
/* Index: DEELNEMENDECOUREURBEVATCOUREUR_FK                     */
/*==============================================================*/
create index DEELNEMENDECOUREURBEVATCOUREUR_FK on DEELNEMENDECOUREUR (
COUREURID ASC
)
go

/*==============================================================*/
/* Index: DEELNEMENDECOUREURINRACE_FK                           */
/*==============================================================*/
create index DEELNEMENDECOUREURINRACE_FK on DEELNEMENDECOUREUR (
CIRCUITNAAM ASC,
STARTDATUM ASC
)
go

/*==============================================================*/
/* Index: DEELNEMENDECOUREURINTEAM_FK                           */
/*==============================================================*/
create index DEELNEMENDECOUREURINTEAM_FK on DEELNEMENDECOUREUR (
TEAMNAAM ASC
)
go

/*==============================================================*/
/* Table: LAND                                                  */
/*==============================================================*/
create table LAND (
   LANDNAAM             NAAM                 not null,
   constraint PK_LAND primary key (LANDNAAM)
)
go

/*==============================================================*/
/* Table: PUNTENSYSTEEM                                         */
/*==============================================================*/
create table PUNTENSYSTEEM (
   PUNTID               ID                   not null,
   PUNTEN               PUNTEN               not null,
   BESCHRIJVING         BESCHRIJVING         not null,
   constraint PK_PUNTENSYSTEEM primary key (PUNTID)
)
go

/*==============================================================*/
/* Table: RACE                                                  */
/*==============================================================*/
create table RACE (
   CIRCUITNAAM          NAAM                 not null,
   STARTDATUM           DATUM                not null,
   EINDDATUM            DATUM                null,
   constraint PK_RACE primary key (CIRCUITNAAM, STARTDATUM)
)
go

/*==============================================================*/
/* Index: RACEOPCIRCUIT_FK                                      */
/*==============================================================*/
create index RACEOPCIRCUIT_FK on RACE (
CIRCUITNAAM ASC
)
go

/*==============================================================*/
/* Table: TEAM                                                  */
/*==============================================================*/
create table TEAM (
   TEAMNAAM             NAAM                 not null,
   constraint PK_TEAM primary key (TEAMNAAM)
)
go

alter table CIRCUIT
   add constraint FK_CIRCUIT_CIRCUITIN_LAND foreign key (LANDNAAM)
      references LAND (LANDNAAM)
go

alter table DEELNEMENDECOUREUR
   add constraint FK_DEELNEME_DEELNEMEN_COUREUR foreign key (COUREURID)
      references COUREUR (COUREURID)
go

alter table DEELNEMENDECOUREUR
   add constraint FK_DEELNEME_DEELNEMEN_RACE foreign key (CIRCUITNAAM, STARTDATUM)
      references RACE (CIRCUITNAAM, STARTDATUM)
go

alter table DEELNEMENDECOUREUR
   add constraint FK_DEELNEME_DEELNEMEN_TEAM foreign key (TEAMNAAM)
      references TEAM (TEAMNAAM)
go

alter table RACE
   add constraint FK_RACE_RACEOPCIR_CIRCUIT foreign key (CIRCUITNAAM)
      references CIRCUIT (CIRCUITNAAM)
go

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
			(4, 'Lando', 'Norris'),
			(5, 'Fernando', 'Alonso'),
			(6, 'Fernando', 'Alonso'),
			(7, 'Fernando', 'Alonso'),
			(8, 'Fernando', 'Alonso'),
			(9, 'Fernando', 'Alonso'),
			(10, 'Fernando', 'Alonso'),
			(11, 'Fernando', 'Alonso'),
			(12, 'Fernando', 'Alonso'),
			(13, 'Fernando', 'Alonso'),
			(14, 'Fernando', 'Alonso'),
			(15, 'Fernando', 'Alonso'),
			(16, 'Fernando', 'Alonso'),
			(17, 'Fernando', 'Alonso'),
			(18, 'Fernando', 'Alonso'),
			(19, 'Fernando', 'Alonso'),
			(20, 'Fernando', 'Alonso');

GO

INSERT INTO [dbo].[TEAM] ([TEAMNAAM])
	VALUES
			('Red bull'),
			('Mercedes'),
			('McLaren'),
			('Ferrari')
GO

INSERT INTO [dbo].[CIRCUIT] ([CIRCUITNAAM], [LANDNAAM],[PLAATS])
	VALUES
			('Miami International Autodrome', 'United States', 'Miami'),
			('Red Bull Ring', 'Oostenrijk', 'Spielburg'),
			('Circuit Zandvoort', 'Nederland', 'Zandvoort'),
			('Autodrome Hermanos Rodriguez', 'Mexico', 'Mexico-Stad')
GO

INSERT INTO [dbo].[RACE]([CIRCUITNAAM],[STARTDATUM],[EINDDATUM])
	VALUES
			('Circuit Zandvoort', '1-1-2000', '3-1-2000'),
			('Circuit Zandvoort', '3-1-2000', '6-1-2000'),
			('Circuit Zandvoort', '6-1-2003', '9-1-2003')
GO

INSERT INTO [dbo].[PUNTENSYSTEEM] ([PUNTID],[BESCHRIJVING],[PUNTEN])
	VALUES
			(1, 'Eerste plek', 25),
			(2, 'Tweede plek',18),
			(3, 'Derde plek',15),
			(4, 'Vierde plek', 12),
			(5, 'Vijfde plek', 10),
			(6, 'Zesde plek', 8),
			(7, 'Zevende plek', 6),
			(8, 'Achtste plek', 4),
			(9, 'Negende plek', 2),
			(10, 'Tiende plek', 1),
			(0, 'Snelsde ronden', 1)
GO

INSERT INTO [dbo].[DEELNEMENDECOUREUR] ([COUREURID],[CIRCUITNAAM],[STARTDATUM],[TEAMNAAM],[FINISHTIJD],[LAP])
	VALUES
			(1, 'Circuit Zandvoort', '1-1-2000', 'Red bull', 5880000, 47),
			(2, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5890000, 47),
			(3, 'Circuit Zandvoort','1-1-2000', 'Mercedes', 5900000, 47),
			(4, 'Circuit Zandvoort','1-1-2000', 'Mercedes', 5910000, 47),
			(5, 'Circuit Zandvoort','1-1-2000', 'Ferrari', 5920000, 47),
			(6, 'Circuit Zandvoort','1-1-2000', 'Ferrari', 5930000, 47),
			(7, 'Circuit Zandvoort','1-1-2000', 'McLaren', 5940000, 47),
			(8, 'Circuit Zandvoort','1-1-2000', 'McLaren', 5950000, 47),
			(9, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5960000, 47),
			(10, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5970000, 47),
			(11, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5980000, 47),
			(12, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5990000, 47),
			(13, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 47),
			(14, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 47),
			(15, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 47),
			(16, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 47),
			(17, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 47),
			(18, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 47),
			(19, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 47),
			(20, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 47),

			(2, 'Circuit Zandvoort', '3-1-2000', 'Mercedes', 5880000, 58),
			(3, 'Circuit Zandvoort', '6-1-2003', 'McLaren', 5880000, 53);
GO



EXEC sp_configure 'show advanced options', 1
RECONFIGURE
GO

EXEC sp_configure 'Ole Automation Procedures', 1
RECONFIGURE
GO

--This function sends a json to the api
CREATE OR ALTER PROCEDURE send_json_to_api @json NVARCHAR(MAX) AS
	DECLARE @token INT;
	DECLARE @ret INT;
	DECLARE @url NVARCHAR(MAX);
	DECLARE @data NVARCHAR(MAX) = @json;
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
;
GO

CREATE OR ALTER PROCEDURE spReturnRaceResult @circuit nvarchar(60),@startdatum DATE, @RaceUitslagen NVARCHAR(MAX) OUTPUT AS


WITH raceResult AS
(
SELECT R.CIRCUITNAAM, R.STARTDATUM, R.EINDDATUM, D.COUREURID ,D.TEAMNAAM, D.LAP, D.FINISHTIJD
FROM RACE R
INNER JOIN DEELNEMENDECOUREUR D
ON R.STARTDATUM = D.STARTDATUM AND R.CIRCUITNAAM = D.CIRCUITNAAM AND @startdatum = R.STARTDATUM
)
SELECT @RaceUitslagen = (
    SELECT CONCAT (@circuit,'/',@startdatum) AS name,
           (
               SELECT rR.CIRCUITNAAM, rR.STARTDATUM, rR.EINDDATUM, rR.TEAMNAAM, rR.LAP, rR.FINISHTIJD, C.VOORNAAM, C.ACHTERNAAM
               FROM raceResult rR
               INNER JOIN COUREUR C ON rR.COUREURID = C.COUREURID
               FOR JSON PATH, ROOT('data')
           ) AS data
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
);
;
GO

	DECLARE @RaceUitslagen NVARCHAR(MAX);
	EXEC spReturnRaceResult @circuit = 'Circuit Zandvoort', @startdatum = '01-01-2000', @RaceUitslagen = @RaceUitslagen OUTPUT;
	EXEC send_json_to_api @RaceUitslagen;
GO



ALTER TABLE Race
ADD CONSTRAINT CKStartdatumKleinerEinddatum CHECK (STARTDATUM <= EINDDATUM)
GO

CREATE OR ALTER TRIGGER TR_enforce_coureur_count
ON DEELNEMENDECOUREUR

AFTER INSERT

AS

BEGIN
IF @@ROWCOUNT = 0
	RETURN
  SET NOCOUNT ON

    IF EXISTS (

        SELECT 1
        FROM inserted
        WHERE   
		(
		SELECT COUNT(i.COUREURID)
		FROM inserted i
		WHERE i.CIRCUITNAAM = inserted.CIRCUITNAAM AND i.STARTDATUM = inserted.STARTDATUM
		) != 20
	

    )

        RAISERROR ('Een race moet ten minste 20 coureurs bevatten.', 16, 1);

        RETURN;


END;