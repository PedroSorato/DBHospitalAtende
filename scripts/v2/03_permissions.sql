/* Garantido permissões para o role recepção */

use [hospital]
GO
GRANT SELECT ON [cadastro].[medico] TO [rl_recepcao]
GO
use [hospital]
GO
GRANT INSERT ON [cadastro].[paciente] TO [rl_recepcao]
GO
use [hospital]
GO
GRANT SELECT ON [cadastro].[paciente] TO [rl_recepcao]
GO
use [hospital]
GO
GRANT UPDATE ON [cadastro].[paciente] TO [rl_recepcao]
GO
use [hospital]
GO
GRANT SELECT ON [cadastro].[especialidade] TO [rl_recepcao]
GO
use [hospital]
GO
GRANT INSERT ON [atendimento].[consulta] TO [rl_recepcao]
GO
use [hospital]
GO
GRANT SELECT ON [atendimento].[consulta] TO [rl_recepcao]
GO
use [hospital]
GO
GRANT UPDATE ON [atendimento].[consulta] TO [rl_recepcao]
GO

/* Garantido permissões para role médico */

use [hospital]
GO
GRANT SELECT ON [atendimento].[consulta] TO [rl_medico]
GO
use [hospital]
GO
GRANT SELECT ON [atendimento].[exame] TO [rl_medico]
GO
use [hospital]
GO
GRANT SELECT ON [cadastro].[medico] TO [rl_medico]
GO
use [hospital]
GO
GRANT SELECT ON [cadastro].[paciente] TO [rl_medico]
GO

/* Garantido permissões para role enfermeiro */

use [hospital]
GO
GRANT SELECT ON [cadastro].[medico] TO [rl_enfermeiro]
GO
use [hospital]
GO
GRANT SELECT ON [cadastro].[paciente] TO [rl_enfermeiro]
GO
use [hospital]
GO
GRANT SELECT ON [atendimento].[exame] TO [rl_enfermeiro]
GO
use [hospital]
GO
GRANT SELECT ON [atendimento].[consulta] TO [rl_enfermeiro]
GO
use [hospital]
GO
GRANT UPDATE ON [atendimento].[consulta] ([status]) TO [rl_enfermeiro]
GO
use [hospital]
GO
GRANT SELECT ON [cadastro].[especialidade] TO [rl_enfermeiro]
GO

/* Garantido permissões para role dba */

use [hospital]
GO
GRANT ALTER ON SCHEMA::[atendimento] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT DELETE ON SCHEMA::[atendimento] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT INSERT ON SCHEMA::[atendimento] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT SELECT ON SCHEMA::[atendimento] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT UPDATE ON SCHEMA::[atendimento] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT VIEW DEFINITION ON SCHEMA::[atendimento] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT ALTER ON SCHEMA::[rh] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT DELETE ON SCHEMA::[rh] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT INSERT ON SCHEMA::[rh] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT SELECT ON SCHEMA::[rh] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT UPDATE ON SCHEMA::[rh] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT VIEW CHANGE TRACKING ON SCHEMA::[rh] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT ALTER ON SCHEMA::[cadastro] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT DELETE ON SCHEMA::[cadastro] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT INSERT ON SCHEMA::[cadastro] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT SELECT ON SCHEMA::[cadastro] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT UPDATE ON SCHEMA::[cadastro] TO [rl_dba_hospital]
GO
use [hospital]
GO
GRANT VIEW DEFINITION ON SCHEMA::[cadastro] TO [rl_dba_hospital]
GO

