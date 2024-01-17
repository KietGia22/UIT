<?php
/**
 * Developer: Loc Nguyen
 * Date: 7/2/2019
 */
// Thực hiện kết nối
$conn = mysqli_connect('localhost', 'root', '', 'ontap');

// Kiểm tra kết nối thành công hay thất bại
// nếu thất bại thì thông báo lỗi
if (!$conn) {
    die("Kết nối thất bại: " . mysqli_connect_error());
}

// Thông báo kết nối thành công
// Change character set to utf8
mysqli_set_charset($conn,"utf8");