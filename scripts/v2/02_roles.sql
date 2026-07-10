/* Criação de roles e adição de usuários */

USE [hospital]
GO
CREATE ROLE [rl_recepcao]
GO
USE [hospital]
GO
ALTER ROLE [rl_recepcao] ADD MEMBER [usr_recepcao]
GO

USE [hospital]
GO
CREATE ROLE [rl_medico]
GO
USE [hospital]
GO
ALTER ROLE [rl_medico] ADD MEMBER [usr_medico]
GO

USE [hospital]
GO
CREATE ROLE [rl_enfermeiro]
GO
USE [hospital]
GO
ALTER ROLE [rl_enfermeiro] ADD MEMBER [usr_enfermeiro]
GO

USE [hospital]
GO
CREATE ROLE [rl_dba_hospital]
GO
USE [hospital]
GO
ALTER ROLE [rl_dba_hospital] ADD MEMBER [usr_dba_hospital]
GO
