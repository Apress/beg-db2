#!/usr/local/bin/perl
use DBI;
use DBD::DB2;
use DBD::DB2::Constants;
$myDBhandle = DBI->connect("dbi:DB2:sample","fuzzy","fuzzy");
if (defined($myDBhandle))
{
print "Successful connection to DB2!";
}
else
{
print "Failed to instantiate connection handle. Check error trace";
exit;
}
