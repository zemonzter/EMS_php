<?php


include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["mttype"]))
{
    $mttype=$_POST["mttype"];
}
else return;

if(isset($_POST["mtname"]))
{
    $mtname=$_POST["mtname"];
}
else return;

if(isset($_POST["unitid"]))
{
    $unitid=$_POST["unitid"];
}
else return;

if(isset($_POST["mtstock"]))
{
    $mtstock=$_POST["mtstock"];
}
else return;

if(isset($_POST["unitprice"]))
{
    $unitprice=$_POST["unitprice"];
}
else return;

if(isset($_POST["mtprice"]))
{
    $mtprice=$_POST["mtprice"];
}
else return;

if(isset($_POST["mtdate"]))
{
    $mtdate=$_POST["mtdate"];
}
else return;

if(isset($_POST["mtlink"]))
{
    $mtlink=$_POST["mtlink"];
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

$query="INSERT INTO `mt_table`(`mt_type`, `mt_name`, `unit_id`, `mt_stock`, `unit_price`, `mt_price`, `mt_date`,`mt_url`, `mt_img`) VALUES ('$mttype','$mtname','$unitid','$mtstock','$unitprice','$mtprice','$mtdate','$mtlink','$path')";

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