<?php
require_once 'Zend/Db.php';
try
{
$db = Zend_Db::factory('Db2', array(
'host' => 'localhost',
'username' => 'fuzzy',
'password' => 'fuzzy',
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
?>