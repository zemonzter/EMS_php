<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `eq_id`, `eq_type`, `user_id`, `eq_model`, `eq_brand`, `eq_serial`, `eq_status`, `eq_price`, `eq_date`, `eq_warran`, `eq_img` FROM `eq_table`";
$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>