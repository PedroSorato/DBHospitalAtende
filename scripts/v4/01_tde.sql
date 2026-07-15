-- 1 Criação de uma chave principal com uma senha forte
USE master;
GO
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'S3nh4Mu1t0F0rt3';

-- 2 Verificando a chave principal de dados e a chave principal de serviço
SELECT name KeyName,
 symmetric_key_id KeyID,
 key_length KeyLength,
 algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

-- 3 Criando o certificado no banco de dados principal
CREATE CERTIFICATE Cert_TDE_HopistalAtende_2026
WITH SUBJECT = 'Certificado de Criptografia TDE Hospital'

-- 4 Verificando o certificado
SELECT name CertName,
  certificate_id CertID,
  pvt_key_encryption_type_desc EncryptType,
  issuer_name Issuer
FROM sys.certificates
WHERE name  = 'Cert_TDE_HopistalAtende_2026';

-- 5 Criando a chave de criptografia de banco de dados
USE hospital;
GO
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE Cert_TDE_HopistalAtende_2026;
 
-- 6 Verificando a chave de criptografia do banco de dados
SELECT DB_NAME(database_id) DbName,
encryption_state EncryptState,
key_algorithm KeyAlgorithm,
key_length KeyLength,
encryptor_type EncryptType
FROM sys.dm_database_encryption_keys;
/*==== ALGUNS STATUS DE CRIPTOGRAFIA======
0 : No database encryption key present, no encryption
1 : Unencrypted
2 : Encryption in progress
3 : Encrypted
4 : Key change in progress
5 : Decryption in progress
6 : The certificate or asymmetric key encrypting the DEK is being changed
==========*/

-- 7 Ativando o banco de dados para criptografia
ALTER DATABASE hospital
SET ENCRYPTION ON;
GO

-- Verificando novamente se a criptografia foi ativada
SELECT DB_NAME(database_id) DbName,
  encryption_state EncryptState,
  key_algorithm KeyAlgorithm,
  key_length KeyLength,
  encryptor_type EncryptType
FROM sys.dm_database_encryption_keys;

-- 8 Realizando o backup da Service Master Key (Chave Principal de Serviço)
Use master;
GO
BACKUP SERVICE MASTER KEY 
TO FILE = 'P:\chaves\SvcMasterKey.key'
ENCRYPTION BY PASSWORD = 'S3nh4Mu1t0F0rt3'

-- 8.1 Realizando o backup da Data Master Key (Chave Principal de Dados)
BACKUP MASTER KEY 
TO FILE = 'P:\chaves\DbMasterKey.key'
ENCRYPTION BY PASSWORD = 'S3nh4Mu1t0F0rt3'

-- 8.2 Realizando o backup do certificado
BACKUP CERTIFICATE Cert_TDE_HopistalAtende_2026
TO FILE = 'P:\chaves\ProductDBNameCert.cer'
WITH PRIVATE KEY(
 FILE = 'P:\chaves\ProductDBNameCert.prvk',
 ENCRYPTION BY PASSWORD = 'S3nh4Mu1t0F0rt3'
);

-- 9 Realizando um novo backup do banco de dados já criptografado 
BACKUP DATABASE [hospital] TO  DISK = N'P:\Backup\bkphpatendeCRIPTOGRAFADO' 
WITH  COPY_ONLY, NOFORMAT, NOINIT,  NAME = N'HPAtende-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO