@extends('layouts.app')
@section('css')
    <!-- Bootstrap -->
    <link rel="stylesheet" href=" {{ asset('./resources/css/bootstrap.min.css') }}">
    <!-- FontAwsome -->
    <link rel="stylesheet" href=" {{ asset('./resources/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
@endsection
@section('content')
    <div id="main">
        <div class="container" id="txtStatus">
            <h2 style="font-weight: bold; font-size: 24px">Đăng tin miễn phí</h2>
            <br />
            <form action="{{ route('store') }}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="txtProductName">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="txtProductName" name="ProductName"
                        placeholder="Iphone 6 like new 99%">
                </div>
                <div class="form-group">
                    <label for="txtPrice">Giá bán</label>
                    <input type="text" class="form-control" id="txtPrice" name="SalePrice" placeholder="8000000">
                </div>
                <div class="form-group">
                    <label for="txtCategory">Loại</label>
                    <input type="text" class="form-control" id="txtCategory" name="CategoryName"
                        placeholder="Camera,Phone,...">
                </div>
                <div class="form-group">
                    <label for="txtImageLink">Link hình ảnh</label>
                    <input type="text" class="form-control" id="txtImageLink" name="ImageLink"
                        placeholder="http://static.lazada.vn/p/image-33784-1-product.jpg">
                </div>
                <div class="form-group">
                    <label for="txtImageLink">Link sản phẩm</label>
                    <input type="text" class="form-control" id="txtProductLink" name="ProductLink"
                        placeholder="http://lazada.vn/product/iphone-8.html">
                </div>
                <div class="input-group-btn">
                    <button class="btn btn-danger" type="submit" style="font-size: 14px">Đăng tin</button>
                </div>

            </form>
            <br />
        </div>
    </div>

    <!-- Footer -->
    <div id="footer">
        <div class="container">
            <p>All rights reserved by RaoVat.Com</p>
        </div>
    </div>
@endsection
