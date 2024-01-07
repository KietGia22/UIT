<?php 
    $conn = include 'connect.php';
    $mahd = $_POST['mahd'];
    $map = $_POST['map'];
    $sql = "update phong 
            set TinhTrang = 'trong'
            where MaPhong = '$map'";
    $rs = $conn->query($sql);

    $sql = "delete from thue
            where MaPhong = '$map'
            and MaHD = '$mahd'";
    $rs = $conn->query($sql);

    $conn->close();
?>