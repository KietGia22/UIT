<?php
    $SOXE = $_POST['SOXE'];
    $MABD = $_POST['MABD'];
    $SOKM = $_POST['SOKM'];
    $NOIDUNG = $_POST['NOIDUNG'];
    $NGAYNHAN = date('Y-m-d'); 
    $conn = include 'connect.php';
    $sql = "insert into baoduong values('$MABD','$NGAYNHAN', NULL ,'$SOKM', '$NOIDUNG', '$SOXE', NULL)";
    $rs = $conn->query($sql);
    $conn->close();
?>