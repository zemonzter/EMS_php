<?php
require_once('db_connect.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mtId = $_POST['mt_id'] ?? null;       // Use null coalescing operator
    $newStock = $_POST['mt_stock'] ?? null;  // Get the new stock level

    // Validate input: Check if mtId and newStock are provided AND are valid integers.
    if ($mtId === null || !is_numeric($mtId) || $newStock === null || !is_numeric($newStock)) {
        http_response_code(400); // Bad Request
        echo json_encode(['success' => false, 'message' => 'Invalid mt_id or mt_stock provided. Both must be integers.']);
        exit;
    }

    // Convert to integers (safe to do after is_numeric check)
    $mtId = (int)$mtId;
    $newStock = (int)$newStock;


    // Use prepared statements
    $stmt = $conn->prepare("UPDATE mt_table SET mt_stock = ? WHERE mt_id = ?");
    if (!$stmt) {
      http_response_code(500); // Internal Server Error
      echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
      exit;
    }
    $stmt->bind_param("ii", $newStock, $mtId); // Both are integers

    if ($stmt->execute()) {
        // Check affected rows to confirm the update happened.
        if($stmt->affected_rows > 0) {
            echo json_encode(['success' => true]);
        } else {
             // This is important:  If no rows are affected, the ID probably doesn't exist.
            http_response_code(404); // Not Found
            echo json_encode(['success' => false, 'message' => 'Update failed: Material not found or no change.']);
        }
    } else {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Database error: ' . $stmt->error]);
    }
        $stmt->close();
        mysqli_close($conn);

} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}

?>