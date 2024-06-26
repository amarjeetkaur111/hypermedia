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
   Route::get('teams',[\App\Http\Controllers\select2DataController::class,'getTeam'])->name('get-teams');
   Route::get('teamUsers',[\App\Http\Controllers\select2DataController::class,'getTeamUser'])->name('get-teamUsers');
   Route::get('campaign_assets',[\App\Http\Controllers\select2DataController::class,'getCampaignAssets'])->name('get-campaign-asset');
   Route::get('assets_name',[\App\Http\Controllers\select2DataController::class,'getAssetsName'])->name('get-asset-name');
   Route::post('assets_namennetwork',[\App\Http\Controllers\select2DataController::class,'getAssetsNameNNetork'])->name('get-asset-namennetwork');
   Route::get('assets_nameref',[\App\Http\Controllers\select2DataController::class,'getAssetsNameRef'])->name('get-asset-nameref');
   Route::get('campaign_locations',[\App\Http\Controllers\select2DataController::class,'getCampaignLocations'])->name('get-campaign_locations');
});

Route::get('download-file/{table}/{field}/{id}',[\App\Http\Controllers\select2DataController::class,'downloadFile'])->name('download-file');
Route::get('/test', function () {
    return view('pages.campaign_months');
});
