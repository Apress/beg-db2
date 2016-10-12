<?php
$driver = "{IBM DB2 ODBC DRIVER}";
$database = "SAMPLE";
$hostname = "localhost";
$port = 50000;
$user = "fuzzy";
$password = "fuzzy";
$conn_string = "DRIVER=$driver;DATABASE=$database;";
$conn_string .= "HOSTNAME=$hostname;PORT=$port;PROTOCOL=TCPIP;";
$conn_string .= "UID=$user;PWD=$password;";
try
{
$conn = db2_connect($conn_string, '', '');
if (! $conn)
{
echo db2_conn_errormsg();
}
else
{
echo "Hello World, from the IBM_DB2 PHP extensions!";
db2_close($conn);
}
}
catch (Exception $e) {
echo $e;
}
?>