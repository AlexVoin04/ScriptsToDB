USE [master]
GO

DECLARE @Sql NVARCHAR(MAX) = '';

-- Генерация SQL-запросов на удаление логинов
SELECT @Sql += 'DROP LOGIN [' + name + ']; ' + CHAR(13)
FROM sys.server_principals
WHERE type IN ('S', 'U') -- Учитываем только SQL логины и Windows пользователей
AND name LIKE 'ПР-23.104-%'; -- Фильтр по шаблону

-- Выполнение сгенерированных запросов
EXEC sp_executesql @Sql;
GO


