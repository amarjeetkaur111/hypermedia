<?php

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

Route::get('/', function () {
    return redirect('/login');
});

//Route::get('/', function () {
//    return view('pages.dashboard');
//});

Route::get('/login', function () {
    return view('auth.login');
})->middleware('guest');

Route::post('/login', [\App\Http\Controllers\authController::class, 'login'])->name('login');

Route::get('/logout', [\App\Http\Controllers\authController::class, 'logout'])->middleware('auth')->name('logout');

Route::group(['as' => 'select-2-','prefix' => 'select-2'],function(){
   Route::get('clients',[\App\Http\Controllers\select2DataController::class,'getClients'])->name('get-clients');
   Route::get('departments',[\App\Http\Controllers\select2DataController::class,'getDepartments'])->name('get-departments');
   Route::get('locations',[\App\Http\Controllers\select2DataController::class,'getLocations'])->name('get-locations');
   Route::get('assets',[\App\Http\Controllers\select2DataController::class,'getAssets'])->name('get-assets');
   Route::get('campaigns',[\App\Http\Controllers\select2DataController::class,'getCampaign'])->name('get-campaigns');
   Route::get('users',[\App\Http\Controllers\select2DataController::class,'getUser'])->name('get-users');
});
