<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `eqt_id`, `eqt_name`, `eqt_img` FROM `eq_type`";
$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>