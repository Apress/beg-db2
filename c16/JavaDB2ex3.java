import java.sql.*;
public class JavaDB2ex3
{
public static void main(String[] args)
{
try
{
Connection myConn = ConnMgr.openConnection(
args[0], args[1], "jdbc:db2://localhost:50000/sample");
if (myConn.isClosed())
{
System.out.println("Connection failed");
return;
}
//Example dynamic SQL with literal string
Statement myStmt = myConn.createStatement();
String myQuery1 = "Select deptname from fuzzy.department";
ResultSet myRS1 = myStmt.executeQuery(myQuery1);
while (myRS1.next())
{
String deptName = myRS1.getString("deptname");
System.out.println(deptName);
}
System.out.println("End of results\n");
//Example dynamic SQL with bind parameters
String myPrepQuery = "Select firstnme, lastname from fuzzy.employee" +
" where empno < ?";
//The following String value could be sourced as a program argument,
//value from a web page, client application, etc.
String empNo1 = "000100";
PreparedStatement myPrepStmt = myConn.prepareStatement(myPrepQuery);
myPrepStmt.setString(1,empNo1);
ResultSet myRS2 = myPrepStmt.executeQuery();
while (myRS2.next())
{
String firstName = myRS2.getString("firstnme");
String lastName = myRS2.getString("lastname");
System.out.println(firstName + " " + lastName);
}
System.out.println("End of results\n");
//Example stored procedure call which returns no result sets
CallableStatement mySPStmt = myConn.prepareCall("call fuzzy.employee_vote(?, ?)");
String empNo2 = "000240";
mySPStmt.setString(1, empNo2);
mySPStmt.registerOutParameter(2, java.sql.Types.INTEGER);
mySPStmt.executeUpdate();
System.out.println("Employee no " + empNo2 + " currently has "
+ Integer.parseInt(mySPStmt.getString(2)) + " votes.");
//clean up statements and results
myRS1.close();
myRS2.close();
ConnMgr.closeConnection(myConn);
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
