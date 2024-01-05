<?php
    $sl = $_GET['soluong'];
    $conn = include 'connect.php';

    $sql = "select TENXE, count(*) 
            from xe x, cthd ct
            where x.MAXE = ct.MAXE
            group by TENXE
            order by count(*) desc limit $sl";
      echo "<table border='1'><tr><th>Tên xe</th><th>Số lần thuê</th></tr>";
    $rs = $conn->query($sql);
    while($row = $rs->fetch_row()){
        echo "<tr><td>$row[0]</td><td>$row[1]</td></tr>";
    }
    echo "</table";
?>