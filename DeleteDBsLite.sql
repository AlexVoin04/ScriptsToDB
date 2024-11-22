USE master;
GO

DECLARE @Sql NVARCHAR(MAX) = '';
DECLARE @Pattern NVARCHAR(100) = 'pr[0-9][0-9].[0-9][0-9][0-9]-[0-9][0-9]-[a-zA-Z]%';
--'pr[0-9]{2}\.[0-9]{3}-[0-9]{2}-[a-zA-Z]+';

SELECT @Sql += 'DROP DATABASE [' + name + ']; '
FROM sys.databases
WHERE name NOT LIKE @Pattern
AND state_desc = 'ONLINE' 
AND database_id > 4; -- Исключаем системные базы данных (master, tempdb, model, msdb)

EXEC sp_executesql @Sql;

GO