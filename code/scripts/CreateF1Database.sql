/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                              */
/* Created on:     21/05/2024 11:14:19                                                  */
/*==============================================================*/

/*==============================================================*/
/*    BESCHRIJVING: Dit bestand bouwt het gehele systeem
        dat nodig is voor de formule 1 database. Het maakt eerst
        de tabellen aan en daarna de storedprocedures*/
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
   where r.fkeyid = object_id('COUREUR') and o.name = 'FK_COUREUR_COUREURGE_LAND')
alter table COUREUR
   drop constraint FK_COUREUR_COUREURGE_LAND
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COUREUR') and o.name = 'FK_COUREUR_COUREURUI_LAND')
alter table COUREUR
   drop constraint FK_COUREUR_COUREURUI_LAND
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
   where r.fkeyid = object_id('LAP') and o.name = 'FK_LAP_DEELNEMEN_DEELNEME')
alter table LAP
   drop constraint FK_LAP_DEELNEMEN_DEELNEME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PITSTOP') and o.name = 'FK_PITSTOP_PITSTOPVA_DEELNEME')
alter table PITSTOP
   drop constraint FK_PITSTOP_PITSTOPVA_DEELNEME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RACE') and o.name = 'FK_RACE_RACEOPCIR_CIRCUIT')
alter table RACE
   drop constraint FK_RACE_RACEOPCIR_CIRCUIT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TEAM') and o.name = 'FK_TEAM_TEAMTHUIS_LAND')
alter table TEAM
   drop constraint FK_TEAM_TEAMTHUIS_LAND
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
            from  sysindexes
           where  id    = object_id('COUREUR')
            and   name  = 'COUREURGEBOORTELAND_FK'
            and   indid > 0
            and   indid < 255)
   drop index COUREUR.COUREURGEBOORTELAND_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COUREUR')
            and   name  = 'COUREURUITKOMSTLAND_FK'
            and   indid > 0
            and   indid < 255)
   drop index COUREUR.COUREURUITKOMSTLAND_FK
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
            from  sysindexes
           where  id    = object_id('LAP')
            and   name  = 'DEELNEMENDECOUREURZITOPLAP_FK'
            and   indid > 0
            and   indid < 255)
   drop index LAP.DEELNEMENDECOUREURZITOPLAP_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LAP')
            and   type = 'U')
   drop table LAP
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PITSTOP')
            and   name  = 'PITSTOPVANDEELNEMENDECOUREUR_FK'
            and   indid > 0
            and   indid < 255)
   drop index PITSTOP.PITSTOPVANDEELNEMENDECOUREUR_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PITSTOP')
            and   type = 'U')
   drop table PITSTOP
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
            from  sysindexes
           where  id    = object_id('TEAM')
            and   name  = 'TEAMTHUISLAND_FK'
            and   indid > 0
            and   indid < 255)
   drop index TEAM.TEAMTHUISLAND_FK
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

if exists(select 1 from systypes where name='DAGTIJD')
   drop type DAGTIJD
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

if exists(select 1 from systypes where name='NUMMER')
   drop type NUMMER
go

if exists(select 1 from systypes where name='PLAATS')
   drop type PLAATS
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
   from nvarchar(255)
go

/*==============================================================*/
/* Domain: DAGTIJD                                              */
/*==============================================================*/
create type DAGTIJD
   from datetime
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
   from nvarchar(60)
go

/*==============================================================*/
/* Domain: NUMMER                                               */
/*==============================================================*/
create type NUMMER
   from smallint
go

/*==============================================================*/
/* Domain: PLAATS                                               */
/*==============================================================*/
create type PLAATS
   from nvarchar(255)
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
   COUREURID            ID                   identity,
   NATIONALITEIT        NAAM                 null,
   GEBOORTELAND         NAAM                 not null,
   VOORNAAM             NAAM                 null,
   ACHTERNAAM           NAAM                 null,
   GEBOORTEDATUM        DATUM                null,
   GEBOORTEPLAATS       PLAATS               null,
   constraint PK_COUREUR primary key (COUREURID)
)
go

/*==============================================================*/
/* Index: COUREURUITKOMSTLAND_FK                                */
/*==============================================================*/
create index COUREURUITKOMSTLAND_FK on COUREUR (
NATIONALITEIT ASC
)
go

