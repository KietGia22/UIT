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
            <th>Ten ca si</th>
        </tr>
        <?php
            $conn = include 'connect.php';
            $sql = "Select TenCaSi 
                    From casi c
                    where not exists (select * from baihat b
                    where not exists (select * from casi_baihat cb
                    where c.MaCaSi = cb.MaCaSi
                    and cb.MaBaiHat = b.MaBaiHat))";
            $rs = $conn->query($sql);
            $i = 1;
            while($row = $rs->fetch_row()){
                Echo "<tr><td>$i</td><td>$row[0]</td></tr>";
                $i = $i + 1;
            }
        ?>
    </table>
</body>

</html>