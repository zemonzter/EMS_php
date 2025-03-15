<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["role"]))
{
    $role=$_POST["role"];
}
else return;

if(isset($_POST["description"]))
{
    $description=$_POST["description"];
}
else return;


$query="INSERT INTO `role_table`(`role`, `description`) VALUES ('$role','$description')";

$exe=mysqli_query(mysql: $con,query: $query);

$arr=[];
if($exe)
{
    $arr["success"]="true";
}
else
{
    $arr["success"]="false";
}

print(json_encode(value: $arr));

?>