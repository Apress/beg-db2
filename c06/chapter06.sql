select name, creator, colcount from sysibm.systables


select name, creator, colcount as "No of Columns", abs(npages*4*1024) as "Bytes" from sysibm.systables


select name, creator from sysibm.systables where creator = 'FUZZY'


select name, creator, colcount as "No of Columns", abs(npages*4*1024) as "Bytes"
from sysibm.systables
where creator = 'SYSIBM'
and name like 'SYS%'
or (npages > 0 and colcount < 250)
and type not in ('A', 'O', 'X')
-- add as many more clauses as your query logic demands


select workdept, sum(salary) as newsalary
from employee
group by workdept


select workdept, sum(salary) DeptSal
from employee
group by workdept
having sum(salary) > 100000


select workdept, sum(salary) DeptSal
from employee
group by workdept
having sum(salary) > 100000
order by workdept


select e.firstnme, e.lastname, d.deptname, d.location
from employee e inner join department d on e.workdept = d.deptno


select firstnme, surname
from employee
where empno in
(select mgrno from department)


Select firsname, surname from employee where salary < 80000
Union
Select firstnme, surname from employee where salary < 120000


Select surname from employee
Intersect
Select firstnme from employee


select current timestamp from sysibm.sysdummy1


Insert into employee
(empno, firstnme, lastname, hiredate, edlevel)
Values
('111111', 'Wolfgang', 'Mozart', '01/01/2007', 16)


Insert into employee
(memberid, firstnme, lastname, hiredate, edlevel)
Values
('222222', 'Jimi', 'Hendrix', current date, 16)


values current time


insert into department
(deptno, deptname, admrdept)
values
('K22','BRANCH OFFICE K22', 'EO1'),
('L22','BRANCH OFFICE L22', 'EO1'),
('M22','BRANCH OFFICE M22', 'EO1')


Update employee
Set salary = 150000,
bonus = 50000
Where empno = '444444'


Update employee
Set (salary, bonus) = (150000,50000)
Where empno = '444444'


Delete from employee
Where hiredate > '2009-01-01'


