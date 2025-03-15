<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["unit_name"]))
{
    $unit_name=$_POST["unit_name"];
}
else return;

$query = "INSERT INTO `unit_table`(`unit_name`) VALUES ('$unit_name')";

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

