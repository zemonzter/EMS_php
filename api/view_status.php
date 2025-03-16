<?php
// Enable error reporting (for development only!)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include 'dbconnection.php';

// Use a try-catch block for better error handling
try {
    $conn = dbconnection();

    if ($conn->connect_error) {
        // Return a JSON error message
        die(json_encode(array("success" => false, "message" => "Connection failed: " . $conn->connect_error)));
    }

    $sql = "SELECT `status_id`, `status` FROM `status_tb`";
    $result = $conn->query($sql);

    $data = array();
    if ($result) { // Check if the query was successful
       while ($row = $result->fetch_assoc()) {
          $data[] = $row;
       }
    } else {
      // Handle query errors
      throw new Exception("Query error: " . $conn->error);
    }


    // Set the content type to JSON *before* outputting
    header('Content-Type: application/json');
    echo json_encode($data);

    $conn->close(); // Close the connection

} catch (Exception $e) {
    // Catch any exceptions and return a JSON error message
    header('Content-Type: application/json');
    echo json_encode(array("success" => false, "message" => $e->getMessage()));
}
?>