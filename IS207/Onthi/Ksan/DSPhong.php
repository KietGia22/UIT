<?php
    $mahd = $_GET['mahd'];
    $conn =  include 'connect.php';
    $sql = "select p.MaPhong, LoaiPhong 
            from thue t, phong p
            where p.MaPhong = t.MaPhong
            and t.MaHD = '$mahd'";
    $rs = $conn->query($sql);
    echo "<table border='1'><tr><th>STT</th><th>Ma Phong</th><th>Loai phong</th></tr>";
    $i = 0;
    while($row = $rs->fetch_row()){
        $i += 1;
        echo "<tr><td>$i</td><td>".$row[0]."</td><td>".$row[1]."</td></tr>";
    }
    echo "</table>";
    if (!$rs) {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
?>