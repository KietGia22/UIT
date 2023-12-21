<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$dbname = 'raovat';

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("⛔️⛔️⛔️ CONNECTION FAILED!!! " . $conn->connect_error);
}
return $conn;