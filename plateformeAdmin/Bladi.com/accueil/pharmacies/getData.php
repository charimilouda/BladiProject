<?php

// Connect to MySQL database
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'bladi';

$connection = new mysqli($host, $user, $password, $database);
if ($connection->connect_error) {
    die('Connection failed: ' . $connection->connect_error);
}

        $sql = 'SELECT * FROM pharmacies ';
        $result = $connection->query($sql);

        while ($row = $result->fetch_assoc()) {
            
            $data[]=$row;
        } 
        echo json_encode($data);


// Close database connection
//$connection->close();
?>
