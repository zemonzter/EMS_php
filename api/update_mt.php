<?php
include 'dbconnection.php'; // Include your database connection file

$con = dbconnection();

if ($con === false) {
    $arr = ["success" => "false", "error" => "Database connection failed"];
    print(json_encode($arr));
    exit;
}

// --- Input Validation and Sanitization ---
function get_post_var($con, $var_name) {
    if (isset($_POST[$var_name])) {
        return mysqli_real_escape_string($con, $_POST[$var_name]);
    } else {
        return null;
    }
}

$id = get_post_var($con, "id");
$name = get_post_var($con, "name");
$stock = get_post_var($con, "stock");
$unit = get_post_var($con, "unit");
$url = get_post_var($con, "url");

// --- Input Validation (check for required fields) ---
if ($id === null || $name === null || $stock === null || $unit === null) {
    $arr = ["success" => "false", "error" => "Missing required fields"];
    print(json_encode($arr));
    exit;
}

// --- Prepared Statement for UPDATE ---
$query = "UPDATE mt_table SET mt_name = ?, mt_stock = ?, unit_id = ?, mt_url = ? WHERE mt_id = ?";
$stmt = mysqli_prepare($con, $query);

if ($stmt === false) {
    $arr = ["success" => "false", "error" => "Prepare failed: " . mysqli_error($con)];
    print(json_encode($arr));
    exit;
}

// Bind parameters
$bind_result = mysqli_stmt_bind_param($stmt, "ssssi", $name, $stock, $unit, $url, $id); // 'i' for integer (mt_id)

if ($bind_result === false) {
    $arr = ["success" => "false", "error" => "Bind failed: " . mysqli_stmt_error($stmt)];
    print(json_encode($arr));
    exit;
}

// Execute the statement
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