connect to sample


select empno, firstnme, lastname from employee where empno = '200340'


select * from nomination where empno = '200340'


insert into nomination values (123456, '200340', 'Replication Test')


connect to replica


select * from nomination where empno = '200340'


inspect rowcompestimate table name employee schema fuzzy
results keep empcompress


alter table employee compress yes


select name, compression from sysibm.systables
where name = 'EMPLOYEE' and creator = 'FUZZY'


reorg table employee resetdictionary
