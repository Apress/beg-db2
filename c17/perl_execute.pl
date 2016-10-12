#!/usr/local/bin/perl
use DBI;
use DBD::DB2;
use DBD::DB2::Constants;
use DBD::DB2 qw($attrib_int $attrib_char $attrib_float $attrib_date $attrib_ts);
$myDBhandle = DBI->connect("dbi:DB2:sample","fuzzy","fuzzy");
if (defined($myDBhandle))
{
print "Successful connection to DB2!\n";
}
else
{
print "Failed to instantiate connection handle. Check error trace";
exit;
}
$myStmt = "select deptname from department where deptno = ?;";
$myStmtHandle = $myDBhandle->prepare($myStmt);
$myStmtHandle->bind_param(1, "A00");
$myStmtHandle->execute();
while( @arow = $myStmtHandle->fetchrow )
{
print "@arow\n";
}