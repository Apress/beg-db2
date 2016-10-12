xquery declare default element namespace "http://posample.org";
db2-fn:sqlquery("select info from fuzzy.customer")


xquery declare default element namespace "http://posample.org";
for $x in db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO')
return $x


Xquery declare default element namespace "http://posample.org";
for $x in db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO')/customerinfo/name
return $x


Xquery declare default element namespace "http://posample.org";
for $x in db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO')/customerinfo
let $cname := xs:string($x/name)
let $cprovince := xs:string($x/addr/prov-state)
return ($cname, $cprovince)


Xquery declare default element namespace "http://posample.org";
for $x in db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO'')/customerinfo
where $x/name != 'Jim Noodle'
return $x/name


xquery declare default element namespace "http://posample.org";
for $x in db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO')/customerinfo
where $x/name != 'Jim Noodle'
order by $x/name/text()
return $x/name


xquery declare default element namespace "http://posample.org";
db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO')


xquery declare default element namespace "http://posample.org";
db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO ')/customerinfo/addr/pcode-zip


xquery declare default element namespace "http://posample.org";
db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO')/customerinfo[@Cid=1004 or @Cid=1005]/name


Xquery declare default element namespace "http://posample.org";
db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO')/customerinfo[@Cid=1004]/phone[2]


Xquery declare default element namespace "http://posample.org";
db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO')/customerinfo/addr/*/text()


xquery declare default element namespace "http://posample.org";
db2-fn:xmlcolumn('FUZZY.CUSTOMER.INFO')/customerinfo//phone


select x.name, x.city
from customer,
xmltable(XMLNAMESPACES(DEFAULT 'http://posample.org'),
'$cust/customerinfo' passing info as "cust"
columns
"NAME" varchar(50) PATH 'name',
"CITY" varchar(50) PATH 'addr/city'
) as x


insert into customer values (1006, '<my_xml>Hello</my_xml>','<more_xml/>')


insert into customer values (1006, '<my_xml>Hello</wrong_tag>','<more_xml/>')


Insert into customer (cid, info)
values (1006,
xmlvalidate(source-xml-data according to xmlschema id "http://www.myschema.com"))


Insert into customer (cid, info)
values (1006, xmlvalidate(source-xml-data according to xmlschema id "CUSTOMER"))


update customer set info = '<my_xml>Hello</my_xml>' where cid = 1006


Update customer
set info = xmlparse (document '<my_xml>Hello</my_xml>' preserve whitespace)
where cid = 1006


update customer
set info = xmlquery('transform copy $mynewxml := $INFO
modify do replace value of $mynewxml/my_xml with "Hello Again"
return $mynewxml')
where cid = 1006


Delete from customer where cid = 1006


delete from customer
where xmlexists('$doc/my_xml/text()="Hello" ' PASSING info AS "doc")

