<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `HN_id`, `eq_type`, `user_name`, `eq_name`, `eq_brand`, `eq_model`, `eq_status`, `eq_price`, `eq_buydate`, `eq_date`, `eq_warran`, `eq_img` FROM `equipment_tb`";
$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>