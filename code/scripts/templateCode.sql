USE [databaseName]
GO

--Stored procedure insert template
CREATE OR ALTER PROCEDURE SP_add[ProcedureName]
@[firstVariableName] [variableDataType],
@[secondVariableName] [variableDataType]
AS
BEGIN
		INSERT INTO [tableName] ([columnName], [columnName]) VALUES (@[firstVariableName], @[secondVariableName]);
		
		--If you are making an insert which adds data to the relational database that also needs to be added to the non-relational database you will need the code that sends JSONS.
		--Otherwise you can remove it.
END

-- Stored procedure update template
CREATE OR ALTER PROCEDURE SP_update[ProcedureName]
@[firstVariableName] [variableDataType],
@[secondVariableName] [variableDataType]
AS
BEGIN
	IF EXISTS([identifier] = [identifier])
	BEGIN
		UPDATE [tableName] 
		SET [columnName] = @[firstVariableName],  [columnName] = @[secondVariableName]
		WHERE [condition]
		
		--If you are making an update which adds data to the relational database that also needs to be added to the non-relational database you will need the code that sends JSONS.
	END
	ELSE
	BEGIN
		RAISERROR ('The data you are trying to update does not exists!', 16, 1);
	END 
END

-- Delete stored procedure template
CREATE OR ALTER PROCEDURE SP_delete[ProcedureName]
@[firstVariableName] [variableDataType],
@[secondVariableName] [variableDataType]
AS
BEGIN
	IF EXISTS([identifier] = [identifier])
		BEGIN
		DELETE FROM [tableName]
		WHERE [condition];
		--If you are deleting something in the relational database that also needs to be deleted in the non-relational database you will need the code that sends JSONS.
		END
	ELSE
	BEGIN 
		RAISERROR ('The data you are trying to delete does not exists!', 16, 1);  
	END 
END



-- trigger template
CREATE OR ALTER TRIGGER TR_[triggerName]
ON [tableName]
[FOR | AFTER | INSTEAD OF]
[AFTER] | [,] | [insert] | [,] | [update] 
AS
BEGIN
IF @@ROWCOUNT = 0
RETURN
SET NOCOUNT ON
BEGIN TRY
		--Put in here the insert, update or delete depending on what you wanna do.

	
	
END TRY
BEGIN CATCH
	RAISERROR ('[ErrorMessage]', 16, 1);
END CATCH
END

-- Unittest template for a Constriant
EXECUTE tSQLt.NewTestClass [TestClassName]
GO

CREATE or ALTER PROC [TestClassName].Test [Description of the test]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.[tableName]'
	EXEC tSQLt.ApplyConstraint @TableName='dbo.[tableNameOfTableYouWannaPutAConstraintOn]', @ConstraintName = '[Constraint]'

	--If you are expecting an exception use this code:
	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%[ExpectedErrorMessage]%'

	--If you are expecting no exception use this code:
	EXEC tSQLt.ExpectNoException


	INSERT INTO [tableName]([tableColumn], [tableColumn])
	VALUES([mockedDataYouWannaInsert], [mockedDataYouWannaInsert])
	END
GO
EXEC tSQLt.RunTestClass [TestClassName]
GO

-- Unittest template for a stored procedure
EXECUTE tSQLt.NewTestClass [TestClassName]
GO

CREATE or ALTER PROC [TestClassName].Test [Description of the test]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.[tableName]'
	EXEC tSQLt.ApplyConstraint @TableName='dbo.[tableNameOfTableYouWannaPutAConstraintOn]', @ConstraintName = '[Constraint]'

	--If you are expecting an exception use this code:
	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%[ExpectedErrorMessage]%'

	--If you are expecting no exception use this code:
	EXEC tSQLt.ExpectNoException


	INSERT INTO [tableName]([tableColumn], [tableColumn])
	VALUES([mockedDataYouWannaInsert], [mockedDataYouWannaInsert])

	EXEC dbo.[storedProcedureName] @[storedProcedureVariable] = '[storedeProcedureParameterVariable]'
	END
GO
EXEC tSQLt.RunTestClass [TestClassName]
GO

-- Unittest template for a trigger
EXECUTE tSQLt.NewTestClass [TestClassName]
GO

CREATE or ALTER PROC [TestClassName].Test [Description of the test]
AS
BEGIN
	EXEC tSQLt.FakeTable @TableName='dbo.[tableName]'

	--If you wanna already have somehting in the table insert it before applying the trigger otherwise you can remove the two line codes beneath this line.
	INSERT INTO [tableName]([tableColumn], [tableColumn])
	VALUES([mockedDataYouWannaInsert], [mockedDataYouWannaInsert])


	EXEC tSQLt.ApplyTrigger @TableName='dbo.[tableNameOfTableYouWannaPutTheTriggerOn]', @TriggerName = '[Trigger]'


	--If you are expecting an exception use this code:
	EXEC tSQLt.ExpectException @ExpectedMessagePattern = '%[ExpectedErrorMessage]%'

	--If you are expecting no exception use this code:
	EXEC tSQLt.ExpectNoException


	INSERT INTO [tableName]([tableColumn], [tableColumn])
	VALUES([mockedDataYouWannaInsert], [mockedDataYouWannaInsert])

	END
GO

EXEC tSQLt.RunTestClass [TestClassName]
GO

	