<form action="ThemHD.php" method="post">
    Ten khach hang <select name="MaKH" id="">
        <?php
        $conn = include 'connect.php';
        $sql = "select MaKH, TenKH from khachhang";
        $rs = $conn->query($sql);
        while($row = $rs->fetch_row()){
            echo "<option value='$row[0]'>$row[1]</option>";
        }
        $conn->close();
    ?>
    </select>
    <br>
    Ma hoa don <input type="text" name="MaHD" id="">
    <br>
    Ten hoa don <input type="text" name="TenHD" id="">
    <br>
    Tong tien <input type="text" name="TongTien" id="">
    <br>
    <input type="submit" value="Them">
</form>