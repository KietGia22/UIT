<?php
	$MAKH = $_GET['MaKH'];  
    $conn = include "connect.php";
	$sql = "SELECT * FROM hopdong WHERE MAKH = '$MAKH'";
	$result = $conn->query($sql);
	while($row = $result->fetch_row())
	{
		echo "<option value='$row[0]'>$row[0]</option>";
    }
?>