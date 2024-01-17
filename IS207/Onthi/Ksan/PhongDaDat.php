<?php
    $mahd = $_GET['mahd'];
    $conn = include 'connect.php';
    $sql = "select * from phong p, thue t
            where t.MaPhong = p.MaPhong
            and t.MaHD = '$mahd'";
    $rs = $conn->query($sql);
    $i=0;
    echo "<table border='1'><tr><th>STT</th><th>Ma phong</th><th>Ten phong</th><th>Chuc nang</th></tr>";
    while($row = $rs->fetch_row()){
        $i += 1;
        echo "<tr><td>$i</td><td><input type='hidden' class='MaP' value='$row[0]'>".$row[0]."</td><td>".$row[1]."</td>";
        echo "<td><button class='xoa-thue'>Xoa</button></td></tr>";
    }
    echo "</table>"
?>