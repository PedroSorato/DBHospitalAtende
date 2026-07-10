# 🔐 Segurança e Controle de Acesso (RBAC) - v2

Este módulo é responsável por estruturar toda a camada de segurança e controle de acesso ao banco de dados do hospital.

O processo de implantação foi dividido em 3 etapas sequenciais e isoladas:

---

## Estrutura de Implantação

### 1. `01_logins.sql` (Autenticação e Usuários)
Nesta etapa, gerenciamos quem pode se conectar ao servidor (Logins) e quem tem direito de acessar a base do hospital (Users). 
* **Logins (Nível Servidor):** Criados na base `master` com políticas de senha ativas (`CHECK_POLICY = ON`).
* **Users (Nível Banco de Dados):** Mapeamento dos logins para seus respectivos usuários dentro do banco `hospital`.

*Exemplo de implementação:*
```sql
USE [master]
GO
CREATE LOGIN [login_medico] WITH PASSWORD=N'SenhaForte123!', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
USE [hospital]
GO
CREATE USER [usr_medico] FOR LOGIN [login_medico]
GO
```

### 2. `02_roles.sql` (Papéis Funcionais)
Para evitar o caos de dar permissões diretamente para cada usuário (o que quebra as boas práticas de um DBA), foram criadas **Roles**. Os usuários são vinculados a essas funções.
* Centraliza a manutenção: se a recepção precisar de um novo acesso no futuro, alteramos a Role, e não usuário por usuário.

*Exemplo de implementação:*
```sql
USE [hospital]
GO
CREATE ROLE [rl_medico]
GO
ALTER ROLE [rl_medico] ADD MEMBER [usr_medico]
GO
```

### 3. `03_permissions.sql` (Privilégios de Objetos)
Aqui é definida a segurança a nível de tabela e schema. Cada role recebe estritamente as permissões necessárias para o dia a dia da operação hospitalar.
* **Médicos/Enfermeiros:** Acesso a consultas.
* **Recepção:** Restrita a visualizar médicos disponíveis e inserir novos pacientes (sem acesso a dados clínicos sensíveis).

*Exemplo de implementação:*
```sql
USE [hospital]
GO
GRANT SELECT ON [cadastro].[medico] TO [rl_recepcao]
GO
GRANT INSERT ON [cadastro].[paciente] TO [rl_recepcao]
GO
```