USE [master]
RESTORE DATABASE [DockerDatabase] FROM  DISK = N'/var/opt/mssql/backup/DockerDatabase.bak' WITH  FILE = 1
,  MOVE N'DockerDatabase' TO N'/var/opt/mssql/data/DockerDatabase.mdf',  MOVE N'DockerDatabase_log' TO N'/var/opt/mssql/data/DockerDatabase_log.ldf'
,  NOUNLOAD,  REPLACE
GO