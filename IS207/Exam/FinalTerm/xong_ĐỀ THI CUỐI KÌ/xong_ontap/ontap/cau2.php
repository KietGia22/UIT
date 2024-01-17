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
    <title>Cau 2</title>
</head>
<body>
<label>Ngay: </label>
<input type="date" name="ngay" id="ngay" onchange="getDonDatHang(this)"><br/>
<h4>Danh sach hoa don</h4>
    <table border="1">
        <tr>
            <td>STT</td>
            <td>MADH</td>
            <td>Ten KH</td>
        </tr>
        <tbody class="result">
        </tbody>
    </table>
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    function getDonDatHang(obj) {
        $.post('cau2_ajax.php', {ngay: $(obj).val()}, function (respon) {
            console.log(respon);
            let data = JSON.parse(respon);
            $('.result').html('');
            data.forEach(function (e) {
                    let html =
                        "<tr>\n" +
                        "<td>" + e.stt + "</td>\n" +
                        "<td>" + e.madh + "</td>\n" +
                        "<td>" + e.tenkh + "</td>\n" +
                        "</tr>";
                    $('.result').append(html);
                }
            )
        })
    }
</script>
</html>
