<?php
	$MAXE = $_POST['MAXE'];
	$MAHD = $_POST['MAHD'];
	$conn = include "connect.php";
	$sql = "DELETE FROM cthd WHERE MAXE = '$MAXE' AND MAHD = '$MAHD'";
	$rs = $conn->query($sql);
?>