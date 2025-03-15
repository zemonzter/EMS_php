<?php

include 'dbconnection.php';
$con = dbconnection();

if (!$con) {
    $arr["success"] = "false";
    $arr["message"] = "Database connection failed: " . mysqli_connect_error();
    print(json_encode($arr));
    exit;
}

// ดึงข้อมูล role ทั้งหมดจากตาราง role_table
$sql = "SELECT `role_id`, `role`, `description` FROM `role_table`";
$result = mysqli_query($con, $sql);

$roles = array(); // สร้าง array เพื่อเก็บข้อมูล role

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $roles[] = $row; // เพิ่มข้อมูล role ลงใน array
    }
} else {
    $arr["success"] = "false";
    $arr["message"] = "Error fetching roles: " . mysqli_error($con);
    print(json_encode($arr));
    exit;
}

print(json_encode($roles)); // ส่งข้อมูล role กลับไปในรูปแบบ JSON

mysqli_close($con);

?>