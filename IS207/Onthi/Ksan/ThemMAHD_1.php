<?php
    $makh = $_GET['makh'];
    $conn = include 'connect.php';
    $sql = "select * from hoadon where MaKH = '$makh'";
    $rs = $conn->query($sql);
    while($row = $rs->fetch_row()){
        echo "<option value=".$row[0].">".$row[0]."</option>";
    }
?>