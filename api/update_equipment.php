<?php
// update_equipment.php
include 'dbconnection.php';
$conn = dbconnection();

if ($conn->connect_error) {
    die(json_encode(array("success" => false, "message" => "Connection failed: " . $conn->connect_error)));
}

// Get data from the request
$hn_id        = $_POST['HN_id'];
$eq_type      = $_POST['eq_type'];
$user_name    = $_POST['user_name'];
$eq_name      = $_POST['eq_name'];
$eq_brand     = $_POST['eq_brand'];
$eq_model     = $_POST['eq_model'];
$eq_status    = $_POST['eq_status'];  // This is now the status_id
$eq_price     = $_POST['eq_price'];
$eq_buydate   = $_POST['eq_buydate'];
$eq_date      = $_POST['eq_date'];
$eq_warran    = $_POST['eq_warran'];
$old_hn_id    = $_POST['old_HN_id']; // Keep using old_HN_id for the WHERE clause


$stmt = $conn->prepare("UPDATE equipment_tb SET
    eq_type = ?,
    user_name = ?,
    eq_name = ?,
    eq_brand = ?,
    eq_model = ?,
    eq_status = ?,
    eq_price = ?,
    eq_buydate = ?,
    eq_date = ?,
    eq_warran = ?
    WHERE HN_id = ?");  // Correct WHERE clause

    // Correct number of bound parameters:  s s s s s s s s s s s
$stmt->bind_param("sssssssssss", $eq_type, $user_name,  $eq_name, $eq_brand, $eq_model, $eq_status, $eq_price, $eq_buydate, $eq_date, $eq_warran, $old_hn_id);


if ($stmt->execute()) {
    echo json_encode(array("success" => true, "message" => "Record updated successfully"));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record: " . $stmt->error));
}

$stmt->close();
$conn->close();

?>