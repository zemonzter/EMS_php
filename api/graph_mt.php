<?php
header('Content-Type: application/json');

include 'dbconnection.php';
$con = dbconnection();

// นับวัสดุสิ้นเปลือง
$queryOffice = "SELECT COUNT(mt_id) AS consum_count FROM mt_table WHERE mt_type = 'วัสดุสิ้นเปลือง'";
$resultOffice = mysqli_query($con, $queryOffice);
$rowOffice = mysqli_fetch_assoc($resultOffice);

// นับวัสดุถาวร
$queryComputer = "SELECT COUNT(mt_id) AS perma_count FROM mt_table WHERE mt_type = 'วัสดุถาวร'";
$resultComputer = mysqli_query($con, $queryComputer);
$rowComputer = mysqli_fetch_assoc($resultComputer);

// สร้าง array เพื่อเก็บผลลัพธ์
$arr = [
    [
        'mt_type' => 'วัสดุสิ้นเปลือง',
        'mt_count' => (string)$rowOffice['consum_count'] // Convert to integer
    ],
    [
        'mt_type' => 'วัสดุถาวร',
        'mt_count' => (string)$rowComputer['perma_count'] //Convert to integer
    ]
];

print(json_encode($arr));

mysqli_close($con);
?>