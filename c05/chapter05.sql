create table Nomination
(
NominationID BIGINT not null,
EmpNo char(6) not null,
Reason varchar(250)
)


INSERT INTO NOMINATION
(NominationID, Empno, Reason )
VALUES (:VAR01, :VAR02, :VAR03)


connect to sample
call addnomination (1, '000010', 'Eileen designed the new company logo');
select * from nomination;