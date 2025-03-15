
<?php



function dbconnection(): bool|mysqli {
    // $host = 'zeus.rmutsv.ac.th';
    // $user = 'stockcoe';
    // $password = 'stock77e';
    // $database = 'stockcoe';

    $host = 'localhost';

    $user = 'admin';

    $password = '44880';

    $database = 'ems_db';



    $con = mysqli_connect(hostname: $host, username: $user, password: $password, database: $database);


    if (!$con) {
        die("Connection failed: " . mysqli_connect_error());
    }

    return $con;
}

$connection = dbconnection();

// if ($connection) {
//     echo "Database connection successful!\n";

//     // ทดสอบการ query ข้อมูล
//     $result = mysqli_query($connection, "SELECT 1");
//     if ($result) {
//         echo "Query test successful!\n";
//         mysqli_free_result($result);
//     } else {
//         echo "Query test failed: " . mysqli_error($connection) . "\n";
//     }

//     // mysqli_close($connection); // ปิดการเชื่อมต่อเมื่อเสร็จสิ้น
// }

?>
