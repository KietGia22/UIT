<?php

namespace App\Http\Controllers;

use App\Models\Product;

use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $allProduct = Product::all();
        // dd($allProduct);
        return view('products.indexProduct', [
            'allProduct' => $allProduct
        ]);
    }

    public function manage()
    {
        $allProduct = Product::all();
        return view('products.manageProduct', [
            'allProduct' => $allProduct
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('products.createProduct');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request->all());
        Product::create([
            'ProductName' => $request->ProductName,
            'SalePrice' => $request->SalePrice,
            'CategoryName' => $request->CategoryName,
            'ImageLink' => $request->ImageLink,
            'ProductLink' => $request->ProductLink,
        ]);
        return redirect()->route('manage');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    public function search(Request $request)
    {
        // dd($request->all());
        $keyword = $request->keyword;
        $allProduct = Product::where('ProductName', 'like', '%' . $keyword . '%')->get();
        return view('products.indexProduct', [
            'allProduct' => $allProduct
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        // dd($id);
        $product = Product::find($id);
        return view('products.editProduct', [
            'product' => $product
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        // dd($request->all());
        Product::where('id', $id)
            ->update([
                'ProductName' => $request->productName,
                'SalePrice' => $request->salePrice,
                'CategoryName' => $request->categoryName,
                'ImageLink' => $request->imageLink,
                'ProductLink' => $request->productLink,
            ]);
        return redirect()->route('manage');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product = Product::find($id);
        $product->delete();
        return redirect()->route('manage');
    }
}