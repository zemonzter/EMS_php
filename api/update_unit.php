<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["unit_id"]))
{
    $unit_id=$_POST["unit_id"];
}
else return;

if(isset($_POST["unit_name"]))
{
    $unit_name=$_POST["unit_name"];
}
else return;

$query = "UPDATE `unit_table` SET `unit_name`='$unit_name' WHERE `unit_id`='$unit_id'";

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