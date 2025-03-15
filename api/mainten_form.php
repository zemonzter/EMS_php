<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require __DIR__ . '/../vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

include 'dbconnection.php';

header('Content-Type: application/json');

$con = dbconnection();

if (!$con) {
    echo json_encode(["success" => "false", "message" => "Database connection failed: " . mysqli_connect_error()]);
    exit;
}

$eqid = $_POST["eqid"] ?? null;
$eqname = $_POST["eqname"] ?? null;
$maintendate = $_POST["maintendate"] ?? null;
$maintendetail = $_POST["maintendetail"] ?? null;
$usermainten = $_POST["usermainten"] ?? null;
$imagedata = $_POST["data"] ?? null;
$imagename = $_POST["name"] ?? null;

if ($eqid === null || $eqname === null || $maintendate === null || $maintendetail === null || $usermainten === null) {
    echo json_encode(["success" => "false", "message" => "Missing required fields."]);
    exit;
}

$eqid = mysqli_real_escape_string($con, $eqid);
$eqname = mysqli_real_escape_string($con, $eqname);
$maintendate = mysqli_real_escape_string($con, $maintendate);
$maintendetail = mysqli_real_escape_string($con, $maintendetail);
$usermainten = mysqli_real_escape_string($con, $usermainten);

// --- Image Handling and Path Correction ---
$image_path_for_db = 'upload/default.jpg'; // Default image path

if ($imagedata && $imagename) {
    $decoded_image = base64_decode($imagedata);
    if ($decoded_image === false) {
        echo json_encode(["success" => "false", "message" => "Invalid base64 image data."]);
        exit;
    }

    $file_name = time() . '_' . basename($imagename); // Use basename() here
    $upload_path = "upload/";

    if (!is_dir($upload_path)) {
        mkdir($upload_path, 0755, true);
    }

    $file_path = $upload_path . $file_name;

    if (file_put_contents($file_path, $decoded_image)) {
        $image_path_for_db = mysqli_real_escape_string($con, $file_path);
    } else {
        echo json_encode(["success" => "false", "message" => "Failed to save image. Check server permissions and disk space. Path: " . $file_path]);
        exit;
    }
}
// --- End of Image Handling ---

date_default_timezone_set('Asia/Bangkok');
$date = date('Y-m-d H:i:s');
$status = "แจ้งซ่อม";

$query = "INSERT INTO `maintenance_tb`(`eq_id`, `eq_name`, `mainten_date`, `mainten_detail`, `user_mainten`, `mainten_status`, `mainten_img`) VALUES
('$eqid', '$eqname', '$maintendate', '$maintendetail', '$usermainten', '$status','$image_path_for_db')";  // Corrected the order
$exe = mysqli_query($con, $query);
$arr = [];

if ($exe) {
    $mainten_id = mysqli_insert_id($con);

    $arr["success"] = "true";
    $arr["message"] = "Maintenance request submitted successfully.";

    //--- Email sending part ---
    $email_query = "SELECT * FROM `maintenance_tb` WHERE `mainten_id` = '$mainten_id'";
    $email_result = mysqli_query($con, $email_query);

    if ($email_result && mysqli_num_rows($email_result) > 0) {
        $row = mysqli_fetch_assoc($email_result);

        $mail = new PHPMailer(true);

        try {
            $mail->SMTPDebug = SMTP::DEBUG_OFF;  //  Turn off debug output
            $mail->isSMTP();
            $mail->Host       = 'smtp.gmail.com';
            $mail->SMTPAuth   = true;
            $mail->Username   = 'boonyanuch.k@rmutsvmail.com'; // Your Gmail address
            $mail->Password   = 'klar kari wffb cxdz'; // Your Gmail App Password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port       = 587;
            $mail->CharSet = 'UTF-8';

            // Recipients
            $mail->setFrom('boonyanuch.k@rmutsvmail.com', 'StockCOE');
           $mail->addAddress('zemonzter@gmail.com');   // Add a recipient
           $mail->addAddress('zemonzter4488@gmail.com');

            // Content
            $mail->isHTML(true);
            $mail->Subject = 'คำขอแจ้งซ่อมใหม่';
            $mail->Body    = "หมายเลขคำขอ: {$row['mainten_id']}<br>เลขครุภัณฑ์: {$row['eq_id']}<br>ชื่อครุภัณฑ์: {$row['eq_name']}<br>วันที่แจ้งซ่อม: {$row['mainten_date']}<br>รายละเอียด: {$row['mainten_detail']}<br>ผู้แจ้งซ่อม: {$row['user_mainten']}<br>สถานะ: {$row['mainten_status']}";
            $mail->AltBody = "หมายเลขคำขอ: {$row['mainten_id']}\nเลขครุภัณฑ์: {$row['eq_id']}\nชื่อครุภัณฑ์: {$row['eq_name']}\nวันที่แจ้งซ่อม: {$row['mainten_date']}\nรายละเอียด: {$row['mainten_detail']}\nผู้แจ้งซ่อม: {$row['user_mainten']}\nสถานะ: {$row['mainten_status']}";

            $mail->send();
            $arr["email_sent"] = "true";

        } catch (Exception $e) {
            $arr["email_sent"] = "false";
            $arr["email_error"] = "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    } else {
        $arr["email_sent"] = "false";
        $arr["email_error"] = "Could not retrieve request data for email.";
    }

} else {
    $arr["success"] = "false";
    $arr["message"] = "Query failed: " . mysqli_error($con);
}

echo json_encode($arr);
mysqli_close($con);

?>