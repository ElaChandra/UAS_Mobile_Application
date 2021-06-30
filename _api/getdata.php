<?php
include_once('../_config/config.php');

$sql_rm = mysqli_query($con,"SELECT * FROM uas") or die(mysqli_error($con));

$res=array();
while ($row=$sql_rm->fetch_assoc()){
    $res[]=$row;
}
echo json_encode($res);
?>