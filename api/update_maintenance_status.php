<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["status_id"]))
{
    $status_id=$_POST["status_id"];
}
else return;

if(isset($_POST["mainten_status"]))
{
    $mainten_status=$_POST["mainten_status"];
}
else return;

$query = "UPDATE `maintenance_status` SET `mainten_status`='$mainten_status' WHERE `status_id`='$status_id'";

$exe=mysqli_query($con,$query);
$arr=[];
if($exe)
{
    $arr["success"]="true";
}
else
{
    $arr["success"]="false";
    $arr["message"]=mysqli_error($con);
}


?>