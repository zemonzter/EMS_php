<?php

include 'dbconnection.php';
$con=dbconnection();

$query = "SELECT `budget_id`, `budget_name`, `budget_amount`, `budget_year`, `budget_type` FROM `budget_table`";
$exe = mysqli_query(mysql: $con, query: $query);
$arr = [];

while($row = mysqli_fetch_array(result: $exe))
{
    $arr[] = $row;
}
print(json_encode(value: $arr));

?>