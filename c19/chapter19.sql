update db cfg using LOGARCHMETH1 LOGRETAIN


attach to db2inst1
backup database sample to /db2backups/sample


backup database sample to /db2backups/sample1, /db2backups/sample2


backup database sample
to /mount1/sample, /mount2/sample, /mount3/sample, /mount4/sample
with 16 buffers buffer 4096 parallelism 4


backup database sample tablespace userspace1
to /db2backups/sample1, /db2backups/sample2


backup database sample online
to /db2backups/sample1, /db2backups/sample2
include logs


backup database sample online incremental delta
to /db2backups/sample1, /db2backups/sample2


restore database sample from/db2backups/sample taken at 20080301153901


rollforward database sample to end of logs and complete


Rollforward database sample to 20080304061500


restore database sample from /db2backups/sample
taken at 20080301153901
to /db2/sample2 into sample2 newlogpath /db2/sample2/logs
redirect without prompting.
rollforward database sample2 complete


restore database sample from /db2backups/sample1, /db2backups/sample2
taken at 20080303195125
with 16 buffers buffer 4096 parallelism 2


restore database sample tablespace (userspace1)
from /db2backups/sample1, /db2backups/sample2
online


rollforward database sample to end of logs and complete
tablespace (userspace1) online


