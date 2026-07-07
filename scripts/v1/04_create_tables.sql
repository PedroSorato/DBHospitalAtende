/*
   Monday, July 6, 20267:28:22 AM
   User: PedroDBA
   Server: DBSRV1
   Database: hospital
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE cadastro.medico SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'cadastro.medico', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'cadastro.medico', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'cadastro.medico', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE cadastro.paciente SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'cadastro.paciente', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'cadastro.paciente', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'cadastro.paciente', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE atendimento.consulta
	(
	idConsulta int NOT NULL IDENTITY (1, 1),
	idPaciente int NOT NULL,
	idMedico int NOT NULL,
	horarioConsulta datetime2(7) NOT NULL,
	status varchar(20) NOT NULL,
	descricao varchar(500) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE atendimento.consulta ADD CONSTRAINT
	PK_consulta PRIMARY KEY CLUSTERED 
	(
	idConsulta
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE atendimento.consulta ADD CONSTRAINT
	FK_Consulta_Paciente FOREIGN KEY
	(
	idPaciente
	) REFERENCES cadastro.paciente
	(
	idPaciente
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE atendimento.consulta ADD CONSTRAINT
	FK_Consulta_Medico FOREIGN KEY
	(
	idMedico
	) REFERENCES cadastro.medico
	(
	idMedico
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE atendimento.consulta SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'atendimento.consulta', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'atendimento.consulta', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'atendimento.consulta', 'Object', 'CONTROL') as Contr_Per 

/*
   Monday, July 6, 20267:35:08 AM
   User: PedroDBA
   Server: DBSRV1
   Database: hospital
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER SCHEMA atendimento TRANSFER dbo.exame 
GO
ALTER TABLE atendimento.exame SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'atendimento.exame', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'atendimento.exame', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'atendimento.exame', 'Object', 'CONTROL') as Contr_Per 

/*
   Monday, July 6, 20267:20:40 AM
   User: PedroDBA
   Server: DBSRV1
   Database: hospital
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE cadastro.especialidade SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'cadastro.especialidade', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'cadastro.especialidade', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'cadastro.especialidade', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE cadastro.medico
	DROP CONSTRAINT FK_idEspecialidade
GO
ALTER TABLE cadastro.medico ADD CONSTRAINT
	FK_Medico_Especialidade FOREIGN KEY
	(
	idEspecialidade
	) REFERENCES cadastro.especialidade
	(
	idEspecialidade
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE cadastro.medico SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'cadastro.medico', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'cadastro.medico', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'cadastro.medico', 'Object', 'CONTROL') as Contr_Per 

/*
   Monday, July 6, 20267:43:28 AM
   User: PedroDBA
   Server: DBSRV1
   Database: hospital
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE rh.funcao SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'rh.funcao', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'rh.funcao', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'rh.funcao', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE rh.funcionario
	(
	idFuncionario int NOT NULL IDENTITY (1, 1),
	idFuncao int NOT NULL,
	nome varchar(150) NOT NULL,
	email varchar(150) NOT NULL,
	telefone varchar(15) NOT NULL,
	dataAdmissao datetime NOT NULL,
	ativo bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE rh.funcionario ADD CONSTRAINT
	PK_funcionario PRIMARY KEY CLUSTERED 
	(
	idFuncionario
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE rh.funcionario ADD CONSTRAINT
	FK_Funcionario_Funcao FOREIGN KEY
	(
	idFuncao
	) REFERENCES rh.funcao
	(
	idFuncao
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE rh.funcionario SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'rh.funcionario', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'rh.funcionario', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'rh.funcionario', 'Object', 'CONTROL') as Contr_Per 

/*
   Monday, July 6, 20267:40:51 AM
   User: PedroDBA
   Server: DBSRV1
   Database: hospital
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE rh.funcao
	(
	idFuncao int NOT NULL IDENTITY (1, 1),
	nomeFuncao varchar(50) NOT NULL,
	descricao varchar(200) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE rh.funcao ADD CONSTRAINT
	PK_funcao PRIMARY KEY CLUSTERED 
	(
	idFuncao
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE rh.funcao SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'rh.funcao', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'rh.funcao', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'rh.funcao', 'Object', 'CONTROL') as Contr_Per 

/*
   Monday, July 6, 20266:24:40 AM
   User: PedroDBA
   Server: DBSRV1
   Database: hospital
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE cadastro.paciente
	DROP CONSTRAINT PK_paciente
GO
ALTER TABLE cadastro.paciente ADD CONSTRAINT
	PK_paciente PRIMARY KEY CLUSTERED 
	(
	idPaciente
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE UNIQUE NONCLUSTERED INDEX cpf ON cadastro.paciente
	(
	cpf
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE cadastro.paciente SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'cadastro.paciente', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'cadastro.paciente', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'cadastro.paciente', 'Object', 'CONTROL') as Contr_Per 