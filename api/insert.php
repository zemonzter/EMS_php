<?php

include 'dbconnection.php';
$con = dbconnection();

if (isset($_POST["eqtname"])) {
    $eqtname = $_POST["eqtname"];
} else {
    return;
}

$query = "INSERT INTO `eq_type`(`eqt_name`) VALUES ('$eqtname')";

$exe = mysqli_query($con, $query);

$arr = [];
if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
}

print(json_encode($arr));

?>