<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\registrationsModel;
use App\Models\sceneModel;
use Illuminate\Http\Request;

class dashboardController extends Controller
{
//    public function __construct()
//    {
//        $this->middleware(function($request,$next){
////            if()
//            return $next($request);
//        });
//    }


    public function index(){
        return view('pages.dashboard');
    }
}
