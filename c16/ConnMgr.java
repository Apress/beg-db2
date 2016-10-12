import java.sql.*;
public class ConnMgr
{
// A method for making new connections
public static Connection openConnection(
String username, String password, String connURL)
{
Connection myConn=null;
try
{
Class.forName("com.ibm.db2.jcc.DB2Driver");
myConn = DriverManager.getConnection(connURL, username, password);
}
catch (Exception ex)
{
ex.printStackTrace();
}
return myConn;
}
// A method for closing connections
public static void closeConnection(Connection myConn)
{
try
{
if ((myConn == null) || (myConn.isClosed()))
{
return;
}
myConn.close();
}
catch (Exception ex)
{
ex.printStackTrace();
}
}
}
