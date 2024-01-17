<?php
/**
 * Developer: Loc Nguyen
 * Date: 7/2/2019
 */
?>
<?php
require_once 'connectdb.php';
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cau 1</title>
</head>
<body>
    <form>
        <label>Ma khach</label>
        <input type="text" name="makhach" required><br/>
        <label>Ten khach</label>
        <input type="text" name="tenkhach" required><br/>
        <label>Dia chi</label>
        <input type="text" name="diachi" required><br/>
        <button type="submit" name="them">Them</button>
    </form>
<?php
    if (isset($_POST['them'])) {
        $ma = $_POST['makhach'];
        $ten = $_POST['tenkhach'];
        $diachi = $_POST['diachi'];

        $sql = "INSERT INTO  KHACHHANG VALUES ('$ma', '$ten', '$diachi')";

        // Thực hiện thêm record
        if (mysqli_query($conn, $sql)) {
            echo "Thêm khach hang thành công";
        } else {
            echo "Lỗi: " . $sql . "<br>" . mysqli_error($conn);
        }
    }
?>
</body>
</html>
