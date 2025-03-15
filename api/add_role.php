<?php

include 'dbconnection.php';
$con = dbconnection();

if (!$con) {  // ตรวจสอบการเชื่อมต่อฐานข้อมูล
    $arr["success"] = "false";
    $arr["message"] = "Database connection failed: " . mysqli_connect_error(); // เพิ่ม error message
    print(json_encode($arr));
    exit; // หยุดการทำงานหากเชื่อมต่อไม่ได้
}

if (!isset($_POST["role"]) || empty($_POST["role"])) { // ตรวจสอบค่า role
    $arr["success"] = "false";
    $arr["message"] = "Role is required.";
    print(json_encode($arr));
    exit;
}

if (!isset($_POST["description"]) || empty($_POST["description"])) { // ตรวจสอบค่า description
    $arr["success"] = "false";
    $arr["message"] = "Description is required.";
    print(json_encode($arr));
    exit;
}


$role = mysqli_real_escape_string($con, $_POST["role"]); // ป้องกัน SQL injection
$description = mysqli_real_escape_string($con, $_POST["description"]); // ป้องกัน SQL injection

$query = "INSERT INTO `role_table`(`role`, `description`) VALUES ('$role','$description')";

$exe = mysqli_query($con, $query); // เพิ่ม $con เข้าไปใน mysqli_query

$arr = [];
if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
    $arr["message"] = "Error inserting record: " . mysqli_error($con); // เพิ่ม error message จาก MySQL
}

print(json_encode($arr));

// mysqli_close($con); // ปิดการเชื่อมต่อฐานข้อมูลเสมอ
?>