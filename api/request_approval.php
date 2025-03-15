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
//$mail = new PHPMailer(true); // Moved inside the loop where it's needed


if (!$con) {
    echo json_encode(["success" => "false", "message" => "Database connection failed: " . mysqli_connect_error()]);
    exit;
}

$username = $_POST["username"] ?? null;
$items_json = $_POST["items"] ?? null;

if ($username === null || $items_json === null) {
    echo json_encode(["success" => "false", "message" => "Username or items not provided."]);
    exit;
}

$username = mysqli_real_escape_string($con, $username);
$items = json_decode($items_json, true);

if ($items === null || !is_array($items)) {
    echo json_encode(["success" => "false", "message" => "Invalid items format."]);
    exit;
}

$items_serialized = mysqli_real_escape_string($con, json_encode($items)); // Serialize items for storage

date_default_timezone_set('Asia/Bangkok');
$date = date('Y-m-d H:i:s');
$status = "รออนุมัติ"; // Initial status

$query = "INSERT INTO `approval_requests` (`username`, `items`, `request_date`, `status`) VALUES ('$username', '$items_serialized', '$date', '$status')";
$exe = mysqli_query($con, $query);
$arr = [];

if ($exe) {
    $request_id = mysqli_insert_id($con); // Get the ID of the inserted request

    // Insert items into checkout table with pending status
    foreach ($items as $item) {
        $mt_name = mysqli_real_escape_string($con, $item['mt_name']);
        $quantity = mysqli_real_escape_string($con, $item['quantity']);
        $unit = mysqli_real_escape_string($con, $item['unit_id']);
        $status_item = "รออนุมัติ"; // Initial status in checkout

        $checkout_query = "INSERT INTO `checkout` (`mt_name`, `username`, `quantity`, `unit`, `date`, `status`, `request_id`) VALUES ('$mt_name', '$username', '$quantity', '$unit', '$date', '$status_item', '$request_id')";
        mysqli_query($con, $checkout_query);  // Corrected:  No need to check the result here, error will be caught in outer if/else
    }

    $arr["success"] = "true";
    $arr["message"] = "Approval request submitted successfully.";


    //--- Email sending part, moved inside the first success block ---
    $email_query = "SELECT `request_id`, `username`, `items`, `request_date`, `status` FROM `approval_requests` WHERE `request_id` = '$request_id'";  // Corrected: Fetch only the newly inserted request
    $email_result = mysqli_query($con, $email_query);

    if ($email_result && mysqli_num_rows($email_result) > 0) { //Check if any rows returned
        $row = mysqli_fetch_assoc($email_result);  //fetch that single row

         $mail = new PHPMailer(true);  // Create a new PHPMailer instance here

        try { // Added try-catch block for PHPMailer
            $mail->SMTPDebug = SMTP::DEBUG_SERVER;  // VERY IMPORTANT: Enable verbose debugging
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
            $mail->addAddress('zemonzter@gmail.com'); // IMPORTANT: Use a DIFFERENT email address here!
            $mail->addAddress('zemonzter4488@gmail.com');

            // Content
            $mail->isHTML(true);
            $mail->Subject = 'คำขอเบิกวัสดุใหม่';
            $mail->Body    = "หมายเลขคำขอ: {$row['request_id']}<br>ชื่อผู้เบิก: {$row['username']}<br>วันที่ส่งคำขอ: {$row['request_date']}<br>สถานะ: {$row['status']}";
            $mail->AltBody = "หมายเลขคำขอ: {$row['request_id']}\nชื่อผู้เบิก: {$row['username']}\nวันที่ส่งคำขอ: {$row['request_date']}\nสถานะ: {$row['status']}";

            $mail->send();
            $arr["email_sent"] = "true"; //Indicate email was sent

        } catch (Exception $e) {
            // $arr["email_sent"] = "false"; //Indicate email failed to send
            $arr["email_error"] = "Message could not be sent. Mailer Error: {$mail->ErrorInfo}"; //Store the error
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