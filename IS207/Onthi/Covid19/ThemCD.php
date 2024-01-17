<?php
    $macd = $_POST['MaCD'];
    $tencd = $_POST['TenCD'];
    $gioitinh = $_POST['GioiTinh'];
    $namsinh = $_POST['NamSinh'];
    $diemcl = $_POST['DiemCachLy'];
    $nuocve = $_POST['NuocVe'];

    $conn = include 'connect.php';
    $sql = "insert into congdan values ('$macd', '$tencd', '$gioitinh', '$namsinh', '$nuocve', '$diemcl')";
    $rs = $conn->query($sql);
    
    $conn->close();
?>