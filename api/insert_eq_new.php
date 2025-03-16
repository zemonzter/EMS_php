<?php
include 'dbconnection.php';
$con = dbconnection();

if ($con === false) {
    $arr = ["success" => "false", "error" => "Database connection failed"];
    print(json_encode($arr));
    exit;
}

function get_post_var($con, $var_name) {
    if (isset($_POST[$var_name])) {
        return mysqli_real_escape_string($con, $_POST[$var_name]);
    } else {
        return null;
    }
}

$hn_id = get_post_var($con, "hn_id");
$eqtname = get_post_var($con, "eqtname");
$userid = get_post_var($con, "userid");
$eqname = get_post_var($con, "eqname");
$eqmodel = get_post_var($con, "eqmodel");
$eqbrand = get_post_var($con, "eqbrand");
$eqserial = get_post_var($con, "eqserial");
$eqstatus = get_post_var($con, "eqstatus");
$eqprice = get_post_var($con, "eqprice");
$eqdate = get_post_var($con, "eqdate");
$eqbuydate = get_post_var($con, "eqbuydate");
$eqwarran = get_post_var($con, "eqwarran");
$data = get_post_var($con, "data");
$name = get_post_var($con, "name");
$quantity = intval(get_post_var($con, "quantity"));

if (
    $hn_id === null || $eqtname === null || $userid === null || $eqname === null || $eqmodel === null ||
    $eqbrand === null || $eqserial === null || $eqstatus === null || $eqprice === null ||
    $eqdate === null || $eqbuydate === null || $eqwarran === null || $quantity === null
) {
    $arr = ["success" => "false", "error" => "Missing required fields"];
    print(json_encode($arr));
    exit;
}

$path = empty($name) ? 'upload/default.jpg' : "upload/$name";

if (!empty($data)) {
    $data = str_replace(['data:image/png;base64,', 'data:image/jpeg;base64,', ' '], ['', '', '+'], $data);
    $decoded_data = base64_decode($data, true);
    file_put_contents(filename: $path,data: base64_decode(string: $data));

    if ($decoded_data === false) {
        $arr = ["success" => "false", "error" => "Invalid base64 image data"];
        print(json_encode($arr));
        exit;
    }

    if (!file_exists('upload') && !mkdir('upload', 0777, true)) {
        $arr = ["success" => "false", "error" => "Failed to create upload directory"];
        print(json_encode($arr));
        exit;
    }

    if (file_put_contents($path, $decoded_data) === false) {
        $arr = ["success" => "false", "error" => "Failed to save image file"];
        print(json_encode($arr));
        exit;
    }
}

// Check if HN_id exists for single quantity add
$check_query = "SELECT HN_id FROM equipment_tb WHERE HN_id = ?";
$check_stmt = mysqli_prepare($con, $check_query);
mysqli_stmt_bind_param($check_stmt, "s", $hn_id);
mysqli_stmt_execute($check_stmt);
mysqli_stmt_store_result($check_stmt);

if (mysqli_stmt_num_rows($check_stmt) > 0 && $quantity == 1) {
    $arr = ["success" => "false", "error" => "HN_id already exists."];
    print(json_encode($arr));
    exit;
}

mysqli_stmt_close($check_stmt);

$generated_hn_id = $hn_id;
$inserted_count = 0;
for ($i = 0; $i < $quantity; $i++) {
    $current_hn_id = $i === 0 ? $hn_id : $generated_hn_id;
    $query = "INSERT INTO `equipment_tb`(`HN_id`, `eq_type`, `user_name`, `eq_name`, `eq_brand`, `eq_model`, `eq_status`, `eq_price`, `eq_buydate`, `eq_date`, `eq_warran`, `eq_img`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($con, $query);
    mysqli_stmt_bind_param($stmt, "ssssssssssss", $current_hn_id, $eqtname, $userid, $eqname, $eqbrand, $eqmodel, $eqstatus, $eqprice, $eqbuydate, $eqdate, $eqwarran, $path);
    if (!mysqli_stmt_execute($stmt)) {
        $arr = ["success" => "false", "error" => "Insert failed : " . mysqli_stmt_error($stmt)];
        print(json_encode($arr));
        exit;
    }
    $inserted_count++;
    mysqli_stmt_close($stmt);

    if ($i < $quantity - 1) {
        if (preg_match('/(\d+)$/', $generated_hn_id, $matches)) {
            $numeric_part = (int) $matches[1];
            $new_numeric_part = $numeric_part + 1;
            $generated_hn_id = preg_replace('/\d+$/', sprintf("%0" . strlen($matches[1]) . "d", $new_numeric_part), $generated_hn_id);
        } else {
            $generated_hn_id .= '1';
        }

        // Check for duplicates within the current operation
        $check_duplicate_query = "SELECT HN_id FROM equipment_tb WHERE HN_id = ?";
        $check_duplicate_stmt = mysqli_prepare($con, $check_duplicate_query);
        mysqli_stmt_bind_param($check_duplicate_stmt, "s", $generated_hn_id);
        mysqli_stmt_execute($check_duplicate_stmt);
        mysqli_stmt_store_result($check_duplicate_stmt);
        if (mysqli_stmt_num_rows($check_duplicate_stmt) > 0){
          $arr = ["success" => "false", "error" => "Duplicate ID within creation"];
          print(json_encode($arr));
          exit;
        }
        mysqli_stmt_close($check_duplicate_stmt);
    }
}

$response = ["success" => "true"];

if ($quantity > 1){
  $response["generated_hn_id"] = $generated_hn_id;
}

print(json_encode($response));
?>