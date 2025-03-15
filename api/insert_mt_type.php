<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["mttype_name"]))
{
    $mttype_name=$_POST["mttype_name"];
}
else return;

// if(isset($_POST["data"]))
// {
//     $data=$_POST["data"];
// }
// else return;
// if(isset($_POST["name"]))
// {
//     $name=$_POST["name"];
// }
// else return;


// $path = empty($name) ? 'upload/default.jpg' : "upload/$name";

$query="INSERT INTO `mt_type`(`mttype_name`) VALUES ('$mttype_name')";
// file_put_contents(filename: $path,data: base64_decode(string: $data));

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