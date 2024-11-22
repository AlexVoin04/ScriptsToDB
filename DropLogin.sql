USE [master]
GO

DECLARE @Sql NVARCHAR(MAX) = '';

-- ��������� SQL-�������� �� �������� �������
SELECT @Sql += 'DROP LOGIN [' + name + ']; ' + CHAR(13)
FROM sys.server_principals
WHERE type IN ('S', 'U') -- ��������� ������ SQL ������ � Windows �������������
AND name LIKE '��-23.104-%'; -- ������ �� �������

-- ���������� ��������������� ��������
EXEC sp_executesql @Sql;
GO


