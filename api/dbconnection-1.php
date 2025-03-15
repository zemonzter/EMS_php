<?php

class Database {
    private $host;
    private $user;
    private $password;
    private $database;
    private $connection;

    public function __construct(string $host, string $user, string $password, string $database) {
        $this->host = $host;
        $this->user = $user;
        $this->password = $password;
        $this->database = $database;
    }

    public function connect(): bool {
        $this->connection = mysqli_connect($this->host, $this->user, $this->password, $this->database);

        if (!$this->connection) {
             error_log("Connection failed: " . mysqli_connect_error()); // ดีกว่า die() ตรงที่ log ลง error file ได้
            return false;
        }
        return true;
    }

    public function getConnection(): ?mysqli {  // ใช้ ?mysqli เพื่อบอกว่าอาจจะ return null ได้
        return $this->connection;
    }
    
    public function query($sql) {
        if ($this->connection) {
            return mysqli_query($this->connection, $sql);
        }
    return null;
    }

    public function close(): void {
        if ($this->connection) {
            mysqli_close($this->connection);
        }
    }
}

// การใช้งาน
$db = new Database('localhost', 'admin', '44880', 'ems_db');

if ($db->connect()) {
    $conn = $db->getConnection(); // รับ mysqli connection object

    $result = $db->query("SELECT 1"); // เรียกใช้ method query
    if ($result) {
        echo "Query successful!\n";
          mysqli_free_result($result);
    }
     else {
         echo "Query failed: " . mysqli_error($conn)."\n"; //ใช้ $conn ตรงนี้
    }

    $db->close(); // ปิด connection
} else {
    echo "Database connection failed!\n";
}

?>