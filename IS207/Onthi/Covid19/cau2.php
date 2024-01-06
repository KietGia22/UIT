<form action="ThemCD.php" method="post">
    Ma cong dan <input type="text" name="MaCD" id="">
    <br>
    Ten cong dan <input type="text" name="TenCD" id="">
    <br>
    Gioi tinh
    <input type="hidden" name="GioiTinh" value="0">
    <input type="checkbox" name="GioiTinh" value="1">
    <br>
    Nuoc ve <input type="text" name="NuocVe" id="">
    <br>
    Nam sinh <input type="date" name="NamSinh" id="">
    <br>
    Ten diem cach ly <select name="DiemCachLy" id="">
        <?php
            $conn = include 'connect.php';
            $sql = "select * from DIEMCACHLY";
            $rs = $conn->query($sql);
            while($row = $rs->fetch_row()){
                echo "<option value='$row[0]'>$row[1]</option>";
            }
        ?>
    </select>
    <br>
    <input type="submit" value="Them">
</form>