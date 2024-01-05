<?php
    $MABD = $_GET['MABD'];
    $conn = include 'connect.php';
    $sql = "select cv.MACV, TENCV, DONGIA
            from ct_bd ct, congviec cv 
            where ct.MACV = cv.MACV
            and MABD = '$MABD'";
    $rs = $conn->query($sql);
    echo "<table border='1'><tr><th>Ten cong viec</th><th>Don gia</th><th>Chuc nang</th></tr>";
    while($row = $rs->fetch_row()){
        echo "<tr><td>$row[1]</td><td class='DonGia'>$row[2]</td>";
        echo "<td><button type='button' class='xoa'>Delete</button><input type='hidden' class='MACV' value='$row[0]'></td></td><tr>"; 
    }
    echo "</table";
?>