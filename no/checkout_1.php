<?php
require_once('db_connect.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get data from the request, handling potential missing fields
    $mtId = $_POST['mt_id'] ?? null; // Use null coalescing operator
    $mtName = $_POST['mt_name'] ?? ''; // Provide a default empty string
    $username = $_POST['username'] ?? '';
    $quantity = $_POST['quantity'] ?? 0;   // Default to 0
    $unit = $_POST['unit'] ?? '';       //default to empty string
    $status = $_POST['status'] ?? 'pending'; // Default to 'pending' if not provided
    $date = $_POST['date'] ?? date('Y-m-d');  //Default to current time

    // Validate required fields.  Crucial for preventing database errors.
    if (!$mtId || !$username || !$quantity) { //Simplified validation.
        http_response_code(400); // Bad Request
        echo json_encode(['success' => false, 'message' => 'Missing required fields (mt_id, username, or quantity)']);
        exit;
    }


    // Check if checkout_id exists, and also that status is being set.
    if(isset($_POST['checkout_id']) && isset($_POST['status'])){
        //Approve or Reject
        $checkoutId = $_POST['checkout_id'];
        $status = $_POST['status'];

        $stmt = $conn->prepare("UPDATE checkout SET status = ? WHERE checkout_id = ?");
        $stmt->bind_param("si", $status, $checkoutId);

        if ($stmt->execute()) {
             if ($stmt->affected_rows > 0) {
                // Update successful
                echo json_encode(['success' => true]);
                exit;
             } else {
                http_response_code(404); // Or 400
                echo json_encode(['success' => false, 'message' => 'Checkout ID not found or status already updated.']);
                exit;
             }
        } else {
            //Handle database errors.
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => 'Database error: ' .  $stmt->error]);
            exit;
        }

    } else {
        //Insert
        // Use prepared statements to prevent SQL injection
        $stmt = $conn->prepare("INSERT INTO checkout (mt_id, mt_name, username, quantity, unit, date, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ississs", $mtId, $mtName, $username, $quantity, $unit, $date, $status);  // Corrected binding

        if ($stmt->execute()) {
            // Get the last inserted ID.  CRUCIAL for updating stock later.
            $newCheckoutId = $conn->insert_id;
            echo json_encode(['success' => true, 'checkout_id' => $newCheckoutId]); // Return the new ID
        } else {
            http_response_code(500); // Internal Server Error
            echo json_encode(['success' => false, 'message' => 'Database error: ' . $stmt->error]);
        }
        $stmt->close();
    }

} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}

mysqli_close($conn);

?>