<?php
    $MABD = $_POST['MABD'];
    $MACV = $_POST['MaCV'];
    $conn = include "connect.php";
    $sql = "DELETE FROM CT_BD WHERE MABD ='$MABD' AND MACV = '$MACV'";
    $rs = $conn->query($sql);
    $conn->close();
?>