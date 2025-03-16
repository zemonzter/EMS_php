<?php
include 'dbconnection.php';
$con = dbconnection();

if ($con === false) {
    $arr = ["success" => "false", "error" => "Database connection failed"];
    print(json_encode($arr));
    exit;
}

// รับข้อมูลจาก POST request
$hnid = $_POST['hnid']; // รับ HN_id ที่ผู้ใช้ป้อนเข้ามา
$eqtype = $_POST['eqtype'];
$username = $_POST['username'];
$eqname = $_POST['eqname'];
$eqbrand = $_POST['eqbrand'];
$eqmodel = $_POST['eqmodel'];
$eqstatus = $_POST['eqstatus'];
$eqprice = $_POST['eqprice'];
$eqbuydate = $_POST['eqbuydate'];
$eqdate = $_POST['eqdate'];
$eqwarran = $_POST['eqwarran'];
$data = $_POST['data'];
$name = $_POST['name'];

$path = empty($name) ? 'upload/default.jpg' : "upload/$name";

// ตรวจสอบว่าข้อมูลถูกส่งมาครบถ้วนหรือไม่ (เพิ่มการตรวจสอบตามความเหมาะสม)
if (empty($hnid) || empty($eqtype) || empty($username) || empty($eqname) || empty($eqbrand) || empty($eqmodel) || empty($eqstatus) || empty($eqprice) || empty($eqbuydate) || empty($eqdate) || empty($eqwarran)) {
    $arr = ["success" => "false", "error" => "Missing required fields"];
    print(json_encode($arr));
    exit;
}

// ตรวจสอบ HN_id ซ้ำ (ถ้าต้องการ)
$check_query = "SELECT HN_id FROM equipment_tb WHERE HN_id = ?";
$check_stmt = mysqli_prepare($con, $check_query);

if ($check_stmt === false) {
    $arr = ["success" => "false", "error" => "Prepare check failed: " . mysqli_error($con)];
    print(json_encode($arr));
    exit;
}

mysqli_stmt_bind_param($check_stmt, "s", $hn_id);
mysqli_stmt_execute($check_stmt);
mysqli_stmt_store_result($check_stmt);

if (mysqli_stmt_num_rows($check_stmt) > 0) {
    $arr = ["success" => "false", "error" => "HN_id already exists"];
    print(json_encode($arr));
    mysqli_stmt_close($check_stmt);
    mysqli_close($con);
    exit;
}

mysqli_stmt_close($check_stmt);

// Prepared Statement สำหรับ INSERT ข้อมูล
$query = "INSERT INTO `equipment_tb`(`HN_id`, `eq_type`, `user_name`, `eq_name`, `eq_brand`, `eq_model`, `eq_status`, `eq_price`, `eq_buydate`, `eq_date`, `eq_warran`, `eq_img`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
$stmt = mysqli_prepare($con, $query);

if ($stmt === false) {
    $arr = ["success" => "false", "error" => "Prepare failed: " . mysqli_error($con)];
    print(json_encode($arr));
    exit;
}

// Bind parameters
mysqli_stmt_bind_param($stmt, "ssssssssssss", $hnid, $eqtype, $username, $eqname, $eqbrand, $eqmodel, $eqstatus, $eqprice, $eqbuydate, $eqdate, $eqwarran, $path);

// Execute the statement
if (mysqli_stmt_execute($stmt)) {
    $arr = ["success" => "true"];
} else {
    $arr = ["success" => "false", "error" => "Execute failed: " . mysqli_stmt_error($stmt)];
}

// Close the statement and connection
mysqli_stmt_close($stmt);
mysqli_close($con);

// ส่งผลลัพธ์เป็น JSON
print(json_encode($arr));
?>