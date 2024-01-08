<?php
    $conn = include 'connect.php';
    $sql = "select * from khachhang";
    $rs = $conn->query($sql);
    while($row = $rs->fetch_row()){
        echo "<option value=".$row[0].">".$row[1]."</option>";
    }
?>