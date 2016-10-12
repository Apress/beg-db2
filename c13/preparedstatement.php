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
try {
$conn = db2_pconnect($conn_string, '', '');
if (! $conn)
{
echo db2_conn_errormsg();
}
else
{
echo "<p>You've voted!</p>";
$eileens_empno = "000090";
$eileens_votes = 0;
$pstmt = db2_prepare($conn, "CALL fuzzy.employee_vote(?, ?)");
$result = db2_bind_param($pstmt, 1, "eileens_empno", DB2_PARAM_IN);
$result = db2_bind_param($pstmt, 2, "eileens_votes", DB2_PARAM_OUT);
$result = db2_execute($pstmt);
if ($result)
{
print "Eileen now has $eileens_votes votes!";
}
db2_close($conn);
}
}
catch (Exception $e) {
echo $e;
}
?>