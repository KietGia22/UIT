<?php
/**
 * Developer: Loc Nguyen
 * Date: 7/2/2019
 */
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cau 3</title>
</head>
<?php
require_once 'connectdb.php';
$sql = "select * from donhang";
$result = mysqli_query($conn, $sql);
?>
<body>
<table border="1">
    <tr>
        <td>STT</td>
        <td>MaDH</td>
        <td>TenDH</td>
        <td>Chuc nang</td>
    </tr>
    <?php
    if (mysqli_num_rows($result) > 0):
        $i = 1;
        while ($row = mysqli_fetch_array($result)) {
            echo "<tr>";
            echo "<td>" . $i++ . "</td>";
            echo "<td>" . $row['madh'] . "</td>";
            echo "<td>" . $row['tendh'] . "</td>";
            echo "<td><button onclick='del(this,".$row['madh'].")'>Xoa</button></td>";
            echo "</tr>";
        }
    endif;
    ?>
</table>
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    function del(obj, madh) {
        $.post('cau3_ajax.php', {madh: madh}, function (respon) {
            if (respon == 'success') {
                $(obj).parent().parent().remove();
                alert('Xoa thanh cong');
            } else {
                alert('Co loi xay ra');
            }
        });
    }
</script>
</html>
