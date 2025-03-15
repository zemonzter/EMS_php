<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["eqtname"]))
{
    $eqtname=$_POST["eqtname"];
}
else return;

if(isset($_POST["userid"]))
{
    $userid=$_POST["userid"];
}
else return;

if(isset($_POST["eqmodel"]))
{
    $eqmodel=$_POST["eqmodel"];
}
else return;

if(isset($_POST["eqbrand"]))
{
    $eqbrand=$_POST["eqbrand"];
}
else return;

if(isset($_POST["eqserial"]))
{
    $eqserial=$_POST["eqserial"];
}
else return;

if(isset($_POST["eqstatus"]))
{
    $eqstatus=$_POST["eqstatus"];
}
else return;

if(isset($_POST["eqprice"]))
{
    $eqprice=$_POST["eqprice"];
}
else return;

if(isset($_POST["eqdate"]))
{
    $eqdate=$_POST["eqdate"];
}
else return;

if(isset($_POST["eqwarran"]))
{
    $eqwarran=$_POST["eqwarran"];
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

$query="INSERT INTO `eq_table`(`eq_type`, `user_id`, `eq_model`, `eq_brand`, `eq_serial`, `eq_status`, `eq_price`, `eq_date`, `eq_warran`, `eq_img`) VALUES ('$eqtname','$userid','$eqmodel','$eqbrand','$eqserial','$eqstatus','$eqprice','$eqdate','$eqwarran','$path')";
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