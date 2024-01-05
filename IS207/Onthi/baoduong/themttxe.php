<?php
    $makh = $_POST['MAKH'];
    $soxe = $_POST['SOXE'];
    $namsx = $_POST['NAMSX'];
    $hangxe = $_POST['HANGXE']; 

    $conn = include 'connect.php';
    $sql = "insert into xe values('$soxe', '$hangxe', '$namsx', '$makh')";
    $rs = $conn->query($sql);
    $conn->close();
?>