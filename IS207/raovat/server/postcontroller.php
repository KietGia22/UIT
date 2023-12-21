<?php
    session_start();
    include 'product.php';
    $method = $_SERVER['REQUEST_METHOD'];
    if ($_SERVER['REQUEST_METHOD']=='POST'){
        $action =$_POST['action'];
    }
    else {
        $action=$_GET['action'];
    }
    if ($action=='search') {
        $keyword = $_GET['keyword'];
        searchPost($keyword);
    }
    if ($action=='update') {
        $post= new Post();
        $post->id = $_POST['id'];
        $post->productName = $_POST['productName'];
        $post->salePrice = $_POST['salePrice'];
        $post->categoryName = $_POST['categoryName'];
        $post->imageLink = $_POST['imageLink'];
        $post->productLink = $_POST['productLink'];
        updatePost($post,$post->id);
    }
    if ($action=='create') {
        $post= new Post();
        $post->productName = $_POST['productName'];
        $post->salePrice = $_POST['salePrice'];
        $post->categoryName = $_POST['categoryName'];
        $post->imageLink = $_POST['imageLink'];
        $post->productLink = $_POST['productLink'];
        createPost($post);
    }
    if($action=='delete'){
        $post = new Post();
        $post->Id = $_GET['id'];
        deletePost($post->Id);
    }


    function searchPost($keyword){
        $servername="localhost";
        $username="root";
        $password="";
        $dbname="raovat";

        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql= "SELECT * FROM product WHERE ProductName LIKE '%$keyword%';";
    
        $result= $conn->query($sql);
        $_SESSION['search_results']=$result->fetch_all();

        $newURL= "http://localhost/raovat/server/index.php?isSearch=1";
        header('Location: ' .$newURL);

        $conn->close();    
    }

    function updatePost($post,$postId){
        $servername="localhost";
        $username="root";
        $password="";
        $dbname="raovat";

        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        
        if (!($post->productName==="")){
            $sql="UPDATE product SET ProductName='$post->productName' WHERE Id='$post->id'";
        }
        if (!($post->salePrice==="")){
            $sql="UPDATE product SET SalePrice='$post->salePrice' WHERE Id='$post->id'";
        }
        if (!($post->categoryName==="")){
            $sql="UPDATE product SET CategoryName='$post->categoryName' WHERE Id='$post->id'";
        }
        if (!($post->imageLink==="")){
            $sql="UPDATE product SET ImageLink='$post->imageLink' WHERE Id='$post->id'";
        }
        if (!($post->productLink==="")){
            $sql="UPDATE product SET ProductLink='$post->productLink' WHERE Id='$post->id'";
        }
        if ($conn->query($sql)===TRUE){
            echo"Record update successfully";
        }else{
            echo "Error updated record" . $conn->error;
        }
        header('Location: http://localhost/raovat/server/index.php');
        $conn->close();    
    }

    function createPost($post){
        $servername="localhost";
        $username="root";
        $password="";
        $dbname="raovat";

        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        
        $sql="INSERT INTO product (ProductName, SalePrice, CategoryName, ImageLink, ProductLink)
        VALUES ('$post->productName','$post->salePrice','$post->categoryName','$post->imageLink','$post->productLink')";

        if($conn->query($sql)=== TRUE){
            echo "New post has been created.";
        } else{
            echo "Error: ". $sql. "<br>" . $conn->error;
        }
        header('Location: http://localhost/raovat/server/index.php');
        $conn->close();
    } 

    function deletePost($postId){
        $servername="localhost";
        $username="root";
        $password="";
        $dbname="raovat";

        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql="DELETE FROM product WHERE id=$postId";
        if ($conn->query($sql)=== TRUE){
            header("location: ./managepost.php");
        } else {
            echo "Error" . $sql . "<br>" . $conn->error;
        }

        $conn->close();
    }

?>