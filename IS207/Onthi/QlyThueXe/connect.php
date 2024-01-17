<?php
    $conn = new mysqli('localhost', 'root', '', 'qlythuexe');
    if ($conn->connect_error) {
        die("⛔️⛔️⛔️ CONNECTION FAILED!!! " . $conn->connect_error);
    }
    return $conn;
?>