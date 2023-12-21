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
        <div class="container">
            <h2 style="font-weight: bold; font-size: 24px">Chỉnh Sửa Tin</h2>
            <br />
            <form action="{{ route('update', [
                'id' => $product->id,
            ]) }}"
                method="POST">
                @csrf
                @method('PUT')
                <div class="form-group">
                    <label for="txtProductName">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="txtProductName" name="productName"
                        value="{{ $product->ProductName }}">
                </div>
                <div class="form-group">
                    <label for="txtPrice">Giá bán</label>
                    <input type="text" class="form-control" id="txtPrice" name="salePrice"
                        value="{{ $product->SalePrice }}">
                </div>
                <div class="form-group">
                    <label for="txtCategory">Loại</label>
                    <input type="text" class="form-control" id="txtCategory" name="categoryName"
                        value="{{ $product->CategoryName }}">
                </div>
                <div class="form-group">
                    <label for="txtImageLink">Link hình ảnh</label>
                    <input type="text" class="form-control" id="txtImageLink" name="imageLink"
                        value="{{ $product->ImageLink }}">
                </div>
                <div class="form-group">
                    <label for="txtImageLink">Link sản phẩm</label>
                    <input type="text" class="form-control" id="txtProductLink" name="productLink"
                        value="{{ $product->ProductLink }}">
                </div>
                <div class="input-group-btn">
                    <button class="btn btn-danger" type="submit" style="font-size: 14px">Cập Nhật</button>
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
