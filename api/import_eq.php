<?php
include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $HN_id = $_POST['HN_id'];
    $eqtype = $_POST['eq_type'];
    $username = $_POST['user_name'];
    $eqname = $_POST['eq_name'];
    $eqmodel = $_POST['eq_model'];
    $eqbrand = $_POST['eq_brand'];
    $eqstatus = $_POST['eq_status'];
    $eqprice = $_POST['eq_price'];
    $eqbuydate = $_POST['eq_buydate'];
    $eqdate = $_POST['eq_date'];
    $eqwarran = $_POST['eq_warran'];
    $name = $_POST['name'];


    $path = empty($name) ? 'upload/default.jpg' : "upload/$name";

    if (isset($_FILES['image'])) {
        $target_dir = "upload/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Check if file is a actual image or fake image
        $check = getimagesize($_FILES["image"]["tmp_name"]);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            $uploadOk = 0;
        }

        // Check if file already exists
        if (file_exists($target_file)) {
            $uploadOk = 0;
        }

        // Check file size
        if ($_FILES["image"]["size"] > 500000) {
            $uploadOk = 0;
        }

        // Allow certain file formats
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif") {
            $uploadOk = 0;
        }

        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            echo "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
        } else {
            if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
                echo "The file " . htmlspecialchars(basename($_FILES["image"]["name"])) . " has been uploaded.";
            } else {
                echo "Sorry, there was an error uploading your file.";
            }
        }
    }

    $query = "INSERT INTO `equipment_tb`(`HN_id`, `eq_type`, `user_name`, `eq_name`, `eq_brand`, `eq_model`, `eq_status`, `eq_price`, `eq_buydate`, `eq_date`, `eq_warran`, `eq_img`) 
              VALUES ('$HN_id', '$eqtype', '$username', '$eqname', '$eqbrand', '$eqmodel', '$eqstatus', '$eqprice', '$eqbuydate', '$eqdate', '$eqwarran', '$path')";


    $exe = mysqli_query($con, $query);

    $arr = [];
    if ($exe) {
        $arr["success"] = "true";
    } else {
        $arr["success"] = "false";
    }

    print(json_encode($arr));
}
?>