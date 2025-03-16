<?php
include 'dbconnection.php';
$con = dbconnection();

if (isset($_GET['mtname'])) {
  $mtname = $_GET['mtname'];
  $query = "SELECT COUNT(*) FROM mt_table WHERE mt_name = '$mtname'";
  $result = mysqli_query($con, $query);
  $row = mysqli_fetch_array($result);
  $count = $row[0];

  $response = array('duplicate' => $count > 0);
  echo json_encode($response);
} else {
  $response = array('duplicate' => false);
  echo json_encode($response);
}
?>