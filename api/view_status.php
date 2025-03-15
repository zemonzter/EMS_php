<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `status_id`, `status` FROM `status_tb`";

$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>