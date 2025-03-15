<?php
header('Content-Type: application/json');

include 'dbconnection.php';
$con = dbconnection();

// $query = "SELECT DATE_FORMAT(date, '%Y-%m') AS month, COUNT(checkout_id) AS checkout_count FROM checkout GROUP BY month ORDER BY month ASC";
$query = "SELECT DATE_FORMAT(date, '%Y-%m') AS month, COUNT(checkout_id) AS checkout_count FROM checkout WHERE status = 'approved' GROUP BY month ORDER BY month ASC";
$exe = mysqli_query($con, $query);
$arr = [];

while ($row = mysqli_fetch_assoc($exe)) {
    // แปลง YYYY-MM เป็นชื่อเดือน
    $monthYear = $row['month'];
    $year = substr($monthYear, 0, 4);
    $monthNum = substr($monthYear, 5, 2);
    $monthName = date('M', mktime(0, 0, 0, $monthNum, 1, $year));

    $arr[] = [
        'month' => $monthName,
        'checkout_count' => $row['checkout_count']
    ];
}
print(json_encode($arr));
?>