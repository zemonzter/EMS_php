<?php

include 'dbconnection.php';
$con = dbconnection();

if(isset($_POST["eqt_name"]))
{
    $eqt_name=$_POST["eqt_name"];
}
else return;

if (isset($_POST["data"])) {
    $data = $_POST["data"];
} else
    return;
if (isset($_POST["name"])) {
    $name = $_POST["name"];
} else
    return;


$path = empty($name) ? 'upload/default.jpg' : "upload/$name";

$query = "UPDATE `eq_type`(`eqt_name`, `eqt_img`) VALUES ('$eqt_name','$path') WHERE `eqt_id`='$eqt_id'";
file_put_contents(filename: $path, data: base64_decode(string: $data));


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