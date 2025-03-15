<?php

include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $role_id = $_POST['role_id'];
    $role = $_POST['role'];
    $description = $_POST['description'];

    $query = "UPDATE `role_table` SET `role`='$role', `description`='$description' WHERE `role_id`='$role_id'";

    $exe = mysqli_query($con, $query);
    $arr = [];
    if ($exe) {
        $arr["success"] = "true";
    } else {
        $arr["success"] = "false";
        $arr["message"] = mysqli_error($con);
    }

    print(json_encode($arr));
} else {
    $arr = ["success" => "false", "message" => "Method not allowed"];
    print(json_encode($arr));
}

?>