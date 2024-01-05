<?php
    $conn = include "connect.php";
    $MaPlayList = $_POST['MaPlayList'];
    $sql="DELETE FROM PLAYLIST_BAIHAT WHERE MaPlayList = '$MaPlayList'";
    $conn->query($sql);
    $sql="DELETE FROM PLAYLIST WHERE MaPlayList = '$MaPlayList'";
    $conn->query($sql);
    $conn->close();
?>