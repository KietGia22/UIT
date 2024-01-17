<?php
    $conn = include 'connect.php';
    $macd = $_GET['macd'];
    $sql = "select t.MaTrieuChung, TenTrieuChung
            from trieuchung t, cn_tc
            where cn_tc.MaTrieuChung = t.MaTrieuChung
            and cn_tc.MaCongDan = '$macd'";
    $rs = $conn->query($sql);
    $i = 0;
    echo "<table border='1'><tr><th>STT</th><th>Ma trieu chung</th><th>Ten trieu chung</th></tr>";
    while($row = $rs->fetch_row()){
        $i += 1;
        echo "<tr><td>$i</td><td>$row[0]</td><td>$row[1]</td></tr>";
    }
    echo "</table>";
?>