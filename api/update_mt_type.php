<?php

include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mttype_id = $_POST['mttype_id'];
    $mttype_name = $_POST['mttype_name'];

    // อัปเดตข้อมูลเฉพาะชื่อ
    $query = "UPDATE `mt_type` SET `mttype_name`='$mttype_name' WHERE `mttype_id`='$mttype_id'";

    $exe = mysqli_query($con, $query);
    $arr = [];
    if ($exe) {
        $arr["success"] = "true";
    } else {
        $arr["success"] = "false";
        $arr["message"] = mysqli_error($con); // แสดง error message
    }

    print(json_encode($arr));
} else {
    // กรณีไม่ได้ส่งข้อมูลแบบ POST
    $arr = ["success" => "false", "message" => "Method not allowed"];
    print(json_encode($arr));
}

?>