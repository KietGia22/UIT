<?php
    $conn = include 'connect.php';
    $MABD = $_POST['MABD'];
    $NGAYTRA = date('Y-m-d');
    $THANHTIEN = $_POST['THANHTIEN'];
    $sql = "UPDATE BAODUONG SET NGAYTRA = '$NGAYTRA', THANHTIEN = '$THANHTIEN' WHERE MABD = '$MABD'";
    $rs = $conn->query($sql)
?>