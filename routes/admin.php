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

Route::group(['middleware' => 'auth', 'namespace' => 'admin', 'as' => 'admin-', 'prefix' => 'admin'], function () {
    Route::get('/', [\App\Http\Controllers\admin\dashboardController::class, 'index'])->name('index');
    Route::group(['as' => 'users-', 'prefix' => 'users'], function () {
        Route::get('/', [\App\Http\Controllers\admin\usersController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\usersController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\usersController::class, 'addPost'])->name('add');
    });
    //roles
    Route::group(['as' => 'roles-', 'prefix' => 'roles'], function () {
        Route::get('/', [\App\Http\Controllers\admin\roleController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\roleController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\roleController::class, 'addPost'])->name('add');
    });
    //permissions
    Route::group(['as' => 'permissions-', 'prefix' => 'permissions'], function () {
        Route::get('/', [\App\Http\Controllers\admin\permissionController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\permissionController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\permissionController::class, 'addPost'])->name('add');
    });

    //clients
    Route::group(['as' => 'clients-', 'prefix' => 'clients'], function () {
        Route::get('/', [\App\Http\Controllers\admin\clientsController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\clientsController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\clientsController::class, 'addPost'])->name('add');
    });
    //locations
    Route::group(['as' => 'locations-', 'prefix' => 'locations'], function () {
        Route::get('/', [\App\Http\Controllers\admin\locationsController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\locationsController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\locationsController::class, 'addPost'])->name('add');
    });
    //contractor
    Route::group(['as' => 'contractor-', 'prefix' => 'contractor'], function () {
        Route::get('/', [\App\Http\Controllers\admin\contractorController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\contractorController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\contractorController::class, 'addPost'])->name('add');
    });
    //department
    Route::group(['as' => 'departments-', 'prefix' => 'departments'], function () {
        Route::get('/', [\App\Http\Controllers\admin\departmentController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\departmentController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\departmentController::class, 'addPost'])->name('add');
    });
    //assets
    Route::group(['as' => 'assets-', 'prefix' => 'assets'], function () {
        Route::get('/availability-helper', [\App\Http\Controllers\admin\assetsController::class, 'availabilityCheck'])->name('availability-helper');
        Route::post('/availability-helper-post/{id?}', [\App\Http\Controllers\admin\assetsController::class, 'availabilityCheckPost'])->name('availability-helper-post');
        Route::get('/', [\App\Http\Controllers\admin\assetsController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\assetsController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\assetsController::class, 'addPost'])->name('add');
    });
    //digital-photos
    Route::group(['as' => 'campaign-monitoring-', 'prefix' => 'campaign-monitoring'], function () {
        Route::get('/', [\App\Http\Controllers\admin\DigitalPhotosController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\DigitalPhotosController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\DigitalPhotosController::class, 'addPost'])->name('add');
    });
    //defect-photos
    Route::group(['as' => 'defect-tracking-', 'prefix' => 'defect-tracking'], function () {
        Route::get('/', [\App\Http\Controllers\admin\DefectTrackingController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\DefectTrackingController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\DefectTrackingController::class, 'addPost'])->name('add');
    });
    //assets network
    Route::group(['as' => 'assets-network-', 'prefix' => 'assets-network'], function () {
        Route::get('/', [\App\Http\Controllers\admin\assetsNetworkController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\assetsNetworkController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\assetsNetworkController::class, 'addPost'])->name('add');
        Route::get('/add-assets/{id?}', [\App\Http\Controllers\admin\assetsNetworkController::class, 'addAssets'])->name('add-assets');
        Route::post('/add-assets/{id?}', [\App\Http\Controllers\admin\assetsNetworkController::class, 'addAssetsPost'])->name('add-assets');
        Route::get('/remove-asset/{id}/{asset_id}', [\App\Http\Controllers\admin\assetsNetworkController::class, 'removeAsset'])->name('remove-asset');
    });
    //campaign
    Route::group(['as' => 'campaign-', 'prefix' => 'campaign'], function () {
        Route::get('/', [\App\Http\Controllers\admin\campaignController::class, 'index'])->name('index');
        Route::get('/add/{id?}', [\App\Http\Controllers\admin\campaignController::class, 'add'])->name('add');
        Route::post('/add/{id?}', [\App\Http\Controllers\admin\campaignController::class, 'addPost'])->name('add');
        Route::post('/change-status/{id?}', [\App\Http\Controllers\admin\campaignController::class, 'changeStatus'])->name('change-status');
        Route::get('/campaign-photos/{id?}', [\App\Http\Controllers\admin\campaignController::class, 'getCampaignPhotos'])->name('campaign-photos');
        Route::get('/campaign-permits/{id?}', [\App\Http\Controllers\admin\campaignController::class, 'getCampaignPermits'])->name('campaign-permits');
        Route::post('/campaign-permits-add/{id?}', [\App\Http\Controllers\admin\campaignController::class, 'getCampaignPermitsAdd'])->name('campaign-permits-add');
//        Route::post('/change-campaign-status/{id?}', [\App\Http\Controllers\admin\campaignController::class, 'changeCampaignStatus'])->name('change-campaign-status');
        Route::get('/assign/{id?}', [\App\Http\Controllers\admin\campaignController::class, 'assignCampaign'])->name('assign');
        Route::post('/assign-post/{id?}', [\App\Http\Controllers\admin\campaignController::class, 'assignCampaignPost'])->name('assign-post');
        Route::group(['as' => 'bucket-', 'prefix' => 'bucket'], function () {
            Route::get('/{id}', [\App\Http\Controllers\admin\campaignBucketController::class, 'index'])->name('index');
            Route::get('/add/{campaign_id}/{id?}', [\App\Http\Controllers\admin\campaignBucketController::class, 'add'])->name('add');
            Route::post('/add/{campaign_id}/{id?}', [\App\Http\Controllers\admin\campaignBucketController::class, 'addPost'])->name('add');
            Route::post('/get-asset-data',[\App\Http\Controllers\admin\campaignBucketController::class,'getAssetData'])->name('get-asset-data');
        });
    });


});
