import java.sql.*;
import java.util.Properties;
public class JavaDB2ex4
{
public static void main(String[] args)
{
try
{
Class.forName("com.ibm.db2.jcc.DB2Driver");
// Use a Properties object for connection options
Properties myProps = new Properties();
myProps.setProperty("user", args[0]);
myProps.setProperty("password", args[1]);
String mySchema = "FUZZ";
myProps.setProperty("currentSchema",mySchema);
// Now make a new connection object using the Properties object
Connection myDB2conn = DriverManager.getConnection(
"jdbc:db2://localhost:50000/sample",myProps);
// execute a SQL statement using our pre-configured schema
Statement myStmt = myDB2conn.createStatement();
String myQuery = "select deptname from department";
ResultSet myRS = myStmt.executeQuery(myQuery);
while (myRS.next())
{
String deptName = myRS.getString("deptname");
System.out.println(deptName);
}
System.out.println("End of results\n");
myRS.close();
myDB2conn.close();
}
catch (SQLException sql_ex)
{
sql_ex.printStackTrace();
}
catch (Exception ex)
{
ex.printStackTrace();
}
}
}
