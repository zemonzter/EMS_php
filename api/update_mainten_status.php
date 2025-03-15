<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["mainten_id"]))
{
    $mainten_id=$_POST["mainten_id"];
}
else return;

if(isset($_POST["mainten_status"]))
{
    $mainten_status=$_POST["mainten_status"];
}
else return;

if(isset($_POST["operator"]))
{
    $operator=$_POST["operator"];
}
else return;

$query = "UPDATE `maintenance_tb` SET `mainten_status`='$mainten_status',`operator`='$operator' WHERE `mainten_id`='$mainten_id'";

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