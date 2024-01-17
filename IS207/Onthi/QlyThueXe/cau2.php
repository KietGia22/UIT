<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form action="thuexe.php" method="POST">
        Ma hop dong <input type="text" name="MaHD">
        <br>
        Ten hop dong <input type="text" name="TenHD">
        <br>
        Ten khach hang <select name="MaKH" id="MaKH">
            <?php
                $conn = include 'connect.php';
                $sql = "select * from khachhang";
                $rs = $conn->query($sql);
                while($row = $rs->fetch_row()){
                    echo "<option value = '$row[0]'>$row[1]</option>";
                }
            ?>
        </select>
        <br>
        Ten xe <select name="MaXe[]" id="MaXe" multiple>
            <?php
                $conn = include 'connect.php';
                $sql = "select * from xe";
                $rs = $conn->query($sql);
                while($row = $rs->fetch_row()){
                    echo "<option value = '$row[0]'>$row[1]</option>";
                }
            ?>
        </select>
        <br>
        Số tiền <input type="text" name="TONGTIEN" />
        <br>
        <input type="submit" value="Thuê xe" />
    </form>
</body>

</html>