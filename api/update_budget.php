<?php
// update_budget.php

include 'dbconnection.php';
$conn = dbconnection();

// Set Content-Type header
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $budget_id = $_POST['budget_id'];
    $budget_name = isset($_POST['budget_name']) ? $_POST['budget_name'] : null;
    $budget_amount = isset($_POST['budget_amount']) ? $_POST['budget_amount'] : null;
    $budget_year = isset($_POST['budget_year']) ? $_POST['budget_year'] : null;
    $budget_type = isset($_POST['budget_type']) ? $_POST['budget_type'] : null;


     // --- Validation ---
    if (empty($budget_id)) {
        $response = array('status' => 'error', 'message' => 'Budget ID is required.');
        echo json_encode($response);
        exit();
    }

    if (!is_numeric($budget_id)) {
        $response = array('status' => 'error', 'message' => 'Budget ID must be a number.');
        echo json_encode($response);
        exit();
    }
        // Validate other fields only if they are provided
    if ($budget_name !== null && empty($budget_name)) {
        $response = array('status' => 'error', 'message' => 'Budget name cannot be empty if provided.');
        echo json_encode($response);
        exit();
    }

    if ($budget_amount !== null && !is_numeric($budget_amount)) {
        $response = array('status' => 'error', 'message' => 'Budget amount must be a number if provided.');
        echo json_encode($response);
        exit();
    }

    if ($budget_year !== null && (!is_numeric($budget_year) || strlen($budget_year) != 4)) {
        $response = array('status' => 'error', 'message' => 'Budget year must be a 4-digit number if provided.');
        echo json_encode($response);
        exit();
    }

    if ($budget_type !== null) {
        $valid_budget_types = array("ครุภัณฑ์", "วัสดุ");
        if (!in_array($budget_type, $valid_budget_types)) {
            $response = array('status' => 'error', 'message' => 'Invalid budget type.');
            echo json_encode($response);
            exit();
        }
    }
    // --- End Validation ---

    // --- Database connection check---
    if ($conn->connect_error) {
        $response = array('status' => 'error', 'message' => 'Connection failed: ' . $conn->connect_error);
        echo json_encode($response);
        exit();
    }
    $conn->set_charset("utf8mb4");

    // --- Build the SQL query dynamically ---
    $sql = "UPDATE `budget_table` SET ";
    $types = "";
    $values = [];

    if ($budget_name !== null) {
        $sql .= "`budget_name`=?, ";
        $types .= "s";
        $values[] = $budget_name;
    }
    if ($budget_amount !== null) {
        $sql .= "`budget_amount`=?, ";
        $types .= "s"; // Treat as string
        $values[] = $budget_amount;
    }
    if ($budget_year !== null) {
        $sql .= "`budget_year`=?, ";
        $types .= "s";
        $values[] = $budget_year;
    }
    if ($budget_type !== null) {
        $sql .= "`budget_type`=?, ";
        $types .= "s";
        $values[] = $budget_type;
    }

    // Remove the trailing comma and space
    $sql = rtrim($sql, ", ");

    $sql .= " WHERE `budget_id`=?";
    $types .= "i";
    $values[] = $budget_id;


    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        $response = array('status' => 'error', 'message' => 'Error preparing statement: ' . $conn->error);
        echo json_encode($response);
        $conn->close();
        exit();
    }

    // --- Dynamic Binding ---
    $stmt->bind_param($types, ...$values); // Use the splat operator (...)


    if ($stmt->execute()) {
        $response = array('status' => 'success', 'message' => 'Budget updated successfully!');
        echo json_encode($response);
    } else {
        $response = array('status' => 'error', 'message' => 'Error updating budget: ' . $stmt->error);
        echo json_encode($response);
    }

    $stmt->close();
    $conn->close();

} else {
    $response = array('status' => 'error', 'message' => 'Method not allowed');
    echo json_encode($response);
}

?>