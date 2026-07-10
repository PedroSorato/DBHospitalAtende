use [master];
GO
BACKUP LOG [hospital] TO  DISK = N'Z:\DBHospitalAtende\scripts\v3\bkp_log\hospital_backup_2026_07_10_081211_7715600.trn' WITH NOFORMAT, NOINIT,  NAME = N'hospital_backup_2026_07_10_081211_7715600', SKIP, REWIND, NOUNLOAD, COMPRESSION,  STATS = 10, CHECKSUM
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'hospital' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'hospital' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''hospital'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'Z:\DBHospitalAtende\scripts\v3\bkp_log\hospital_backup_2026_07_10_081211_7715600.trn' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND

use [master];
GO
BACKUP DATABASE [hospital] TO  DISK = N'Z:\DBHospitalAtende\scripts\v3\bkp_diff\hospital_backup_2026_07_10_081301_2273889.bak' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'hospital_backup_2026_07_10_081301_2273889', SKIP, REWIND, NOUNLOAD, COMPRESSION,  STATS = 10, CHECKSUM
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'hospital' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'hospital' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''hospital'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'Z:\DBHospitalAtende\scripts\v3\bkp_diff\hospital_backup_2026_07_10_081301_2273889.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND


EXECUTE master.dbo.xp_delete_file 0,N'Z:\DBHospitalAtende\scripts\v3\bkp_diff',N'bak',N'2026-06-12T08:17:12'


EXECUTE master.dbo.xp_delete_file 0,N'Z:\DBHospitalAtende\scripts\v3\bkp_log',N'trn',N'2026-06-12T08:17:51'