/*==============================================================*/
/* Index: COUREURGEBOORTELAND_FK                                */
/*==============================================================*/
create index COUREURGEBOORTELAND_FK on COUREUR (
GEBOORTELAND ASC
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
   FINISHTIJD           TIJD                 null,
   PUNTEN               PUNTEN               null,
   VOLGNUMMER           NUMMER               not null,
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
/* Table: LAP                                                   */
/*==============================================================*/
create table LAP (
   CIRCUITNAAM          NAAM                 not null,
   COUREURID            ID                   not null,
   STARTDATUM           DATUM                not null,
   HUIDIGELAP           LAP                  not null,
   LAPTIJD              TIJD                 not null,
   constraint PK_LAP primary key (CIRCUITNAAM, COUREURID, STARTDATUM, HUIDIGELAP)
)
go

/*==============================================================*/
/* Index: DEELNEMENDECOUREURZITOPLAP_FK                         */
/*==============================================================*/
create index DEELNEMENDECOUREURZITOPLAP_FK on LAP (
CIRCUITNAAM ASC,
COUREURID ASC,
STARTDATUM ASC
)
go

/*==============================================================*/
/* Table: PITSTOP                                               */
/*==============================================================*/
create table PITSTOP (
   DAGTIJD              DAGTIJD              not null,
   CIRCUITNAAM          NAAM                 not null,
   COUREURID            ID                   not null,
   STARTDATUM           DATUM                not null,
   constraint PK_PITSTOP primary key (DAGTIJD)
)
go

/*==============================================================*/
/* Index: PITSTOPVANDEELNEMENDECOUREUR_FK                       */
/*==============================================================*/
create index PITSTOPVANDEELNEMENDECOUREUR_FK on PITSTOP (
CIRCUITNAAM ASC,
COUREURID ASC,
STARTDATUM ASC
)
go

/*==============================================================*/
/* Table: PUNTENSYSTEEM                                         */
/*==============================================================*/
create table PUNTENSYSTEEM (
   BESCHRIJVING         BESCHRIJVING         not null,
   PUNTEN               PUNTEN               not null,
   constraint PK_PUNTENSYSTEEM primary key (BESCHRIJVING)
)
go

/*==============================================================*/
/* Table: RACE                                                  */
/*==============================================================*/
create table RACE (
   CIRCUITNAAM          NAAM                 not null,
   STARTDATUM           DATUM                not null,
   EINDDATUM            DATUM                null,
   AANTALLAPS           NUMMER               not null,
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
   LANDNAAM             NAAM                 not null,
   constraint PK_TEAM primary key (TEAMNAAM)
)
go

/*==============================================================*/
/* Index: TEAMTHUISLAND_FK                                      */
/*==============================================================*/
create index TEAMTHUISLAND_FK on TEAM (
LANDNAAM ASC
)
go

alter table CIRCUIT
   add constraint FK_CIRCUIT_CIRCUITIN_LAND foreign key (LANDNAAM)
      references LAND (LANDNAAM)
go

alter table COUREUR
   add constraint FK_COUREUR_COUREURGE_LAND foreign key (GEBOORTELAND)
      references LAND (LANDNAAM)
go

alter table COUREUR
   add constraint FK_COUREUR_COUREURUI_LAND foreign key (NATIONALITEIT)
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

alter table LAP
   add constraint FK_LAP_DEELNEMEN_DEELNEME foreign key (CIRCUITNAAM, COUREURID, STARTDATUM)
      references DEELNEMENDECOUREUR (CIRCUITNAAM, COUREURID, STARTDATUM)
go

alter table PITSTOP
   add constraint FK_PITSTOP_PITSTOPVA_DEELNEME foreign key (CIRCUITNAAM, COUREURID, STARTDATUM)
      references DEELNEMENDECOUREUR (CIRCUITNAAM, COUREURID, STARTDATUM)
go

alter table RACE
   add constraint FK_RACE_RACEOPCIR_CIRCUIT foreign key (CIRCUITNAAM)
      references CIRCUIT (CIRCUITNAAM)
go

alter table TEAM
   add constraint FK_TEAM_TEAMTHUIS_LAND foreign key (LANDNAAM)
      references LAND (LANDNAAM)
go


CREATE OR ALTER PROCEDURE SP_generateHistoryTables
--(@param datatype, ...)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

		DECLARE @TableName NVARCHAR(128)
        DECLARE @SchemaName NVARCHAR(128)
        DECLARE @FullTableName NVARCHAR(260)
        DECLARE @SQL NVARCHAR(MAX)
        DECLARE @HistoryTable NVARCHAR(260)

        -- Cursor to iterate over all user tables in the current database
        DECLARE table_cursor CURSOR FOR
        SELECT SCHEMA_NAME(t.schema_id) AS SchemaName, t.name AS TableName
        FROM sys.tables t
        WHERE t.is_ms_shipped = 0 -- Exclude system tables

        OPEN table_cursor
        FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Construct the full table name with schema
        	IF (@TableName NOT LIKE '%_History')
        	BEGIN
            SET @FullTableName = QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName)
            SET @HistoryTable = QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName + '_History')

            -- Construct the dynamic SQL to add the columns and enable system versioning
            SET @SQL = '
            IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(''' + @FullTableName + ''') AND name = ''ValidFrom'')
            BEGIN
                ALTER TABLE ' + @FullTableName + '
                ADD [ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
                    [ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
                    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo]);
            END'

            -- Print the SQL for debugging (optional)
            --PRINT @SQL

            -- Execute the dynamic SQL to add the columns and period
            EXEC sp_executesql @SQL

            -- Construct the dynamic SQL to enable system versioning
            SET @SQL = '
            ALTER TABLE ' + @FullTableName + '
            SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = ' + @HistoryTable + '));'

            -- Print the SQL for debugging (optional)
            --PRINT @SQL

            -- Execute the dynamic SQL to enable system versioning
            EXEC sp_executesql @SQL
        	END;

            FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName
        END;

        CLOSE table_cursor
        DEALLOCATE table_cursor

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

