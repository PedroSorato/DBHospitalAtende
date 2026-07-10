/* Criação de logins */

USE [master]
GO
CREATE LOGIN [login_recepcao] WITH PASSWORD=N'SenhaForte123!', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO

USE [master]
GO
CREATE LOGIN [login_medico] WITH PASSWORD=N'SenhaForte123!', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO

USE [master]
GO
CREATE LOGIN [login_enfermeiro] WITH PASSWORD=N'SenhaForte123!', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO

USE [master]
GO
CREATE LOGIN [login_dba_hospital] WITH PASSWORD=N'SenhaForte123!', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO

/* Criação de usuários */

USE [hospital]
GO
CREATE USER [usr_recepcao] FOR LOGIN [login_recepcao]
GO

USE [hospital]
GO
CREATE USER [usr_medico] FOR LOGIN [login_medico]
GO

USE [hospital]
GO
CREATE USER [usr_enfermeiro] FOR LOGIN [login_enfermeiro]
GO

USE [hospital]
GO
CREATE USER [usr_dba_hospital] FOR LOGIN [login_dba_hospital]
GO

