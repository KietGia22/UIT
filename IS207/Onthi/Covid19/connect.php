<?php
    $conn = new mysqli("localhost", "root", "", "covid19");
    if($conn->connect_error){
        echo "Failed";
    }
    return $conn;
?>