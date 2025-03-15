<?php
// connect database
include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $type = $_POST['type'];

    $query = "INSERT INTO usertb (user_epass, user_fname, user_email, user_role) VALUES ('$username', '$name', '$email', '$type')";

    if (mysqli_query($con, $query)) {
        echo json_encode(['success' => true, 'message' => 'User data saved successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error saving user data: ' . mysqli_error($con)]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}
?>