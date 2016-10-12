select * from nominations where empno = '000010'


create index nom_empno on nomination (empno)


create unique index award_result_pairs on award_result (empno, categoryid)


insert into award_result values (1, '000090', 1, current date)


drop index nom_empno
create index nom_empno on nomination (empno asc)


drop index award_result_pairs
create unique index award_result_pairs on award_result (empno asc, categoryid desc)


drop index nom_empno
create index nom_empno on nomination (empno asc) allow reverse scans


drop index award_result_pairs
create unique index award_result_pairs on award_result (empno, categoryid)
include (date_collected)


drop index nom_empno
create index nom_empno on nomination (empno asc) cluster allow reverse scans


select * from nomination where empno = '000010'


CONNECT TO SAMPLE;
CREATE INDEX "FUZZY "."IDX712170455590000"
ON "FUZZY "."NOMINATION"
("EMPNO" ASC, "REASON" ASC, "NOMINATIONID" ASC)
ALLOW REVERSE SCANS ;
CONNECT RESET;


create sequence doorprize


values nextval for doorprize


drop sequence doorprize


create sequence doorprize start with 10 increment by 1
maxvalue 25000 no cycle


alter sequence doorprize minvalue 0 maxvalue 50000 no cycle no cache no order


alter sequence doorprize restart


alter sequence doorprize restart with 20


select firstnme, lastname, (nextval for doorprize) as "Lucky Door Prize"
from employee


select prevval for doorprize as "Last Ticket" from sysibm.sysdummy1


create table empdoorprize (empno char(6), prizeno integer)


insert into empdoorprize select empno, nextval for doorprize from employee


select * from empdoorprize


select * from employee where workdept = 'E11'


create view opsemployee
as select * from employee where workdept = 'E11'


select * from opsemployee


create view operators
as select * from opsemployee where job = 'OPERATOR'


update operators set job = 'MANAGER' where empno = '000280'


select * from operators


create view checked_operators
as select * from opsemployee where job = 'OPERATOR'
with check option


update checked_operators set job = 'MANAGER' where empno = '000300'


grant select on opsemployee to theuser


revoke select on employee from theuser


connect to sample user theuser


select * from fuzzy.employee


select * from fuzzy.opsemployee


