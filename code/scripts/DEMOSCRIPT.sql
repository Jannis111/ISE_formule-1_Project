/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     07/05/2024 14:59:51                          */
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
   where r.fkeyid = object_id('RACE') and o.name = 'FK_RACE_RACEINLAN_LAND')
alter table RACE
   drop constraint FK_RACE_RACEINLAN_LAND
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RACEOPCIRCUIT') and o.name = 'FK_RACEOPCI_RACEOPCIR_CIRCUIT')
alter table RACEOPCIRCUIT
   drop constraint FK_RACEOPCI_RACEOPCIR_CIRCUIT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RACEOPCIRCUIT') and o.name = 'FK_RACEOPCI_RACEOPCIR_RACE')
alter table RACEOPCIRCUIT
   drop constraint FK_RACEOPCI_RACEOPCIR_RACE
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
            and   name  = 'RACEINLAND_FK'
            and   indid > 0
            and   indid < 255)
   drop index RACE.RACEINLAND_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RACE')
            and   type = 'U')
   drop table RACE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RACEOPCIRCUIT')
            and   name  = 'RACEOPCIRCUIT2_FK'
            and   indid > 0
            and   indid < 255)
   drop index RACEOPCIRCUIT.RACEOPCIRCUIT2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RACEOPCIRCUIT')
            and   name  = 'RACEOPCIRCUIT_FK'
            and   indid > 0
            and   indid < 255)
   drop index RACEOPCIRCUIT.RACEOPCIRCUIT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RACEOPCIRCUIT')
            and   type = 'U')
   drop table RACEOPCIRCUIT
go

if exists(select 1 from systypes where name='DATUM')
   drop type DATUM
go

if exists(select 1 from systypes where name='EISENVANPUNTEN')
   drop type EISENVANPUNTEN
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
/* Domain: DATUM                                                */
/*==============================================================*/
create type DATUM
   from datetime
go

/*==============================================================*/
/* Domain: EISENVANPUNTEN                                       */
/*==============================================================*/
create type EISENVANPUNTEN
   from varchar(60)
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
   constraint PK_CIRCUIT primary key (CIRCUITNAAM)
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
   LANDNAAM             NAAM                 not null,
   STARTDATUM           DATUM                not null,
   TEAM                 NAAM                 null,
   LAP                  LAP                  null,
   FINISHTIJD           TIJD                 null,
   constraint PK_DEELNEMENDECOUREUR primary key (LANDNAAM, COUREURID, STARTDATUM)
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
LANDNAAM ASC,
STARTDATUM ASC
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
   EISVANPUNTEN         EISENVANPUNTEN       not null,
   PUNTEN               PUNTEN               not null,
   constraint PK_PUNTENSYSTEEM primary key (EISVANPUNTEN)
)
go

/*==============================================================*/
/* Table: RACE                                                  */
/*==============================================================*/
create table RACE (
   LANDNAAM             NAAM                 not null,
   STARTDATUM           DATUM                not null,
   EINDDATUM            DATUM                null,
   PLAATS               NAAM                 null,
   constraint PK_RACE primary key (LANDNAAM, STARTDATUM)
)
go

/*==============================================================*/
/* Index: RACEINLAND_FK                                         */
/*==============================================================*/
create index RACEINLAND_FK on RACE (
LANDNAAM ASC
)
go

/*==============================================================*/
/* Table: RACEOPCIRCUIT                                         */
/*==============================================================*/
create table RACEOPCIRCUIT (
   CIRCUITNAAM          NAAM                 not null,
   LANDNAAM             NAAM                 not null,
   STARTDATUM           DATUM                not null,
   constraint PK_RACEOPCIRCUIT primary key (CIRCUITNAAM, LANDNAAM, STARTDATUM)
)
go

/*==============================================================*/
/* Index: RACEOPCIRCUIT_FK                                      */
/*==============================================================*/
create index RACEOPCIRCUIT_FK on RACEOPCIRCUIT (
CIRCUITNAAM ASC
)
go

/*==============================================================*/
/* Index: RACEOPCIRCUIT2_FK                                     */
/*==============================================================*/
create index RACEOPCIRCUIT2_FK on RACEOPCIRCUIT (
LANDNAAM ASC,
STARTDATUM ASC
)
go

alter table DEELNEMENDECOUREUR
   add constraint FK_DEELNEME_DEELNEMEN_COUREUR foreign key (COUREURID)
      references COUREUR (COUREURID)
go

alter table DEELNEMENDECOUREUR
   add constraint FK_DEELNEME_DEELNEMEN_RACE foreign key (LANDNAAM, STARTDATUM)
      references RACE (LANDNAAM, STARTDATUM)
go

