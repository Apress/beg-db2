create table emp_votes
(empno char(6) not null references employee(empno),
timeofvote date not null)


create procedure employee_vote(in employee_id char(6), out current_votes integer)
specific emp_vote_by_id
dynamic result sets 0
modifies sql data
not deterministic
language sql
begin atomic
insert into emp_votes values (employee_id, current date);
select count(*) into current_votes from emp_votes where empno = employee_id;
end


create procedure emp_vote_standings()
specific all_emp_standings
dynamic result sets 1
reads sql data
not deterministic
called on null input
language sql
begin
-- declare the cursor
declare vote_cursor cursor with return for select * from emp_votes;
-- open the cursor for return to the caller
open vote_cursor;
-- We're at the end of the procedure. Any open cursors at this point are returned
end


Call employee_vote('200010',?)


call emp_vote_standings()


create procedure employee_vote
(IN employee_firstname varchar(50),
IN employee_lastname varchar(50),
OUT current_votes integer)
specific emp_vote_by_name
dynamic result sets 0
modifies sql data
not deterministic
language sql
PVOTE: begin
-- the PVOTE: text acts to label the entire body of the procedure
declare my_name varchar(50);
declare employee_id char(6);
declare matches integer default 0;
declare ok_to_vote integer default 0;
declare current_votes integer default 0;
values current user into my_name;
-- example case statement, to see if you are voting for yourself
case my_name
when employee_firstname then
set ok_to_vote = 0;
when employee_lastname then
set ok_to_vote = 0;
else
set ok_to_vote = 1;
end case;
-- sample for loop, to find users with matching names
for employee as emp_cursor cursor for
select empno
from emp
where firstnme = employee_firstname
and lastname = employee_lastname do
call my_notify_procedure();
end for;
-- example if-then test, and use of labels, leave and goto
if ok_to_vote = 0 then
goto invalid_emp;
elseif ok_to_vote = 1 then
goto valid_emp;
else
leave PVOTE; -- something disasterous happened, leave the procedure
end if;
invalid_emp:
-- We can deal with our own failure logic, by jumping to this label
return -1;
valid_emp:
-- We can deal with our own success logic, by jumping to this label
Select empno into employee_id from emp
where firstnme = employee_firstname
and lastname = employee_lastname;
insert into emp_votes values (employee_id, current date);
select count(*) into current_votes from emp_votes where empno = employee_id;
return current_votes;
end


drop procedure employee_vote


drop specific procedure emp_vote_by_name


drop procedure employee_vote(char, int)


create function emp_current_votes
(employee_id char(6))
returns integer
specific emp_curr_votes_int
not deterministic
language sql
return select count(*)from emp_votes where empno = employee_id


Create function emp_current_votes_row(employee_id char(6))
returns row (empno char(6), votecount integer)
specific emp_full_votes
not deterministic
language sql
called on null input
return select empno, count(*) votes
from emp_votes
where empno = employee_id
group by empno


create function emp_vote_results()
returns table(empno char(6), votecount integer)
specific emp_results
not deterministic
language sql
called on null input
return select empno, count(*) votes
from emp_votes
group by empno


select firstnme, lastname, emp_current_votes(empno) from employee


select * from table(emp_vote_results()) as t


select * from table(emp_vote_results()) as t where t.empno = '200010'


Select emp_current_votes(t.empno) from table(emp_vote_results()) as t



