<?php
    $soxe = $_GET['SOXE'];
    $conn = include 'connect.php';
    $sql = "select HOTENKH
            from khachhang k, xe x
            where k.MAKH = x.MAKH
            and SOXE = '$soxe'";
    $rs = $conn->query($sql);
    $row = $rs->fetch_row();
    $conn->close();
    echo $row[0];
?>