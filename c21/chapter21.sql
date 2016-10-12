export to employee_ex1.del of del select * from employee


export to empresume_ex2.del
of del
lobs to c:\export\lobs
select * from emp_resume


export to empresume_ex3.del
of del
lobs to c:\export\lobs
lobfile remumes.lob
select * from emp_resume


export to products_ex4.ixf of ixf
XML TO c:\export\xml XMLFILE productdescriptions
modified by xmlinsepfiles xmlsaveschema
select * from product


export to products_ex4.ixf of ixf
XML TO c:\export\xml XMLFILE productdescriptions
modified by xmlinsepfiles xmlsaveschema
messages exportmessages.txt
select * from product


create table promotion_candidate like employee


import from c:\export\employee_ex1.del
of del
insert into promotion_candidate


alter table promotion_candidate add constraint promo_pk primary key(empno)


import from c:\export\employee_ex1.del of del
messages promo_insert_ex2.txt
insert into promotion_candidate


import from c:\export\employee_ex3.del of del
allow write access warningcount 10 notimeout
messages promo_insert_ex3.txt
insert_update into promotion_candidate


import from c:\export\products_ex4.ixf of ixf
xml from c:\export\xml xmlparse preserve whitespace
rowcount 2
warningcount 50 notimeout
replace into product


import from c:\export\products_ex4.ixf of ixf
xml from c:\export\xml xmlparse preserve whitespace
skipcount 2
warningcount 50 notimeout
insert_update into product


load from c:\export\products_ex4.ixf of ixf
xml from c:\export\xml
replace into product


set integrity for product all immediate checked


