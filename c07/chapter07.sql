drop table nomination


Create table nomination
(
nominationID INTEGER Not Null,
nominee char(6) Not Null,
nominator char(6) Not Null,
reason VARCHAR(250),
nomdate date Not Null
)


Create table nomination
(
nominationID BIGINT,
nominee char(6),
nominator char(6),
reason VARCHAR(250),
nomdate date
)


Create table nomination
(
nominationID BIGINT Not Null,
132 CHAPTER 7 ¦ SQL FOR DB2: PART 2
942XCh07CMP1 5/9/08 1:21 PM Page 132
nominee char(6) Not Null,
nominator char(6) Not Null,
reason VARCHAR(250),
nomdate date Not Null
)


Create table nomination
(
nominationID BIGINT Not Null Primary Key,
nominee char(6) Not Null,
nominator char(6) Not Null,
reason VARCHAR(250),
nomdate date Not Null
)


Create table nomination
(
nominationID BIGINT Not Null,
nominee char(6) Not Null,
nominator char(6) Not Null,
reason VARCHAR(250),
nomdate date Not Null,
Primary Key (nominationID)
)


alter table nomination add primary key (nominationid)


Create table category
(
CategoryID INTEGER Not Null Primary Key,
CateogryName VARCHAR(50) Not Null,
Eligibility VARCHAR(250)
)


alter table nomination
add column categoryid integer not null


alter table nomination
add column categoryid integer not null default 1


alter table nomination add foreign key CategoryExists (categoryid)
references category (categoryid)


alter table nomination drop constraint CategoryExists


alter table nomination add foreign key CategoryExists (categoryid)
references category (categoryid) on delete restrict


Create table nomination
(
nominationID BIGINT Not Null Primary Key,
nominee char(6) Not Null,
nominator char(6) Not Null,
reason VARCHAR(250),
nomdate date Not Null,
categoryid INTEGER Not Null,
check (nominee != nominator),
Foreign Key CategoryExists (categoryid)
references category (categoryid) on delete restrict
)


alter table nomination add constraint
NoSelfNomination check (nominee != nominator)


alter table nomination drop constraint NoSelfNomination


alter table nomination add constraint
NoSelfNomination check (nominee != nominator) not enforced


alter table nomination add constraint
NoSelfNomination check (nominee != nominator)
not enforced enable query optimization


Select * from nomination where nominee = nominator


Create table nomination
(
nominationID BIGINT Not Null Primary Key generated always as identity,
nominee char(6) Not Null,
nominator char(6) Not Null,
reason VARCHAR(250),
nomdate date Not Null,
categoryid INTEGER Not Null,
check (nominee != nominator) not enforced enable query optimization,
Foreign Key CategoryExists (categoryid)
references category (categoryid) on delete restrict
)


drop table category


Create table category
(
CategoryID INTEGER Primary Key Generated Always as Identity
(Start With 1 Increment by 1 minvalue 0 maxvalue 999999999
no cycle cache 5 no order),
CateogryName VARCHAR(50) Not Null,
Eligibility VARCHAR(250)
)


alter table category add column
UpperCatName VARCHAR(50) generated always as (upper(CategoryName))


Create table AwardWinner
(AwardWinnerID integer Primary Key Generated Always as Identity
(Start With 1 Increment by 1),
DateWon Date Not Null,
TotalVotes Integer Not Null,
Picture BLOB)
in userspace1
Index in userspace1
Long in picturelobs


Create table EmployeeCopy
as (select firstnme, lastname from employee)
definition only


create table EmployeeCopy3 like EmployeeCopy2
including column defaults
excluding identity column attributes


