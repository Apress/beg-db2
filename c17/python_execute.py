#!python
import ibm_db
myConnection = ibm_db.connect("SAMPLE","fuzzy","fuzzy")
if myConnection:
  mySQL = "select firstnme, lastname from fuzzy.employee"
  myStmt = ibm_db.exec_immediate(myConnection, mySQL)
  row = ibm_db. fetch_assoc(myStmt)
  while row:
    print row
    row = ibm_db. fetch_assoc(myStmt)