<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `home_id`, `home_name`, `home_img` FROM `home_tb`";
$exe = mysqli_query($con, $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>