<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `status_id`, `mainten_status` FROM `maintenance_status`";

$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>