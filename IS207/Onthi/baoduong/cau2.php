<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <b>Them thong tin xe khach hang</b>
    <form action="themttxe.php" method="POST">
        Ho ten khach hang <select name="MAKH" id="MAKH">
            <?php
                $conn = include 'connect.php';
                $sql = "select * from khachhang";
                $rs = $conn->query($sql);
                while($row = $rs->fetch_row()){
                    echo "<option value='$row[0]'>$row[1]</option>";
                }
            ?>
        </select>
        <br>
        So xe <input type="text" name="SOXE" id="SOXE">
        <br>
        Hãng xe <select name="HANGXE" id="HANGXE" multiple>
            <option value="Toyota">Toyota</option>
            <option value="BMW">BMW</option>
            <option value="Audi">Audi</option>
        </select>
        <br>
        Nam san xuat <input name="NAMSX" type="text" id="NAMSX">
        <br>
        <input type="submit" value="Them">
    </form>
</body>

</html>