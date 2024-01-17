<?php
    $sl = $_GET['sl'];
    $conn =  include 'connect.php';
    $sql = "select k.MaKH, TenKH, SUM(TongTien)
            from khachhang k, hoadon h
            where k.MaKH = h.MaKH
            group by k.MaKH, TenKH
            order by Sum(TongTien) desc
            limit $sl";
    $rs = $conn->query($sql);
    echo "<table border='1'><tr><th>STT</th><th>Ma khach hang</th><th>Ten khach hang</th><th>Tong tien thue</th></tr>";
    $i = 0;
    while($row = $rs->fetch_row()){
        $i += 1;
        echo "<tr><td>$i</td><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td></tr>";
    }
    echo "</table>";
?>