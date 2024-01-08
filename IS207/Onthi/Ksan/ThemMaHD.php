<?php
    $conn = include 'connect.php';
    $sql = "select * from hoadon";
    $rs = $conn->query($sql);
    while($row = $rs->fetch_row()){
        echo "<option value=".$row[0].">".$row[0]."</option>";
    }
?>