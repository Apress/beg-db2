import java.sql.*;
public class JavaDB2ex2
{
public static void main(String[] args)
{
try
{
Connection myConn = ConnMgr.openConnection(
args[0], args[1], "jdbc:db2://localhost:50000/sample");
if (!myConn.isClosed())
{
System.out.println("Successful connection");
}
ConnMgr.closeConnection(myConn);
}
catch (Exception ex)
{
ex.printStackTrace();
}
}
}