EXECUTE SP_generateHistoryTables
GO

/*==============================================================*/
/* Table: EXECUTION_SCHEMA                                      */
/*==============================================================*/
CREATE TABLE EXECUTION_SCHEMA (
	EXECUTION_ID INT NOT NULL IDENTITY(1,1),
	EXECUTION_COUNT INT NOT NULL,
	STOREDPROCEDURE_ID INT NOT NULL,
	CORRESPONDING_EXECUTION_ID INT NULL,
	PARENTPROCESS_ID INT NOT NULL,
	PARAMETER NVARCHAR(MAX) NULL,
	PRIMARY KEY (EXECUTION_ID)
);
GO

CREATE TABLE LOGTABLE (
	EXECUTED_ID INT NOT NULL,
	EXECUTED_NAME NVARCHAR(60) NOT NULL,
	PARAMETER NVARCHAR(MAX) NULL,
	TIME DATETIME NOT NULL,
	STATUS BIT NOT NULL,
	PRIMARY KEY (TIME)
);
GO


USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_insertIntoExecutionSchema
    @storedProcedureID INT,
    @correspondingExecutionID INT,
	@parentProcessID INT,
	@parameter NVARCHAR(MAX)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

		SET NOCOUNT ON;
            DECLARE @procedureID INT;
            DECLARE @correspondingID INT;
            DECLARE @requestAlreadyExists BIT;
            SET @procedureID = @storedProcedureID;
            SET @correspondingID = @correspondingExecutionID;
            SET @requestAlreadyExists = 0;
        	IF EXISTS (SELECT 1 FROM dbo.EXECUTION_SCHEMA WHERE STOREDPROCEDURE_ID = @procedureID)
        		BEGIN
        			SET @requestAlreadyExists = 1;
        		END
        	IF @requestAlreadyExists = 0 --Insert into EXECUTION_SCHEMA
                BEGIN
                    INSERT INTO EXECUTION_SCHEMA (EXECUTION_COUNT, STOREDPROCEDURE_ID, CORRESPONDING_EXECUTION_ID, PARENTPROCESS_ID, PARAMETER) VALUES (0, @procedureID, @correspondingID, @parentProcessID, @parameter);
                END
        	ELSE
        	BEGIN
        		RAISERROR ('Entry already exists for stored procedure ID %d', 16, 1, @procedureID);
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

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_sendJsonToApi
    @json NVARCHAR(MAX)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

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

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_addCircuit
	@newCircuitName NVARCHAR(255),
	@newCircuitCity NVARCHAR(255),
	@newCircuitCountry NVARCHAR(255)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

		INSERT INTO CIRCUIT (CIRCUITNAAM, LANDNAAM, PLAATS) VALUES (@newCircuitName, @newCircuitCountry, @newCircuitCity);
		DECLARE @correspondingProcessID INT;
		SET @correspondingProcessID = (SELECT object_id FROM sys.procedures WHERE NAME LIKE 'sp_createCircuitsJson')
		EXEC SP_insertIntoExecutionSchema @@PROCID, @correspondingProcessID, @@PROCID, null;

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

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_addCountry
@landNaam NVARCHAR (60)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

	    INSERT INTO LAND (LANDNAAM)
	    VALUES(@landNaam)

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

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_addCoureur
	@voornaam varchar(60),
	@achternaam varchar(60),
	@geboortedatum date,
	@geboorteplaats varchar(255),
	@geboorteland varchar(60),
	@nationaliteit varchar (60)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

        INSERT INTO [dbo].[COUREUR] ([VOORNAAM], [ACHTERNAAM], GEBOORTEDATUM, GEBOORTEPLAATS, GEBOORTELAND, NATIONALITEIT)
	    VALUES (@voornaam, @achternaam, @geboortedatum, @geboorteplaats, @geboorteland, @nationaliteit)

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

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_addRacePlanning
@startDatum Date,
@eindDatum Date,
@circuitNaam nvarchar(60),
@aantalLaps int
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

				INSERT INTO Race (CIRCUITNAAM, STARTDATUM, EINDDATUM) VALUES (@circuitNaam, @startDatum, @eindDatum);


        		DECLARE @correspondingProcessID INT;
        		SET @correspondingProcessID = (SELECT object_id FROM sys.procedures WHERE NAME LIKE 'SP_getRacePlanning');
        		DECLARE @parameter NVARCHAR(255);
        		SET @parameter = '{"startDatum" : "'''+ CONVERT(NVARCHAR(10), @startDatum, 23) + '''"}';
        		print @parameter;
        		EXEC SP_insertIntoExecutionSchema @@PROCID, @correspondingProcessID, @@PROCID, @parameter;

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

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_addTeam
@teamNaam NVARCHAR (60),
@landNaam NVARCHAR (60)
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

	INSERT INTO TEAM (TEAMNAAM, LANDNAAM)
	VALUES(@teamNaam, @landNaam)

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

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_deleteThisCoureur
    @ID int
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
        -- Verwijder het record met het gegeven ID
        DELETE FROM Coureur
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

CREATE OR ALTER PROCEDURE SP_deleteThisDeelnemendeCoureur
@ID int
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

        IF EXISTS (SELECT 1 FROM DEELNEMENDECOUREUR WHERE COUREURID = @ID)
	        BEGIN
		        DELETE FROM DEELNEMENDECOUREUR
		        WHERE COUREURID = @ID
	        END
	    ELSE
	        BEGIN
		        RAISERROR('Records met ID %d bestaan niet', 16, 1,@ID);
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

CREATE OR ALTER PROCEDURE SP_deleteLapForThisCoureur
	@ID int
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

	    IF EXISTS (SELECT 1 FROM LAP WHERE COUREURID = @ID)
	        BEGIN
		        DELETE FROM DEELNEMENDECOUREUR
		        WHERE COUREURID = @ID
	        END
	    ELSE
	        BEGIN
		        RAISERROR('Records met ID %d bestaan niet', 16, 1,@ID);
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

CREATE OR ALTER PROCEDURE SP_deletePitStopsForThisCoureur
	@ID int
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

	IF EXISTS (SELECT 1 FROM LAP WHERE COUREURID = @ID)
	BEGIN
		DELETE FROM DEELNEMENDECOUREUR
		WHERE COUREURID = @ID
	END
	ELSE
	BEGIN
		RAISERROR('Records met ID %d bestaan niet', 16, 1,@ID);
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

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_getRacePlanning
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

DECLARE @RacePlanning NVARCHAR(MAX);
SELECT @RacePlanning = (
    SELECT CONCAT ('RacePlanning/',Year(@startDatum)) AS name,
           (
               SELECT * FROM RACE WHERE YEAR(STARTDATUM )= YEAR(@startDatum)
               FOR JSON PATH, ROOT('data')
           ) AS data
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
);

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


USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_updateCoureur
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

USE Formule_1
GO

CREATE OR ALTER PROCEDURE SP_updateRacePlanning
    @circuitNaam NVARCHAR(255),
    @startDatum Date,
    @eindDatum Date,
    @aantalLaps int
AS
BEGIN
	--create a unique savepointnaam
	DECLARE @savepoint varchar(128)= CAST(OBJECT_NAME(@@PROCID) AS varchar(125)) + CAST(@@NESTLEVEL AS varchar(3));
	DECLARE @startTrancount int= @@TRANCOUNT;
	SET NOCOUNT ON; --no x rows affected for performance reasons.
	BEGIN TRY
		BEGIN TRANSACTION;
		SAVE TRANSACTION @savepoint;

        IF EXISTS(SELECT 1 FROM Race WHERE STARTDATUM = @startDatum)
            BEGIN

                UPDATE RACE
                SET CIRCUITNAAM = @circuitNaam, EINDDATUM = @eindDatum, AANTALLAPS = @aantalLaps
                WHERE STARTDATUM = @startDatum


                DECLARE @correspondingProcessID INT;
                SET @correspondingProcessID = (SELECT object_id FROM sys.procedures WHERE NAME LIKE 'SP_getRacePlanning');
                DECLARE @parameter NVARCHAR(255);
                SET @parameter = '{"startDatum" : "'''+ CONVERT(NVARCHAR(10), @startDatum, 23) + '''"}';
                print @parameter;
                EXEC SP_insertIntoExecutionSchema @@PROCID, @correspondingProcessID, @@PROCID, @parameter;

            END
            ELSE
            BEGIN
                RAISERROR ('The data you are trying to update does not exists!', 16, 1);
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

CREATE OR ALTER PROCEDURE SP_job
AS
BEGIN
    DECLARE @countOfProcedures INT;
    SET @countOfProcedures = (SELECT COUNT(*) FROM EXECUTION_SCHEMA);

    WHILE @countOfProcedures > 0
    BEGIN
        DECLARE @sp_name NVARCHAR(60);
        DECLARE @sp_id INT;
        DECLARE @parameter NVARCHAR(MAX);
        DECLARE @correspondingExecutionIDIsNull BIT;
        DECLARE @sql NVARCHAR(MAX);
        DECLARE @paramDef NVARCHAR(MAX);
        DECLARE @paramList NVARCHAR(MAX);

        SET @correspondingExecutionIDIsNull = 0;
        SET @sp_id = (SELECT TOP 1 CORRESPONDING_EXECUTION_ID FROM EXECUTION_SCHEMA ORDER BY EXECUTION_COUNT ASC);

        IF @sp_id IS NULL
        BEGIN
            SET @correspondingExecutionIDIsNull = 1;
            SET @sp_id = (SELECT TOP 1 STOREDPROCEDURE_ID FROM EXECUTION_SCHEMA ORDER BY EXECUTION_COUNT ASC);
        END;

        SET @parameter = (SELECT TOP 1 PARAMETER FROM EXECUTION_SCHEMA WHERE (CORRESPONDING_EXECUTION_ID = @sp_id OR STOREDPROCEDURE_ID = @sp_id) ORDER BY EXECUTION_COUNT ASC);
        SET @sp_name = OBJECT_NAME(@sp_id);

        -- Construct dynamic SQL
        SET @sql = N'EXEC ' + QUOTENAME(@sp_name) + N' ';
        SET @paramDef = N'';
        SET @paramList = N'';

        IF @parameter IS NOT NULL AND @parameter != ''
        BEGIN
            -- Parse JSON parameters
            DECLARE @json NVARCHAR(MAX) = @parameter;
            DECLARE @key NVARCHAR(100);
            DECLARE @value NVARCHAR(MAX);

            DECLARE @jsonTable TABLE (
                [key] NVARCHAR(100),
                [value] NVARCHAR(MAX)
            );

            INSERT INTO @jsonTable ([key], [value])
            SELECT [key], [value]
            FROM OPENJSON(@json);

            DECLARE jsonCursor CURSOR FOR
            SELECT [key], [value] FROM @jsonTable;

            OPEN jsonCursor;
            FETCH NEXT FROM jsonCursor INTO @key, @value;

            WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @paramList = @paramList + '@' + @key + ' = ' + @value + ', ';
                FETCH NEXT FROM jsonCursor INTO @key, @value;
            END;

            CLOSE jsonCursor;
            DEALLOCATE jsonCursor;

            -- Remove the trailing comma and space
            SET @paramList = LEFT(@paramList, LEN(@paramList) - 1);
        END;

        BEGIN TRY
            INSERT INTO LOGTABLE (EXECUTED_ID, EXECUTED_NAME, PARAMETER, TIME, STATUS)
            VALUES (@sp_id, @sp_name, @sql + ' ' + @paramList, GETDATE(), 1);

            SET @sql = @sql + ' ' + @paramList;
            EXEC sp_executesql @sql;

            -- If execution succeeds, delete the record
            IF @correspondingExecutionIDIsNull = 0 OR @correspondingExecutionIDIsNull IS NULL
            BEGIN
                DELETE FROM EXECUTION_SCHEMA WHERE CORRESPONDING_EXECUTION_ID = @sp_id;
                DELETE FROM EXECUTION_SCHEMA WHERE STOREDPROCEDURE_ID = @sp_id;
            END
            ELSE
            BEGIN
                DELETE FROM EXECUTION_SCHEMA WHERE STOREDPROCEDURE_ID = @sp_id;
                DELETE FROM EXECUTION_SCHEMA WHERE CORRESPONDING_EXECUTION_ID = @sp_id;
            END;
        END TRY
        BEGIN CATCH
            -- If execution fails, increment EXECUTION_COUNT column by one
            IF @correspondingExecutionIDIsNull = 0 OR @correspondingExecutionIDIsNull IS NULL
            BEGIN
                UPDATE EXECUTION_SCHEMA SET EXECUTION_COUNT = EXECUTION_COUNT + 1 WHERE CORRESPONDING_EXECUTION_ID = @sp_id;
            END;
            ELSE
            BEGIN
                UPDATE EXECUTION_SCHEMA SET EXECUTION_COUNT = EXECUTION_COUNT + 1 WHERE STOREDPROCEDURE_ID = @sp_id;
            END;
            INSERT INTO LOGTABLE (EXECUTED_ID, EXECUTED_NAME, PARAMETER, TIME, STATUS)
            VALUES (@sp_id, @sp_name, @parameter, GETDATE(), 1);
        END CATCH

        SET @countOfProcedures = @countOfProcedures - 1; -- decrement count
    END;
END;
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
		) > 20
    )
        RAISERROR ('Een race moet ten minste 20 coureurs bevatten.', 16, 1);
        RETURN;
END;
GO

USE [msdb]
GO

/****** Object:  Job [everyMinute]    Script Date: 14-5-2024 11:19:34 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 14-5-2024 11:19:34 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'everyMinute',
		@enabled=1,
		@notify_level_eventlog=0,
		@notify_level_email=0,
		@notify_level_netsend=0,
		@notify_level_page=0,
		@delete_level=0,
		@description=N'Deze job voert elke minuut een actie uit die je kan vinden in het tabje steps. De actie bij deze job is een stored procedure uitvoeren.',
		@category_name=N'[Uncategorized (Local)]',
		@owner_login_name=N'DESKTOP-B33N209\jan22', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [everyMinute]    Script Date: 14-5-2024 11:19:34 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'everyMinute',
		@step_id=1,
		@cmdexec_success_code=0,
		@on_success_action=1,
		@on_success_step_id=0,
		@on_fail_action=2,
		@on_fail_step_id=0,
		@retry_attempts=0,
		@retry_interval=0,
		@os_run_priority=0, @subsystem=N'TSQL',
		@command=N'EXEC SP_job;
',
		@database_name=N'Formule_1',
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'everyMinute',
		@enabled=1,
		@freq_type=4,
		@freq_interval=1,
		@freq_subday_type=4,
		@freq_subday_interval=1,
		@freq_relative_interval=0,
		@freq_recurrence_factor=0,
		@active_start_date=20240513,
		@active_end_date=99991231,
		@active_start_time=0,
		@active_end_time=235959,
		@schedule_uid=N'e5ac293e-8b22-416c-b321-6be60f7b95fd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

USE Formule_1
INSERT INTO [dbo].[LAND]
           ([LANDNAAM])
     VALUES
           ('Nederland'),('België'),('United States'),('Japan'),('China'),('Brazilië'),('Mexico'),('Oostenrijk'), ('Italië'), ('Engeland');
GO

INSERT INTO [dbo].[COUREUR] ([VOORNAAM], [ACHTERNAAM], GEBOORTEDATUM, GEBOORTEPLAATS, GEBOORTELAND, NATIONALITEIT)
	VALUES
			('Max', 'Verstappen', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Lewis', 'Hamilton', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Lando', 'Norris', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland'),
			('Fernando', 'Alonso', 2000-01-01, 'hassalt', 'België', 'Nederland');

GO

INSERT INTO [dbo].[TEAM] ([TEAMNAAM], LANDNAAM)
	VALUES
			('Red bull', 'Oostenrijk'),
			('Mercedes', 'Engeland'),
			('McLaren', 'Italië'),
			('Ferrari', 'Italië')
GO

INSERT INTO [dbo].[CIRCUIT] ([CIRCUITNAAM], [LANDNAAM],[PLAATS])
	VALUES
			('Miami International Autodrome', 'United States', 'Miami'),
			('Red Bull Ring', 'Oostenrijk', 'Spielburg'),
			('Circuit Zandvoort', 'Nederland', 'Zandvoort'),
			('Autodrome Hermanos Rodriguez', 'Mexico', 'Mexico-Stad')
GO

INSERT INTO [dbo].[RACE]([CIRCUITNAAM],[STARTDATUM],[EINDDATUM], [AANTALLAPS])
	VALUES
			('Circuit Zandvoort', '1-1-2000', '3-1-2000', 20),
			('Circuit Zandvoort', '3-1-2000', '6-1-2000', 35),
			('Circuit Zandvoort', '6-1-2003', '9-1-2003', 20)
GO

INSERT INTO [dbo].[PUNTENSYSTEEM] ([BESCHRIJVING],[PUNTEN])
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

INSERT INTO [dbo].[DEELNEMENDECOUREUR] ([COUREURID],[CIRCUITNAAM],[STARTDATUM],[TEAMNAAM],[FINISHTIJD],[VOLGNUMMER])
	VALUES
			(1, 'Circuit Zandvoort', '1-1-2000', 'Red bull', 5880000, 1),
			(2, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5890000, 2),
			(3, 'Circuit Zandvoort','1-1-2000', 'Mercedes', 5900000, 3),
			(4, 'Circuit Zandvoort','1-1-2000', 'Mercedes', 5910000, 4),
			(5, 'Circuit Zandvoort','1-1-2000', 'Ferrari', 5920000, 5),
			(6, 'Circuit Zandvoort','1-1-2000', 'Ferrari', 5930000, 6),
			(7, 'Circuit Zandvoort','1-1-2000', 'McLaren', 5940000, 7),
			(8, 'Circuit Zandvoort','1-1-2000', 'McLaren', 5950000, 8),
			(9, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5960000, 9),
			(10, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5970000, 10),
			(11, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5980000, 11),
			(12, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5990000, 12),
			(13, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 13),
			(14, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 14),
			(15, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 15),
			(16, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 16),
			(17, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 17),
			(18, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 18),
			(19, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 19),
			(20, 'Circuit Zandvoort','1-1-2000', 'Red bull', 5880000, 20),

			(2, 'Circuit Zandvoort', '3-1-2000', 'Mercedes', 5880000, 21),
			(3, 'Circuit Zandvoort', '6-1-2003', 'McLaren', 5880000, 22);
GO

EXEC sp_configure 'show advanced options', 1
RECONFIGURE
GO

EXEC sp_configure 'Ole Automation Procedures', 1
RECONFIGURE
GO