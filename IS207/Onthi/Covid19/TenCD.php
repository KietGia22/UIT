<?php
    $madcl = $_GET['madcl'];
    $conn = include 'connect.php';
    $sql = "select MaCongDan, TenCongDan
            from congdan 
            where MaDiemCachLy = '$madcl'";
    $rs = $conn->query($sql);
    while($row = $rs->fetch_row()){
        echo "<option value='$row[0]'>$row[1]</option>";
    }
    $conn->close();
?>