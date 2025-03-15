<?php

include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['user_id'])) {
        $user_id = $_POST['user_id'];

        $query = "DELETE FROM `usertb` WHERE `user_id` = '$user_id'";
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
        $arr = ["success" => "false", "message" => "user_id not provided"];
        print(json_encode($arr));
    }
} else {
    $arr = ["success" => "false", "message" => "Method not allowed"];
    print(json_encode($arr));
}

mysqli_close($con);
?>