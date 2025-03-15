<?php

include 'dbconnection.php';
$con = dbconnection();

if (isset($_POST["mainten_status"])) {
    $mainten_status = $_POST["mainten_status"];
} else {
    return;
}

$query = "INSERT INTO `maintenance_status`(`mainten_status`) VALUES ('$mainten_status')";

$exe = mysqli_query($con, $query);
$arr = [];
if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
    $arr["message"] = mysqli_error($con);
}

echo json_encode($arr);
?>