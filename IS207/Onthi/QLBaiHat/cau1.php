<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
</head>

<body>
    <form action="" method="GET">
        Ma bai hat <input type="text" name="MaBaiHat" />
        <br />
        Ten bai hat <input type="text" name="TenBaiHat" />
        <br />
        The loai <input type="text" name="TheLoai" />
        <br />
        <input type="submit" name="thembaihat" value="Them" />
    </form>

    <?php
      $conn = include 'connect.php';
      if(isset($_GET['thembaihat']) && ($_GET['thembaihat']) == "Them")
      {
        $MaBaiHat = $_GET['MaBaiHat'];
        $TenBaiHat = $_GET['TenBaiHat'];
        $TheLoai = $_GET['TheLoai'];
        $sql = "INSERT INTO baihat VALUES ('$MaBaiHat', '$TenBaiHat', '$TheLoai')";
        $result = $conn->query($sql); 
        if(!$result) { 
          echo "FAILED";
        } else { 
          echo "Success"; 
        } 
      }
      $conn->close(); 
      ?>
</body>

</html>