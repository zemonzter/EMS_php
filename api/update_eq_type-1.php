<?php

include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $eqt_id = $_POST['eqt_id'];
    $eqt_name = $_POST['eqt_name'];

    // จัดการรูปภาพ
    if (isset($_FILES['eqt_img']) && $_FILES['eqt_img']['error'] == UPLOAD_ERR_OK) {
        $eqt_img_name = $_FILES['eqt_img']['name'];
        $eqt_img_tmp = $_FILES['eqt_img']['tmp_name'];
        $path = "upload/" . $eqt_img_name; // กำหนด path ที่จะเก็บรูปภาพ

        // ย้ายไฟล์ไปยังโฟลเดอร์ที่กำหนด
        if (move_uploaded_file($eqt_img_tmp, $path)) {
            // อัปเดตข้อมูลรวมถึง path ของรูปภาพ
            $query = "UPDATE `eq_type` SET `eqt_name`='$eqt_name', `eqt_img`='$path' WHERE `eqt_id`='$eqt_id'";
        } else {
            // กรณีอัปโหลดรูปภาพไม่สำเร็จ
            $arr = ["success" => "false", "message" => "อัปโหลดรูปภาพไม่สำเร็จ"];
            print(json_encode($arr));
            exit; // หยุดการทำงาน
        }
    } else {
        // กรณีไม่มีการอัปโหลดรูปภาพ ให้อัปเดตเฉพาะชื่อ
        $query = "UPDATE `eq_type` SET `eqt_name`='$eqt_name' WHERE `eqt_id`='$eqt_id'";
    }

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