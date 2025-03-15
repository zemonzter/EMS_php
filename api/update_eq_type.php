<?php

include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $eqt_id = $_POST['eqt_id'];
    $eqt_name = $_POST['eqt_name'];

    // อัปเดตข้อมูลเฉพาะชื่อ
    $query = "UPDATE `eq_type` SET `eqt_name`='$eqt_name' WHERE `eqt_id`='$eqt_id'";

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