<?php
    $conn = new mysqli("localhost", "root", "", "baoduong");
    if ($conn->connect_error) {
        die("⛔️⛔️⛔️ CONNECTION FAILED!!! " . $conn->connect_error);
    }
    return $conn;
?>