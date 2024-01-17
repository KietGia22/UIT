<?php
    $conn = new mysqli("localhost", "root", "", "khachsan");
    if($conn->connect_error){
        die($conn->connect_error);
    }
    return $conn;
?>