<?php

use App\Http\Controllers\AlbumController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LastfmController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('index');
//});



Route::get('/albumSearch', [LastfmController::class, 'albumSearch'])->name('albumSearch');

Route::get('/albumGetInfo', [LastfmController::class, 'albumGetInfo'])->name('albumGetInfo');

Auth::routes();

Route::get('/', [HomeController::class, 'index'])->name('home');

Route::resource('albums', AlbumController::class);

//Для хостинга для создания линка ком артизан
//Route::get('/linkstorage', function () {
//    Artisan::call('storage:link');
//});
