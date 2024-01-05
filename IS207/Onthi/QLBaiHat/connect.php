<?php
    $conn = new mysqli("localhost", "root", "", "playlist");
    if ($conn->connect_error) {
        die("⛔️⛔️⛔️ CONNECTION FAILED!!! " . $conn->connect_error);
    }
    return $conn;
?>