<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `checkout_id`, `mt_name`, `username`, `quantity`,`unit`, `date`, `status` FROM `checkout`";
$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>