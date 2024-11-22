USE master;
GO

DECLARE @Sql NVARCHAR(MAX) = '';
DECLARE @DatabaseName NVARCHAR(256);
DECLARE @Pattern NVARCHAR(100) = 'pr[0-9][0-9].[0-9][0-9][0-9]-[0-9][0-9]-[a-zA-Z]%';
--'pr[0-9]{2}\.[0-9]{3}-[0-9]{2}-[a-zA-Z]+';

DECLARE db_cursor CURSOR FOR
SELECT name 
FROM sys.databases
WHERE name NOT LIKE @Pattern 
AND state_desc = 'ONLINE' 
AND database_id > 4; -- Исключаем системные базы данных

OPEN db_cursor;
FETCH NEXT FROM db_cursor INTO @DatabaseName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Sql = 'DROP DATABASE [' + @DatabaseName + '];';
    BEGIN TRY
        EXEC sp_executesql @Sql; -- Выполняем команду удаления базы данных
    END TRY
    BEGIN CATCH
        PRINT 'Ошибка при удалении базы данных: ' + @DatabaseName + ' - ' + ERROR_MESSAGE();
    END CATCH;

    FETCH NEXT FROM db_cursor INTO @DatabaseName;
END

CLOSE db_cursor;
DEALLOCATE db_cursor;
GO