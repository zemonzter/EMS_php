<?php
include 'dbconnection.php';
$con = dbconnection();

if ($con === false) {
    $arr = ["success" => "false", "error" => "Database connection failed"];
    print(json_encode($arr));
    exit;
}

// --- Input Validation and Sanitization ---
function get_post_var($con, $var_name)
{
    if (isset($_POST[$var_name])) {
        return mysqli_real_escape_string($con, $_POST[$var_name]);
    } else {
        return null;
    }
}

$eqtname = get_post_var($con, "eqtname");
$userid = get_post_var($con, "userid");  // Assuming this is user_name
$eqname = get_post_var($con, "eqname");
$eqmodel = get_post_var($con, "eqmodel");
$eqbrand = get_post_var($con, "eqbrand");
$eqserial = get_post_var($con, "eqserial"); //  Used only for part of HN_id
$eqstatus = get_post_var($con, "eqstatus");
$eqprice = get_post_var($con, "eqprice");
$eqdate = get_post_var($con, "eqdate");    //  eq_date (เบิก)
$eqbuydate = get_post_var($con, "eqbuydate");  // eq_buydate
$eqwarran = get_post_var($con, "eqwarran");
$data = get_post_var($con, "data");
$name = get_post_var($con, "name");

// --- Input validation (check for required fields) ---
if (
    $eqtname === null || $userid === null || $eqname === null || $eqmodel === null ||
    $eqbrand === null || $eqserial === null || $eqstatus === null || $eqprice === null ||
    $eqdate === null || $eqbuydate === null || $eqwarran === null
) {
    $arr = ["success" => "false", "error" => "Missing required fields"];
    print(json_encode($arr));
    exit;
}

// --- Image Handling ---
$path = empty($name) ? 'upload/default.jpg' : "upload/$name";

if (!empty($data)) {
    $data = str_replace(['data:image/png;base64,', 'data:image/jpeg;base64,', ' '], ['', '', '+'], $data);
    $decoded_data = base64_decode($data, true);

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

// --- HN_id generation (NOW IN PHP) ---
function get_next_hn_id($con)
{
    $query = "SELECT HN_id FROM equipment_tb ORDER BY HN_id DESC LIMIT 1";
    $result = mysqli_query($con, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $last_hn_id = $row['HN_id'];

        if (preg_match('/^ทต\.(\d{3})-(\d{4})$/', $last_hn_id, $matches)) {
            $last_xxx = (int)$matches[1];
            $last_yyyy = (int)$matches[2];
            $next_yyyy = $last_yyyy + 1;
            $next_xxx = $last_xxx;

            if ($next_yyyy > 9999) {
                $next_yyyy = 1;
                $next_xxx += 1;
            }
            return sprintf("ทต.%03d-%04d", $next_xxx, $next_yyyy);
        } else {
          return null; // Or a default value like "ทต.001-0001"
        }
    } else {
        return "ทต.001-0001"; // Initial value if the table is empty
    }
}

$hn_id = get_next_hn_id($con);  // Generate the ID *here*

if ($hn_id === null) {
    $arr = ["success" => "false", "error" => "Could not generate HN_id"];
    print(json_encode($arr));
    exit;
}

// --- Prepared Statement ---
$query = "INSERT INTO `equipment_tb`(`HN_id`, `eq_type`, `user_name`, `eq_name`, `eq_brand`, `eq_model`, `eq_status`, `eq_price`, `eq_buydate`, `eq_date`, `eq_warran`, `eq_img`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
$stmt = mysqli_prepare($con, $query);

if ($stmt === false) {
    $arr = ["success" => "false", "error" => "Prepare failed: " . mysqli_error($con)];
    print(json_encode($arr));
    exit;
}

$bind_result = mysqli_stmt_bind_param($stmt, "ssssssssssss", $hn_id, $eqtname, $userid, $eqname, $eqbrand, $eqmodel, $eqstatus, $eqprice, $eqbuydate, $eqdate, $eqwarran, $path);

if ($bind_result === false) {
    $arr = ["success" => "false", "error" => "Bind failed: " . mysqli_stmt_error($stmt)];
    print(json_encode($arr));
    exit;
}

$exec_result = mysqli_stmt_execute($stmt);

if ($exec_result) {
    $arr = ["success" => "true"];
} else {
    $arr = ["success" => "false", "error" => "Execute failed: " . mysqli_stmt_error($stmt)];
}

mysqli_stmt_close($stmt);
mysqli_close($con);
print(json_encode($arr));

?>