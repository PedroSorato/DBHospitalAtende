# DB Hospital Atende

Projeto de portfólio voltado para **Administração de Banco de Dados**, desenvolvido em **SQL Server**, com foco em demonstrar na prática a construção, administração, segurança, manutenção e evolução de um banco de dados relacional.

O objetivo deste projeto **não é reproduzir um sistema hospitalar completo**, mas sim criar um ambiente de estudo e portfólio suficientemente realista para aplicar conceitos de:

- modelagem de dados
- criação de banco e objetos
- schemas
- constraints
- índices
- usuários, roles e permissões
- backup e restore
- auditoria
- criptografia
- mascaramento de dados
- alta disponibilidade

---

## Objetivo do Projeto

O **DB Hospital Atende** foi criado como um projeto progressivo para consolidar conhecimentos de **DBA SQL Server**, simulando um cenário hospitalar simplificado.

A proposta é evoluir o banco em versões, saindo de uma estrutura relacional inicial até recursos mais avançados de administração e segurança, como:

- **Transparent Data Encryption**
- **Always Encrypted**
- **Dynamic Data Masking**
- **Auditoria**
- **Backup/Restore**
- **Alta disponibilidade (Always On, quando aplicável)**

---

# Tecnologias e Ferramentas

- **SQL Server**
- **SQL Server Management Studio (SSMS)**
- Modelagem relacional
- T-SQL
- Git/GitHub

---

# Estrutura do Projeto

## Schemas

O projeto foi organizado em três schemas principais:

### `cadastro`
Responsável pelos dados mestres do sistema.

Tabelas:
- `cadastro.Paciente`
- `cadastro.Medico`
- `cadastro.Especialidade`

### `atendimento`
Responsável pelo fluxo de atendimento do paciente.

Tabelas:
- `atendimento.Consulta`
- `atendimento.Exame`

### `rh`
Responsável pelo contexto administrativo e de funcionários.

Tabelas:
- `rh.Funcao`
- `rh.Funcionario`

---

# Modelo de Dados

## Tabelas principais

### `cadastro.Paciente`
Armazena os dados cadastrais dos pacientes.

Campos principais:
- `IdPaciente`
- `Nome`
- `CPF`
- `Telefone`
- `DataNascimento`

---

### `cadastro.Especialidade`
Catálogo de especialidades médicas.

Campos principais:
- `IdEspecialidade`
- `NomeEspecialidade`

---

### `cadastro.Medico`
Armazena os médicos cadastrados e sua especialidade.

Campos principais:
- `IdMedico`
- `Nome`
- `CRM`
- `IdEspecialidade`

---

### `atendimento.Consulta`
Representa as consultas realizadas entre pacientes e médicos.

Campos principais:
- `IdConsulta`
- `IdPaciente`
- `IdMedico`
- `HorarioConsulta`
- `Status`
- `Descricao`

---

### `atendimento.Exame`
Representa exames vinculados a uma consulta.

Campos principais:
- `IdExame`
- `IdConsulta`
- `DataExame`
- `Resultado`
- `Status`

---

### `rh.Funcao`
Catálogo de funções/cargos dos funcionários.

Campos principais:
- `IdFuncao`
- `NomeFuncao`

---

### `rh.Funcionario`
Armazena funcionários internos do hospital e sua função.

Campos principais:
- `IdFuncionario`
- `Nome`
- `IdFuncao`
- `Telefone`
- `Email`

---

# Relacionamentos principais

- Um **médico** pertence a uma **especialidade**
- Uma **consulta** pertence a um **paciente**
- Uma **consulta** pertence a um **médico**
- Um **exame** pertence a uma **consulta**
- Um **exame** possui um **tipo de exame**
- Um **funcionário** pertence a uma **função**

---

# Estrutura de Pastas

```bash
DBHospitalAtende/
│
├── README.md
├── docs/
│   └── modelo-logico.png
│
├── scripts/
│   ├── v1/
│   │   ├── 01_create_database.sql
│   │   ├── 02_create_schemas.sql
│   │   ├── 03_create_tables.sql
│   │   └── 04_seed_data.sql
│   │
│   ├── v2/
│   │   ├── 01_constraints.sql
│   │   ├── 02_indexes.sql
│   │   └── 03_query_tests.sql
│   │
│   ├── v3/
│   │   ├── 01_logins_users.sql
│   │   ├── 02_roles_permissions.sql
│   │   └── 03_permission_tests.sql
│   │
│   ├── v4/
│   │   ├── 01_full_backup.sql
│   │   ├── 02_diff_backup.sql
│   │   ├── 03_log_backup.sql
│   │   └── 04_restore_tests.sql
│   │
│   ├── v5/
│   │   └── 01_tde.sql
│   │
│   ├── v6/
│   │   └── 01_always_encrypted.sql
│   │
│   ├── v7/
│   │   └── 01_dynamic_data_masking.sql
│   │
│   ├── v8/
│   │   ├── 01_audit.sql
│   │   └── 02_audit_tests.sql
│   │
│   └── v9/
│       └── 01_always_on_notes.sql
│
└── images/
    └── prints/