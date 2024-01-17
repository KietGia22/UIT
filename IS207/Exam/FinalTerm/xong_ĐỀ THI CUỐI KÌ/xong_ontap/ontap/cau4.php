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
    <title>Document</title>
</head>
<?php
require_once 'connectdb.php';
$sql = "select * from khachhang";
$result = mysqli_query($conn, $sql);
?>
<body>
    <label>Ten khach hang: </label>
    <select onchange="getDonDatHang(this)">
        <option value="">--- chon khach hang ---</option>
        <?php
        if (mysqli_num_rows($result) > 0):
            while ($row = mysqli_fetch_array($result)) {
                echo "<option value='".$row['makh']."'>".$row['tenkh']."</option>";
            }
        endif;
        ?>
    </select><br/>
    <h4>Danh sach hoa don</h4>
    <table border="1">
        <tr>
            <td>STT</td>
            <td>Ten DH</td>
        </tr>
        <tbody class="result">
        </tbody>
    </table>
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    function getDonDatHang(obj) {
        $.post('cau4_ajax.php', {makh: $(obj).children("option:selected").val()}, function (respon) {
            let data = JSON.parse(respon);
            $('.result').html('');
            data.forEach(function (e) {
                    let html =
                        "<tr>\n" +
                        "<td>" + e.stt + "</td>\n" +
                        "<td>" + e.tendh + "</td>\n" +
                        "</tr>";
                    $('.result').append(html);
                }
            )
        })
    }
</script>
</html>
