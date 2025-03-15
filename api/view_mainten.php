<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `mainten_id`, `eq_id`,`eq_name`, `mainten_date`, `mainten_detail`, `user_mainten`, `mainten_status`,`mainten_img` FROM `maintenance_tb`";
$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>