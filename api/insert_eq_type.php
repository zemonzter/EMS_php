<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["eqtname"]))
{
    $eqtname=$_POST["eqtname"];
}
else return;

if(isset($_POST["data"]))
{
    $data=$_POST["data"];
}
else return;
if(isset($_POST["name"]))
{
    $name=$_POST["name"];
}
else return;


$path = empty($name) ? 'upload/default.jpg' : "upload/$name";

$query="INSERT INTO `eq_type`(`eqt_name`, `eqt_img`) VALUES ('$eqtname','$path')";
file_put_contents(filename: $path,data: base64_decode(string: $data));

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