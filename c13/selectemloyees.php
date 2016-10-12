<?php
$driver = "{IBM DB2 ODBC DRIVER}";
$database = "SAMPLE";
$hostname = "localhost";
$port = 50000;
$user = "fuzzy";
$password = "fuzzy";
$conn_string = "DRIVER={IBM DB2 ODBC DRIVER};DATABASE=$database;";
$conn_string .= "HOSTNAME=$hostname;PORT=$port;PROTOCOL=TCPIP;";
$conn_string .= "UID=$user;PWD=$password;";
try
{
$conn = db2_pconnect($conn_string, '', '');
if (! $conn)
{
echo db2_conn_errormsg();
}
else
{
echo "Candidates for Employee of the Year:";
$result = db2_exec($conn, "select firstnme, lastname from fuzzy.employee");
if ($result)
{
while ($row = db2_fetch_both($result))
{
echo "<p>".$row[0]." ".$row[1]."</p>";
}
}
db2_close($conn);
}
}
catch (Exception $e) {
echo $e;
}
?>