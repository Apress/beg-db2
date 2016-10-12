<?php
require_once 'Zend/Db.php';
try
{
$db = Zend_Db::factory('Db2', array(
'host' => '127.0.0.1',
'username' => 'db2admin',
'password' => 'db2admin',
'dbname' => 'SAMPLE'
));
$db->getConnection();
}
catch (Zend_Db_Adapter_Exception $e)
{
echo "adapter exception: $e";
}
catch (Zend_Exception $e)
{
echo "general Zend framework exception $e";
}
$sql = "select firstnme, lastname from fuzzy.employee";
$result = $db->query($sql);
while ($row = $result->fetch())
{
echo "<p>".$row['FIRSTNME']." ".$row['LASTNAME']."</p>";
}
?>