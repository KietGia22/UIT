<?php
/**
 * Developer: Loc Nguyen
 * Date: 7/2/2019
 */
require_once 'connectdb.php';
$ngay = $_POST['ngay']?:'';
$sql = "SELECT k.`tenkh`, d.`madh` FROM `khachhang` k, `donhang` d where d.`makh` = k.`makh` and d.`ngaydat` = '$ngay'";
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
        $res[$i]['tenkh'] = $row['tenkh'];
        $res[$i++]['madh'] = $row['madh'];
    }
}
echo json_encode($res);