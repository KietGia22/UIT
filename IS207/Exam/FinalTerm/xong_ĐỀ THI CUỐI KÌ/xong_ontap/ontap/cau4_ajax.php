<?php
/**
 * Developer: Loc Nguyen
 * Date: 7/2/2019
 */
require_once 'connectdb.php';
$makh = $_POST['makh']?:'';
$sql = "SELECT * from donhang where makh = '$makh'";
// Thực thi câu truy vấn và gán vào $result
$result = mysqli_query($conn, $sql);

$res = [];
// Kiểm tra số lượng record trả về có lơn hơn 0
// Nếu lớn hơn tức là có kết quả, ngược lại sẽ không có kết quả
if (mysqli_num_rows($result) > 0)
{
    $i = 0;
    // Sử dụng vòng lặp while để lặp kết quả
    while($row = mysqli_fetch_array($result)) {
        $res[$i]['stt'] = $i+1;
        $res[$i++]['tendh'] = $row['tendh'];
    }
}
echo json_encode($res);