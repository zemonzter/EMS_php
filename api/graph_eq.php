<?php
header('Content-Type: application/json');

include 'dbconnection.php';
$con = dbconnection();

// นับครุภัณฑ์สำนักงาน
$queryOffice = "SELECT COUNT(eq_id) AS office_count FROM eq_table WHERE eq_type = 'ครุภัณฑ์สำนักงาน'";
$resultOffice = mysqli_query($con, $queryOffice);
$rowOffice = mysqli_fetch_assoc($resultOffice);

// นับครุภัณฑ์คอมพิวเตอร์
$queryComputer = "SELECT COUNT(eq_id) AS computer_count FROM eq_table WHERE eq_type = 'ครุภัณฑ์คอมพิวเตอร์'";
$resultComputer = mysqli_query($con, $queryComputer);
$rowComputer = mysqli_fetch_assoc($resultComputer);

// สร้าง array เพื่อเก็บผลลัพธ์
$arr = [
    [
        'eq_type' => 'ครุภัณฑ์สำนักงาน',
        'eq_count' => (string)$rowOffice['office_count'] // Convert to integer
    ],
    [
        'eq_type' => 'ครุภัณฑ์คอมพิวเตอร์',
        'eq_count' => (string)$rowComputer['computer_count'] //Convert to integer
    ]
];

print(json_encode($arr));

mysqli_close($con);
?>