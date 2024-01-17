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
$sql = "select h.mahh, h.tenhh, count(h.mahh) AS soluongban from chitietdonhang d, hanghoa h where d.mahh = h.mahh group by h.mahh LIMIT 10";
$result = mysqli_query($conn, $sql);
?>
<body>
<table border="1">
    <tr>
        <td>STT</td>
        <td>Ten mat hang</td>
        <td>So luong ban</td>
    </tr>
    <?php
    if (mysqli_num_rows($result) > 0):
        $i = 1;
        while ($row = mysqli_fetch_array($result)) {
            echo "<tr>";
            echo "<td>" . $i++ . "</td>";
            echo "<td>" . $row['tenhh'] . "</td>";
            echo "<td>" . $row['soluongban'] . "</td>";
            echo "</tr>";
        }
    endif;
    ?>
</table>
</body>
</html>
