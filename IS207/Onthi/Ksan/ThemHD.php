<?php
    $makh = $_POST['MaKH'];
    $mahd = $_POST['MaHD'];
    $tien = $_POST['TongTien'];
    $tenhd = $_POST['TenHD'];

    $conn = include 'connect.php';
    $sql = "insert into hoadon (MaHD, TenHD, MaKH, TongTien) values ('$mahd', '$tenhd', '$makh', '$tien')";

    $rs = $conn->query($sql);
    $conn->close();
?>