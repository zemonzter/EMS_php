<?php
include 'condb.php';

// Use prepared statements to prevent SQL injection!
$checkout_id = $_POST['checkout_id'] ?? null; // Use null coalescing operator
$mt_name = $_POST['mt_name'] ?? null;
$username = $_POST['username'] ?? null; // c_name
$quantity = $_POST['quantity'] ?? null;
$unit = $_POST['unit'] ?? null;
$status = $_POST['status'] ?? null;

// Check if checkout_id is provided and is a number
if (!is_numeric($checkout_id)) {
    echo json_encode(['success' => "false", 'message' => 'Invalid checkout ID.']);
    exit; // Stop execution if checkout_id is invalid
}
// Prepare the SQL statement *with placeholders*
$sql = "UPDATE checkout SET mt_name=?, username=?, quantity=?, unit=?, status=? WHERE checkout_id=?";
$stmt = mysqli_prepare($conn, $sql);

if ($stmt) {
    // Bind parameters to the prepared statement
    mysqli_stmt_bind_param($stmt, "sssssi", $mt_name, $username, $quantity, $unit, $status, $checkout_id);

    // Execute the statement
    $result = mysqli_stmt_execute($stmt);

    if ($result) {
        echo json_encode(['success' => "true"]);
    } else {
        echo json_encode(['success' => "false", 'message' => mysqli_error($conn)]);
    }

    mysqli_stmt_close($stmt); // Close the prepared statement
} else {
    echo json_encode(['success' => "false", 'message' => 'Failed to prepare statement: ' . mysqli_error($conn)]);
}

mysqli_close($conn);
?>