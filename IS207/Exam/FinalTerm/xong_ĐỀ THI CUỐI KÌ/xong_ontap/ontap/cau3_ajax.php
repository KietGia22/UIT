<?php
/**
 * Developer: Loc Nguyen
 * Date: 7/2/2019
 */
require_once 'connectdb.php';
$madh = $_POST['madh']?:'';
$sql = "delete from donhang where madh = '$madh'";
// Thực thi câu truy vấn và gán vào $result
$res = 'error';
if (mysqli_query($conn, $sql)) {
    $res = 'success';
}
echo $res;