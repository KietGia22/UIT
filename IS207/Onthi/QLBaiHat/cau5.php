<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <table border="1">
        <tr>
            <th>STT</th>
            <th>Ten bai hat</th>
            <th>So lan xuat hien trong playlist</th>
        </tr>
        <?php
            $conn = include 'connect.php';
            $sql = "select TenBaiHat, count(*)
                    from baihat b, playlist_baihat ph
                    where b.MaBaiHat = ph.MaBaiHat
                    group by TenBaiHat
                    order by count(*) DESC";;
            $i = 1;
            $rs = $conn->query($sql);
            while($row = $rs->fetch_row())
            {
                Echo "<tr><td>$i</td><td>$row[0]</td><td>$row[1]</td></tr>";
                $i += 1;
            }
        ?>
    </table>
</body>

</html>