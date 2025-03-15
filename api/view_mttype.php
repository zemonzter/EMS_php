<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `mttype_id`, `mttype_name`, `mttype_img` FROM `mt_type`";
$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>