<?php

include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $eq_id = $_POST['eq_id'];  // Get eq_id.  IMPORTANT!
    $eq_name = $_POST['eq_name'];
    $eq_model = $_POST['eq_model'];
    $eq_serial = $_POST['eq_serial'];
    $eq_price = $_POST['eq_price'];
    $eq_warran = $_POST['eq_warran'];

    // Get other values that might not have changed.  Critical!
    $eq_type = $_POST['eq_type'];
    $user_id = $_POST['user_id'];
    $eq_brand = $_POST['eq_brand'];
    $eq_status = $_POST['eq_status'];
    $eq_date = $_POST['eq_date'];


    // Image handling:  Check if a NEW image was uploaded
    if (isset($_FILES['eq_img']) && $_FILES['eq_img']['error'] == UPLOAD_ERR_OK) {
        $eq_img_name = $_FILES['eq_img']['name'];
        $eq_img_tmp = $_FILES['eq_img']['tmp_name'];
        $path = "upload/" . $eq_img_name;  // Make sure this 'upload' directory exists and is writable

        if (move_uploaded_file($eq_img_tmp, $path)) {
            // Image uploaded successfully.  Update query will include image path
            $query = "UPDATE `eq_table` SET
                        `eq_name`='$eq_name',
                        `eq_model`='$eq_model',
                        `eq_serial`='$eq_serial',
                        `eq_price`='$eq_price',
                        `eq_warran`='$eq_warran',
                        `eq_type`='$eq_type',
                        `user_id`='$user_id',
                        `eq_brand`='$eq_brand',
                        `eq_status`='$eq_status',
                        `eq_date`='$eq_date',
                        `eq_img`='$path'
                      WHERE `eq_id`='$eq_id'";

        } else {
          // Image upload failed
            $arr = ["success" => "false", "message" => "Image upload failed"];
            print(json_encode($arr));
            exit;
        }
    } else {
      // No new image uploaded. Update query *without* image path.
         $query = "UPDATE `eq_table` SET
                        `eq_name`='$eq_name',
                        `eq_model`='$eq_model',
                        `eq_serial`='$eq_serial',
                        `eq_price`='$eq_price',
                        `eq_warran`='$eq_warran',
                        `eq_type`='$eq_type',
                        `user_id`='$user_id',
                        `eq_brand`='$eq_brand',
                        `eq_status`='$eq_status',
                        `eq_date`='$eq_date'

                      WHERE `eq_id`='$eq_id'";
    }



    $exe = mysqli_query($con, $query);

    $arr = [];
    if ($exe) {
        $arr["success"] = "true";
    } else {
        $arr["success"] = "false";
        $arr["message"] = "Error updating record: " . mysqli_error($con); // Include specific error
    }

    print(json_encode($arr));

} else {
    $arr = ["success" => "false", "message" => "Method not allowed"];
    print(json_encode($arr));
}

?>