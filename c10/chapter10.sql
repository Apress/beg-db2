GRANT CONNECT ON DATABASE TO USER THEUSER


connect to sample user db2admin


grant connect, createtab on database to group AGROUP


disconnect sample


connect to sample user THEUSER


create table try_it_out (mynumber integer)


create role organizers


grant role organizers to THEBOSS


grant select, insert, update, delete on nomination to organizers


CONNECT TO SAMPLE;
GRANT CREATETAB,BINDADD,CONNECT ON DATABASE TO USER THEBOSS;
GRANT SELECT ON TABLE FUZZY.DEPARTMENT TO USER THEBOSS;
CONNECT RESET;


disconnect sample


connect to sample user THEBOSS


select * from fuzzy.department


connect to sample


revoke select on fuzzy.department from THEBOSS


select * from fuzzy.department


select * from THEBOSS.notatable


grant secadm on database to fuzzy


create security label component salreview_comp tree
(
''C01'' ROOT,
''KWAN_SR'' under ''C01'',
''QUINTANA_SR'' under ''C01'',
''NICHOLLS_SR'' under ''C01'',
''NATZ_SR'' under ''C01'')


create security policy salreview_policy
components salreview_comp
with db2lbacrules
restrict not authorized write security label


create security label salreview_policy.all_sr component salreview_comp ''C01''
create security label salreview_policy.natz_sr component salreview_comp ''NATZ_SR''
create security label salreview_policy.kwan_sr component salreview_comp ''KWAN_SR''
create security label salreview_policy.quintana_sr component
salreview_comp ''QUINTANA_SR''
create security label salreview_policy.nicholls_sr component
salreview_comp ''NICHOLLS_SR''


connect to sample user THEBOSS


create table salary_review
(firstnme varchar(12) not null,
lastname varchar(15) not null,
workdept char(3),
newsalary decimal(9),
salreview_label db2securitylabel)
security policy salreview_policy


grant security label salreview_policy.all_sr to THEBOSS for all access


insert into salary_review select firstnme, lastname, workdept, salary*1.1,
seclabel_by_name(''SALREVIEW_POLICY'', ''KWAN_SR'')
from fuzzy.employee where workdept = ''C01'' and lastname = ''KWAN''


insert into salary_review select firstnme, lastname, workdept, salary*1.1,
seclabel_by_name(''SALREVIEW_POLICY'', ''NATZ_SR'')
from fuzzy.employee where workdept = ''C01'' and lastname = ''NATZ''


select * from salary_review


grant select on THEBOSS.salary_review to THEUSER


select * from THEBOSS.salary_review


grant security label salreview_policy.kwan_sr to THEUSER for read access


select * from THEBOSS.salary_review


revoke security label salreview_policy.kwan_sr from THEUSER

