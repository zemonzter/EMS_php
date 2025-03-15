<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["mt_name"]))
{
    $mt_name=$_POST["mt_name"];
}
else return;

if(isset($_POST["username"]))
{
    $username=$_POST["username"];
}
else return;

if(isset($_POST["quantity"]))
{
    $quantity=$_POST["quantity"];
}
else return;

if(isset($_POST["unit"]))
{
    $unit=$_POST["unit"];
}
else return;

if(isset($_POST["status"]))
{
    $status=$_POST["status"];
}
else return;

date_default_timezone_set('Asia/Bangkok');
$date = date('Y-m-d H:i:s');


$query="INSERT INTO `checkout`(`mt_name`, `username`, `quantity`, `unit`, `date`, `status`) VALUES ('$mt_name','$username','$quantity','$unit','$date','$status')";

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