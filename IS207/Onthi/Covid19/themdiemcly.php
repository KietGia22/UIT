<?php
    $madcl = $_POST['MaDCL'];
    $tendcl = $_POST['TenDCL'];
    $diachi = $_POST['DiaChi'];
    $succhua = $_POST['SucChua'];
    $conn = include 'connect.php';
    $sql = "insert into diemcachly values ('$madcl', '$tendcl', '$diachi', '$succhua')";
    $rs = $conn->query($sql);
    $conn->close();
?>