alter table RACE
   add constraint FK_RACE_RACEINLAN_LAND foreign key (LANDNAAM)
      references LAND (LANDNAAM)
go

alter table RACEOPCIRCUIT
   add constraint FK_RACEOPCI_RACEOPCIR_CIRCUIT foreign key (CIRCUITNAAM)
      references CIRCUIT (CIRCUITNAAM)
go

alter table RACEOPCIRCUIT
   add constraint FK_RACEOPCI_RACEOPCIR_RACE foreign key (LANDNAAM, STARTDATUM)
      references RACE (LANDNAAM, STARTDATUM)
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
			(4, 'Lando', 'Norris');
GO

INSERT INTO [dbo].[CIRCUIT] ([CIRCUITNAAM])
	VALUES
			('Miami International Autodrome'),
			('Red Bull Ring'),
			('Circuit Zandvoort'),
			('Autodrome Hermanos Rodriguez')
GO

INSERT INTO [dbo].[RACE]([LANDNAAM],[PLAATS],[STARTDATUM],[EINDDATUM])
	VALUES
			('Nederland', 'Zandvoort', '1-1-2000', '3-1-2000'),
			('United States', 'Miami', '3-1-2000', '6-1-2000'),
			('België', 'spa', '6-1-2003', '9-1-2003')
GO

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
GO

INSERT INTO [dbo].[DEELNEMENDECOUREUR] ([COUREURID],[STARTDATUM],[TEAM],[FINISHTIJD],[LAP],[LANDNAAM])
	VALUES
			(1, '1-1-2000', 'Red bull', 5880000, 47, 'Nederland'),
			(2, '3-1-2000', 'Mercedes', 5880000, 58, 'United States'),
			(3, '6-1-2003', 'McLaren', 5880000, 53, 'België');
GO

INSERT INTO [dbo].[RACEOPCIRCUIT] ([CIRCUITNAAM],[LANDNAAM],[STARTDATUM])
	VALUES 
			('Circuit Zandvoort', 'Nederland', '1-1-2000'),
			('Miami International Autodrome','United States','3-1-2000')
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

CREATE OR ALTER PROCEDURE sp_return_race_results @RaceUitslagen NVARCHAR(MAX) OUTPUT AS
WITH raceResult AS
(
SELECT R.LANDNAAM, R.STARTDATUM, R.EINDDATUM, R.PLAATS, ROC.CIRCUITNAAM, D.COUREURID ,D.TEAM, D.LAP, D.FINISHTIJD
FROM RACE R INNER JOIN RACEOPCIRCUIT ROC
ON R.STARTDATUM = ROC.STARTDATUM AND R.LANDNAAM = ROC.LANDNAAM
INNER JOIN DEELNEMENDECOUREUR D
ON R.STARTDATUM = D.STARTDATUM AND R.LANDNAAM = D.LANDNAAM
)
SELECT @RaceUitslagen = (
    SELECT 'RaceUitslag' AS name,
           (
               SELECT rR.LANDNAAM, rR.STARTDATUM, rR.EINDDATUM, rR.PLAATS, rR.CIRCUITNAAM, rR.TEAM, rR.LAP, rR.FINISHTIJD, C.VOORNAAM, C.ACHTERNAAM
               FROM raceResult rR
               INNER JOIN COUREUR C ON rR.COUREURID = C.COUREURID
               FOR JSON PATH, ROOT('data')
           ) AS data
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
);
;
GO

CREATE OR ALTER PROCEDURE send_race_results AS 
BEGIN
	DECLARE @RaceUitslagen NVARCHAR(MAX);
	EXEC sp_return_race_results @RaceUitslagen OUTPUT;
	EXEC send_json_to_api @RaceUitslagen;
END;    
GO

--DEMO
INSERT INTO LAND (LANDNAAM) VALUES ('LUXEMBOURG');
INSERT INTO COUREUR (COUREURID, VOORNAAM, ACHTERNAAM) VALUES (5, 'DYLANO', 'HARTGERS');
INSERT INTO RACE (LANDNAAM, STARTDATUM, EINDDATUM, PLAATS) VALUES ('LUXEMBOURG', '6-1-2000', '8-1-2000', 'BRUSSEL');
INSERT INTO CIRCUIT (CIRCUITNAAM) VALUES ('Brusselbaan');
INSERT INTO DEELNEMENDECOUREUR(COUREURID, LANDNAAM, STARTDATUM, TEAM, LAP, FINISHTIJD) VALUES (5, 'LUXEMBOURG', '6-1-2000', 'A4TJES', 30, 4000000);
INSERT INTO RACEOPCIRCUIT(CIRCUITNAAM, LANDNAAM, STARTDATUM) VALUES ('Brusselbaan', 'LUXEMBOURG','6-1-2000');
GO

EXEC send_race_results;