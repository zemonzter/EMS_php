<?php


include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["user_name"]))
{
    $user_name=$_POST["user_name"];
}
else return;

if(isset($_POST["user_email"]))
{
    $user_email=$_POST["user_email"];
}
else return;


if(isset($_POST["user_role"]))
{
    $user_role=$_POST["user_role"];
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

$query="INSERT INTO `usertb`(`user_name`, `user_email`, `user_imgpath`, `user_role`) VALUES ('$user_name','$user_email','$path','$user_role')";

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