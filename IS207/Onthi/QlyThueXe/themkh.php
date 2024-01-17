<?php
    $conn = include 'connect.php';
    $makh = $_POST['MAKH'];
    $tenkh = $_POST['HOTEN'];
    $dt = $_POST['SDT'];
    $sql = "insert into khachhang values ('$makh', '$tenkh', '$dt')";
    $rs = $conn->query($sql);
    if(!$rs)
        echo "Error";
    $conn->close();
?>