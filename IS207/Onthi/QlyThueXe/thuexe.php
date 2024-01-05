<?php
    $mahd = $_POST['MaHD'];
    $tenhd = $_POST['TenHD'];
    $makh = $_POST['MaKH'];
    $maxe = $_POST['MaXe'];
    $tongtien = $_POST['TONGTIEN'];
    $NGAYLAP = date('Y-m-d');

    $conn = include 'connect.php';
    $sql = "insert into hopdong values ('$mahd', '$tenhd', '$NGAYLAP', '$makh', '$tongtien')";
    $conn->query($sql);
    foreach($maxe as $item){
        $sql1 = "insert into cthd values ('$mahd', '$item')";
        $conn->query($sql1);
    }
    $conn->close()
?>