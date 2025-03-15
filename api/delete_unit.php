<?php

include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['unit_id'])) {
        $unit_id = $_POST['unit_id'];

        $query = "DELETE FROM `unit_table` WHERE `unit_id` = '$unit_id'";
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
        $arr = ["success" => "false", "message" => "unit_id not provided"];
        print(json_encode($arr));
    }
} else {
    $arr = ["success" => "false", "message" => "Method not allowed"];
    print(json_encode($arr));
}

mysqli_close($con);
?>