<?php
    $makh = $_POST['MaKH'];
    $tenkh = $_POST['TenKH'];
    $sdt = $_POST['SDT'];
    $cccd = $_POST['CCCD']; 
    $conn = include 'connect.php';
    $sql = "insert into khachhang (MaKH, TenKH, sdt, cccn) values ('$makh', '$tenkh', '$sdt', '$cccd')";
    $rs = $conn->query($sql);
    $conn->close();
?>