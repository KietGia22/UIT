<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <b>Them khach hang</b>
    <form action="" method="POST">
        Ma khach hang <input type="text" name="MAKH" id="">
        <br>
        Ten khach hang <input type="text" name="TENKH" id="">
        <br>
        Dia chi <input type="text" name="DIACHI" id="">
        <br>
        Dien thoai <input type="text" name="SDT" id="">
        <br>
        <input type="submit" name="Them" value="Them">
        <br>
    </form>
    <?php
        $conn = include 'connect.php';
        if(isset($_POST['Them']) && ($_POST['Them'] == 'Them')){
            $makh = $_POST['MAKH'];
            $tenkh = $_POST['TENKH'];
            $dc = $_POST['DIACHI'];
            $sdt = $_POST['SDT'];
            $sql = "insert into khachhang values ('$makh', '$tenkh', '$dc', '$sdt')";
            $rs = $conn->query($sql);
        }
        $conn->close();
    ?>
</body>

</html>