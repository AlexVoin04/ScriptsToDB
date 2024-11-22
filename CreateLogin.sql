-- Группа ПР-23.101
CREATE LOGIN [ПР-23.101-1] WITH PASSWORD=N'Passw0rd', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON , CHECK_POLICY=ON
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [ПР-23.101-1]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [ПР-23.101-1]
GO
USE [master]
GO
DENY VIEW ANY DATABASE TO [ПР-23.101-1]
GO
CREATE LOGIN [ПР-23.101-2] WITH PASSWORD=N'Passw0rd', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON , CHECK_POLICY=ON
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [ПР-23.101-2]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [ПР-23.101-2]
GO
USE [master]
GO
DENY VIEW ANY DATABASE TO [ПР-23.101-2]
GO
CREATE LOGIN [ПР-23.101-3] WITH PASSWORD=N'Passw0rd', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON , CHECK_POLICY=ON
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [ПР-23.101-3]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [ПР-23.101-3]
GO
USE [master]
GO
DENY VIEW ANY DATABASE TO [ПР-23.101-3]
GO
CREATE LOGIN [ПР-23.101-4] WITH PASSWORD=N'Passw0rd', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON , CHECK_POLICY=ON
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [ПР-23.101-4]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [ПР-23.101-4]
GO
USE [master]
GO
DENY VIEW ANY DATABASE TO [ПР-23.101-4]
GO


