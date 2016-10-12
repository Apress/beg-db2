create database test1


create database test2 alias mynewdb


list database directory


create database test3 alias myutfdb using codeset utf-8 territory US
collate using system


create database test4 alias myutfdb
using codeset utf-8 territory US collate using system
automatic storage yes on '/home/db2inst1'
catalog tablespace managed by automatic storage


create database test5 automatic storage no on 'c:\'
alias testdb5 using codeset utf-8 territory us collate using system pagesize 4096
catalog tablespace managed by system using ('c:\db2\node0000\test5\cattbs')
user tablespace managed by system using ('c:\db2\node0000\test5\usertbs')
temporary tablespace managed by system using ( 'c:\db2\node0000\test5\temptbs')


create database test6 automatic storage no on '/home/db2inst1'
alias testdb5 using codeset utf-8 territory us collate using system pagesize 4096
catalog tablespace managed by database using
(FILE '/home/db2inst1/db2inst1/NODE0000/test6/cattbs.001')
user tablespace managed by database using
(FILE '/home/db2inst1/db2inst1/NODE0000/test6/usertbs.001' 10240,
FILE '/home/db2inst1/db2inst1/NODE0000/test6/usertbs.002' 10240,
FILE '/home/db2inst1/db2inst1/NODE0000/test6/usertbs.003' 10240)
temporary tablespace managed by database using
(FILE '/home/db2inst1/db2inst1/NODE0000/test6/temptbs.001' 10240)


create bufferpool awardbp size 10000 pagesize 4K


create database test7 automatic storage no on 'c:\'
alias testdb6 using codeset utf-8 territory us collate using system pagesize 4096
catalog tablespace managed by system using ('C:\DB2\NODE0000\test7\syscat')
extentsize 16 prefetchsize 16 overhead 10 transferrate 0.2
user tablespace managed by database using
(FILE ' C:\DB2\NODE0000\test7\usertbs\usertbs.001' 102400,
FILE ' C:\DB2\NODE0000\test7\usertbs\usertbs.002' 102400,
FILE ' C:\DB2\NODE0000\test7\usertbs\usertbs.003' 102400)
extentsize 16 prefetchsize 64 overhead 10 transferrate 0.2
temporary tablespace managed by database using (DEVICE 'F:' 204800)
extentsize 16 prefetchsize 16 overhead 4 transferrate 0.05


alter database test4 add storage on '/extra/db2space'


create tablespace extratbs managed by database using
(FILE 'c:\db2\node0000\sample\extratbs\extratbs.001' 10240K)


create large tablespace awardlobs managed by database using (FILE 'c:\db2
\node0000\sample\awardlobs\awardlobs.001' 1024M)


alter tablespace awardlobs add
(FILE 'c:\db2\node0000\sample\awardlobs.002' 10240K)


alter tablespace awardlobs drop
(FILE 'c:\db2\node0000\sample\awardlobs.002')


alter tablespace awardlobs resize (ALL 20480M)


alter tablespace extratbs prefetchsize 64 overhead 15 transferrate 0.5


drop tablespace extratbs


alter tablespace extratbs no file system caching


list tablespaces


list tablespaces show detail


list tablespace containers for 6


alter tablespace awardlobs bufferpool awardbp


alter bufferpool awardbp immediate size 50000


drop database test3


uncatalog database testdb3
