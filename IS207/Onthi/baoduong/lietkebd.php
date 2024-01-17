<?php
    $conn = include 'connect.php';
    $solanBD = $_GET['solanBD'];
    $sql = "select HOTENKH, b.SOXE, count(*)
            from khachhang kh, baoduong b, xe x
            where kh.MAKH = x.MAKH
            and b.SOXE = x.SOXE
            group by HOTENKH, b.SOXE
            having count(*) > $solanBD";
    $rs = $conn->query($sql);
    echo "<table border='1'><tr><th>Ho ten khach hang</th><th>So xe</th><th>so lan bao duong</th></tr>";
    while($row = $rs->fetch_row()){
        echo "<tr><td>$row[0]</td><td>$row[1]</td><td>$row[2]</td></tr>";
    }
    echo "</table>";
?>