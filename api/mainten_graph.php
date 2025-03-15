<?php
header('Content-Type: application/json');

include 'dbconnection.php';
$con = dbconnection();

$query = "SELECT mainten_date, COUNT(mainten_id) AS mainten_count FROM maintenance_tb GROUP BY mainten_date ORDER BY mainten_date ASC";
$exe = mysqli_query($con, $query);
$arr = [];

while ($row = mysqli_fetch_assoc($exe)) {
    $dateString = $row['mainten_date'];
    $monthName = date('M', strtotime($dateString));

    $arr[] = [
        'month' => $monthName,
        'mainten_count' => $row['mainten_count']
    ];
}
print(json_encode($arr));
?>