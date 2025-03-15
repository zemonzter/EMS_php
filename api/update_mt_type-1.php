<?php

include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mttype_id = $_POST['mttype_id'];
    $mttype_name = $_POST['mttype_name'];

    // จัดการรูปภาพ
    if (isset($_FILES['mttype_img']) && $_FILES['mttype_img']['error'] == UPLOAD_ERR_OK) {
        $mttype_img_name = $_FILES['mttype_img']['name'];
        $mttype_img_tmp = $_FILES['mttype_img']['tmp_name'];
        $path = "upload/" . $mttype_img_name; // กำหนด path ที่จะเก็บรูปภาพ

        // ย้ายไฟล์ไปยังโฟลเดอร์ที่กำหนด
        if (move_uploaded_file($mttype_img_tmp, $path)) {
            // อัปเดตข้อมูลรวมถึง path ของรูปภาพ
            $query = "UPDATE `mt_type` SET `mttype_name`='$mttype_name', `mttype_img`='$path' WHERE `mttype_id`='$mttype_id'";
        } else {
            // กรณีอัปโหลดรูปภาพไม่สำเร็จ
            $arr = ["success" => "false", "message" => "อัปโหลดรูปภาพไม่สำเร็จ"];
            print(json_encode($arr));
            exit; // หยุดการทำงาน
        }
    } else {
        // กรณีไม่มีการอัปโหลดรูปภาพ ให้อัปเดตเฉพาะชื่อ
        $query = "UPDATE `mt_type` SET `mttype_name`='$mttype_name' WHERE `mttype_id`='$mttype_id'";
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