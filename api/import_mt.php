<?php
include 'dbconnection.php';
$con = dbconnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mttype = $_POST['mttype'];
    $mtname = $_POST['mtname'];
    $unitid = $_POST['unitid'];
    $mtstock = $_POST['mtstock'];
    $unitprice = $_POST['unitprice'];
    $mtprice = $_POST['mtprice'];
    $mtdate = $_POST['mtdate'];
    $mtlink = $_POST['mtlink'];
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

    $query = "INSERT INTO `mt_table`(`mt_type`, `mt_name`, `unit_id`, `mt_stock`, `unit_price`, `mt_price`, `mt_date`,`mt_url`, `mt_img`) 
              VALUES ('$mttype','$mtname','$unitid','$mtstock','$unitprice','$mtprice','$mtdate','$mtlink','$path')";

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