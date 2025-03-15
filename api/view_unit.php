<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `unit_id`, `unit_name` FROM `unit_table`";

$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>