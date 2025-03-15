<?php

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

include 'dbconnection.php';
$con = dbconnection();

if (!$con) {
    echo json_encode(['success' => 'false', 'message' => 'Database connection failed']);
    exit;
}

if (isset($_POST["user_id"], $_POST["user_name"], $_POST["user_email"], $_POST["user_role"])) {
    $user_id = $_POST["user_id"];
    $user_name = $_POST["user_name"];
    $user_email = $_POST["user_email"];
    $user_role = $_POST["user_role"];

    // ใช้ prepared statements เพื่อป้องกัน SQL injection
    $query = "UPDATE `usertb` SET `user_name` = ?, `user_email` = ?, `user_role` = ? WHERE `user_id` = ?";
    $stmt = mysqli_prepare($con, $query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "sssi", $user_name, $user_email, $user_role, $user_id);

        if (mysqli_stmt_execute($stmt)) {
            echo json_encode(['success' => 'true', 'message' => 'User updated successfully']);
        } else {
            echo json_encode(['success' => 'false', 'message' => 'Error updating user: ' . mysqli_stmt_error($stmt)]);
        }

        mysqli_stmt_close($stmt);
    } else {
        echo json_encode(['success' => 'false', 'message' => 'Error preparing statement: ' . mysqli_error($con)]);
    }
} else {
    echo json_encode(['success' => 'false', 'message' => 'Missing required parameters']);
}

mysqli_close($con);
?>