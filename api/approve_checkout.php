<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include 'dbconnection.php';

header('Content-Type: application/json');

$con = dbconnection();

if (!$con) {
    echo json_encode(["success" => "false", "message" => "Database connection failed: " . mysqli_connect_error()]);
    exit;
}

$request_id = $_POST["request_id"] ?? null;
$action = $_POST["action"] ?? null; // "approve" or "reject"

if ($request_id === null || $action === null) {
    echo json_encode(["success" => "false", "message" => "Request ID or action not provided."]);
    exit;
}

$request_id = mysqli_real_escape_string($con, $request_id);
$action = mysqli_real_escape_string($con, $action);

if ($action !== "อนุมัติคำขอ" && $action !== "ปฏิเสธคำขอ") {
    echo json_encode(["success" => "false", "message" => "Invalid action."]);
    exit;
}

$status = ($action === "อนุมัติคำขอ") ? "อนุมัติคำขอ" : "ปฏิเสธคำขอ";

// Update approval_requests table
$query = "UPDATE `approval_requests` SET `status` = '$status' WHERE `request_id` = '$request_id'";
$exe = mysqli_query($con, $query);
$arr = [];

if ($exe) {
    if (mysqli_affected_rows($con) > 0) {
        if ($action === "อนุมัติคำขอ") {
            // Process the items and update stock if approved
            $items_query = "SELECT `items` FROM `approval_requests` WHERE `request_id` = '$request_id'";
            $items_result = mysqli_query($con, $items_query);

            if ($items_result && $row = mysqli_fetch_assoc($items_result)) {
                $items = json_decode($row['items'], true);
                if (is_array($items)) {
                    foreach ($items as $item) {
                        $mt_name = mysqli_real_escape_string($con, $item['mt_name']);
                        $quantity = mysqli_real_escape_string($con, $item['quantity']);
                        $unit = mysqli_real_escape_string($con, $item['unit_id']);
                        $status_item = mysqli_real_escape_string($con, $item['status']);

                        // Update checkout table with new status
                        $update_checkout_query = "UPDATE `checkout` SET `status` = '$status' WHERE `mt_name` = '$mt_name' AND `request_id` = '$request_id'";
                        mysqli_query($con, $update_checkout_query);

                        // Update stock (assuming you have a way to get mt_id from mt_name)
                        $mt_id_query = "SELECT `mt_id`, `mt_stock` FROM `mt_table` WHERE `mt_name` = '$mt_name'";
                        $mt_id_result = mysqli_query($con, $mt_id_query);

                        if ($mt_id_result && $mt_id_row = mysqli_fetch_assoc($mt_id_result)) {
                            $mt_id = $mt_id_row['mt_id'];
                            $mt_stock = $mt_id_row['mt_stock'];

                            // Check if stock is greater than 0
                            if ($mt_stock > 0) {
                                $new_stock = $mt_stock - $quantity;
                                $update_stock_query = "UPDATE `mt_table` SET `mt_stock` = '$new_stock' WHERE `mt_id` = '$mt_id'";
                                mysqli_query($con, $update_stock_query);
                            } else {
                                // Optionally, handle the case where stock is 0 (e.g., log a message)
                                error_log("Stock is 0 for item: " . $mt_name);
                            }
                        }
                    }
                }
            }
        } else {
            // Update checkout table with new status for rejected requests
            $update_checkout_query = "UPDATE `checkout` SET `status` = '$status' WHERE `request_id` = '$request_id'";
            mysqli_query($con, $update_checkout_query);
        }

        $arr["success"] = "true";
        $arr["message"] = "Request " . $action . "ed successfully.";
    } else {
        $arr["success"] = "false";
        $arr["message"] = "Request ID not found.";
    }
} else {
    $arr["success"] = "false";
    $arr["message"] = "Query failed: " . mysqli_error($con);
}

echo json_encode($arr);
mysqli_close($con);
?>