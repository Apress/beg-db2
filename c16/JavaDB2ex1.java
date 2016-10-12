import java.sql.*;
public class JavaDB2ex1
{
public static void main(String[] args)
{
try
{
// First attempt to load the DB2 JDBC driver
Class.forName("com.ibm.db2.jcc.DB2Driver");
// Now make a new connection object, and pass your DB2 details
Connection myDB2conn = DriverManager.getConnection(
"jdbc:db2://localhost:50000/sample","db2admin","Passw0rd");
// Test your connection explicitly using a connection property
if ( myDB2conn.isClosed())
{
System.out.println("No Connection. Check exceptions & stack trace");
}
else
{
System.out.println("Connected! Your DB2 JDBC code is working");
}
// clean up connection
myDB2conn.close();
}
catch (ClassNotFoundException ex)
{
ex.printStackTrace();
}
catch (SQLException sql_ex)
{
sql_ex.printStackTrace();
}
}
}

