<?php

use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
// auth routes defined by laravel


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\ProductController::class, 'index'])->name('index');

Route::prefix('/product')->group(function () {
    Route::post('/search', [ProductController::class, 'search'])->name('search');
});

// guard
Route::group([
    'middleware' => 'auth',
    'prefix' => 'product'
], function () {
    Route::get('/create', [ProductController::class, 'create'])->name('create');
    Route::post('/store', [ProductController::class, 'store'])->name('store');
    Route::get('/edit/{id}', [ProductController::class, 'edit'])->name('edit');
    Route::put('/update/{id}', [ProductController::class, 'update'])->name('update');
    Route::get('/manage', [ProductController::class, 'manage'])->name('manage');
    Route::delete('/delete/{id}', [ProductController::class, 'destroy'])->name('delete');
});