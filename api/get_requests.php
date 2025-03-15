<?php
header('Content-Type: application/json');

include 'dbconnection.php';
$con = dbconnection();

if (!$con) {
    echo json_encode(["success" => "false", "message" => "Database connection failed: " . mysqli_connect_error()]);
    exit;
}

$query = "SELECT * FROM `approval_requests`";
$exe = mysqli_query($con, $query);

$requests = [];
while ($row = mysqli_fetch_assoc($exe)) {
    $requests[] = $row;
}

echo json_encode($requests);
mysqli_close($con);
?>