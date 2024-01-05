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
            <th>Ten khach hang</th>
            <th>So lan thue xe</th>
        </tr>
        <?php
            $conn = include 'connect.php';
            $sql = "select HOTEN, count(*) 
                    from hopdong hd, khachhang kh
                    where hd.MAKH = kh.MAKH
                    group by HOTEN
                    order by count(*) DESC";
            $rs = $conn->query($sql);
            while($row = $rs->fetch_row()){
                echo "<tr><td>$row[0]</td><td>$row[1]</td></tr>";
            }
        ?>
    </table>
</body>

</html>