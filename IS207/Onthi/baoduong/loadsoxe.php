<?php
    $ngnhan = $_GET['ngnhan'];
    $conn = include 'connect.php';
    $sql = "select * from baoduong where NGAYNHAN = '$ngnhan'";
    $rs = $conn->query($sql);
    while($row = $rs->fetch_row()){
        echo "<option value='$row[0]'>$row[5]<option>";
    }
    $conn->close();
?>