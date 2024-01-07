<?php 
    $conn = include 'connect.php';
    $mahd = $_POST['mahd'];
    $map = $_POST['map'];
    $sql = "update phong 
            set TinhTrang = 'thue'
            where MaPhong = '$map'";
    $rs = $conn->query($sql);

    $ngaythue = date('Y-m-d');
    $sql = "insert into thue (MaHD, MaPhong, NgayThue, NgayTra, GiaThue) values ('$mahd', '$map', '$ngaythue', NULL, NULL)";
    $rs = $conn->query($sql);

    $conn->close();
?>