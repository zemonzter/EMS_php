<?php
require_once('db_connect.php');

// Check if checkout_id is provided in the POST request, handle errors robustly
if (!isset($_POST['checkout_id'])) {
    http_response_code(400); // Bad Request
    echo json_encode(['success' => false, 'message' => 'checkout_id is required']);
    exit; // Stop execution if checkout_id is missing
}

$checkoutId = $_POST['checkout_id'];

// Use prepared statements to prevent SQL injection, and handle potential errors
$stmt = $conn->prepare("SELECT quantity, mt_name FROM checkout WHERE checkout_id = ?");
if (!$stmt) {
    http_response_code(500); // Internal Server Error
    echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
    exit;
}

$stmt->bind_param("i", $checkoutId);  // 'i' for integer

if ($stmt->execute()) {
    $result = $stmt->get_result(); // Get the result set
    if ($row = $result->fetch_assoc()) { // Fetch the row
        echo json_encode($row);  // Return the row as JSON.  This is what your Flutter code expects.
    } else {
        http_response_code(404); // Not found
        echo json_encode(['success' => false, 'message' => 'Checkout details not found']); // Valid JSON
    }
} else {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Database error: ' . $stmt->error]);
}

$stmt->close();
mysqli_close($conn);
?>