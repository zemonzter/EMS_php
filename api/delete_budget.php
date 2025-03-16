<?php
// delete_budget.php

include 'dbconnection.php';
$conn = dbconnection();  // Use consistent variable name ($conn)

header('Content-Type: application/json'); // Set Content-Type header

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['budget_id'])) {
        $budget_id = $_POST['budget_id'];

        // --- Input Validation ---
        if (empty($budget_id)) {
            $response = array('status' => 'error', 'message' => 'budget_id is required.');
            echo json_encode($response);
            exit(); // Stop execution after error
        }

        if (!is_numeric($budget_id)) {  //Check budget_id is numeric.
            $response = array('status' => 'error', 'message' => 'budget_id must be a number.');
            echo json_encode($response);
            exit();
        }
        // --- End Validation ---

         // --- Database connection check---
         if ($conn->connect_error) {
            $response = array('status' => 'error', 'message' => 'Connection failed: ' . $conn->connect_error);
            echo json_encode($response);
            exit();
        }
        $conn->set_charset("utf8mb4");

        // Use prepared statements to prevent SQL injection
        $stmt = $conn->prepare("DELETE FROM `budget_table` WHERE `budget_id` = ?");

        if ($stmt === false) {
            $response = array('status' => 'error', 'message' => 'Error preparing statement: ' . $conn->error);
            echo json_encode($response);
            $conn->close(); // Close the connection
            exit();
        }

        $stmt->bind_param("i", $budget_id); // "i" for integer

        if ($stmt->execute()) {
            // Check if any rows were affected (budget_id existed)
            if ($stmt->affected_rows > 0) {
                $response = array('status' => 'success', 'message' => 'Budget deleted successfully!');
                echo json_encode($response);
            } else {
                $response = array('status' => 'error', 'message' => 'Budget not found.'); // More specific error
                 echo json_encode($response);
            }
        } else {
            $response = array('status' => 'error', 'message' => 'Error deleting budget: ' . $stmt->error);
            echo json_encode($response);
        }

        $stmt->close();
        $conn->close(); // Close connection

    } else {
        $response = array('status' => 'error', 'message' => 'budget_id not provided');
        echo json_encode($response);
        exit(); // Stop execution
    }
} else {
    $response = array('status' => 'error', 'message' => 'Method not allowed');
    echo json_encode($response);
     exit();
}

?>