<?php
    $macd = $_POST['macd'];
    $conn = include 'connect.php';
    $sql = "delete from cn_tc where MaCongDan = '$macd'";
    $rs = $conn->query($sql);
    $sql = "delete from congdan where MaCongDan = '$macd'";
    $rs = $conn->query($sql);
    $conn->close();
?>