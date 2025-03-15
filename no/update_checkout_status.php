<?php
header('Content-Type: application/json');

include 'dbconnection.php';
$con = dbconnection();

$arr = []; // Initialize the response array

if (isset($_POST["checkout_id"]) && isset($_POST["status"])) {
    $checkout_id = $_POST["checkout_id"];
    $status = $_POST["status"];

    $query = "UPDATE `checkout` SET `status`='$status' WHERE `checkout_id`='$checkout_id'";
    $exe = mysqli_query($con, $query);

    if ($exe) {
        $arr["success"] = "true";
    } else {
        $arr["success"] = "false";
        $arr["message"] = mysqli_error($con); // Add error message for debugging
    }
} else {
    $arr["success"] = "false";
    $arr["message"] = "Invalid request parameters.";
}

echo json_encode($arr); // Send the JSON response
mysqli_close($con); // Close connection
?>