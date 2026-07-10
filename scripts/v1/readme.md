# 🏗️ Infraestrutura, Modelagem DDL e Carga Inicial - v1

Esta pasta contém a base fundacional do projeto do banco de dados hospitalar. Ele cobre desde o provisionamento do acesso administrativo ao DBA, passando pela criação física dos objetos (tabelas e schemas), até a carga de dados para testes de performance.

---

## 🚀 Etapas do Script de Inicialização

### 1. Provisionamento do DBA e Segurança do Servidor
Configuração do acesso administrativo a nível de servidor para garantir o gerenciamento pleno da instância.
* Criação do Login do DBA principal.
* Atribuição da role de servidor **`sysadmin`**, garantindo controle total sobre auditorias, backups e tuning do ambiente.

### 2. Criação do Banco de Dados e Schemas
* **`CREATE DATABASE`:** Inicialização do banco de dados com parametrizações limpas.
* **Separação por Schemas:** Organização lógica dos objetos de negócio (ex: `[cadastro]`, `[atendimento]`, `[financeiro]`). O uso de schemas evita o uso genérico do `dbo` e melhora a aplicação de permissões de segurança em lote.

### 3. Modelagem Física (DDL)
Criação de todas as entidades do ecossistema hospitalar, aplicando regras de integridade relacional estritas:
* Chaves Primárias (`PK`) e Chaves Estrangeiras (`FK`) garantindo a integridade referencial.
* Restrições (`CHECKS` e `NOT NULL`) para evitar dados corrompidos ou inconsistentes (ex: impedir idades negativas ou documentos em branco).
* Tipos de dados otimizados para performance e economia de armazenamento.

### 4. População da Base (`05_seed_data.sql`)
Arquivo responsável por realizar o *seed* (semeadura) dos dados iniciais do hospital.
* Insere registros realistas de médicos, especialidades, alas hospitalares, pacientes e prontuários.
* Essencial para validar o funcionamento de relacionamentos e permitir testes de escrita e leitura em consultas complexas.
