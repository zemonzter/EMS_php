<?php
header('Content-Type: application/json');

include 'dbconnection.php'; // ตรวจสอบให้แน่ใจว่าไฟล์นี้มีฟังก์ชัน dbconnection() ที่ถูกต้อง
$con = dbconnection();

$query = "SELECT DATE_FORMAT(request_date, '%Y-%m') AS month, COUNT(request_id) AS order_count FROM approval_requests WHERE status = 'อนุมัติคำขอ' GROUP BY month ORDER BY month ASC";
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
        'order_count' => $row['order_count']
    ];
}

print(json_encode($arr));
?>