<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `mt_id`, `mt_type`, `mt_name`, `unit_id`, `mt_stock`, `mt_price`, `mt_date`, `mt_img`, `mt_url` FROM `mt_table` ";
$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>