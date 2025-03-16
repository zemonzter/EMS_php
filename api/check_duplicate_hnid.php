<?php
include 'dbconnection.php';
$con = dbconnection();

if (isset($_GET['HN_id'])) {
    $hnId = $_GET['HN_id'];
    $query = "SELECT COUNT(*) FROM equipment_tb WHERE HN_id = '$hnId'";
    $result = mysqli_query($con, $query);
    $row = mysqli_fetch_array($result);
    $count = $row[0];

    $response = array('duplicate' => $count > 0);
    echo json_encode($response);
} else {
    $response = array('duplicate' => false);
    echo json_encode($response);
}
?>