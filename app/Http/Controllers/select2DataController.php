<?php

namespace App\Http\Controllers;

use App\Models\Assets;
use App\Models\Campaigns;
use App\Models\Clients;
use App\Models\Departments;
use App\Models\Locations;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class select2DataController extends Controller
{
    public function downloadFile($table, $field, $id)
    {
        // dd($_GET);
        $table = Crypt::decrypt($table);
        // dd($table);
        $file = DB::table($table)->find($id);
        $str = str_replace(env('AWS_URL'),'',$file->{$field});
        $str_arr = explode('/',$str);
        $s = explode('.',$str_arr[2]);
        $headers = [
            'Content-Type' => 'application/'.$s[1],
            'Content-Disposition' => 'attachment; filename="'.$str_arr[2].'"',
        ];
        return \Response::make(Storage::disk('s3')->get($str), 200, $headers);
//        return response()->download(public_path('uploads/' . $file->{$field}));
    }


    public function getClients(Request $request)
    {
        if ($request->has('search')) {
            $data = Clients::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->get();
        } else {
            $data = Clients::select('id', 'name')->get();
        }
        return response()->json($data);
    }

    public function getDepartments(Request $request)
    {
        if ($request->has('search')) {
            $data = Departments::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->get();
        } else {
            $data = Departments::select('id', 'name')->get();
        }
        return response()->json($data);
    }

    public function getLocations(Request $request)
    {
        if ($request->has('search')) {
            $data = Locations::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->get();
        } else {
            $data = Locations::select('id', 'name')->get();
        }
        return response()->json($data);
    }

    public function getAssets(Request $request, $key = null)
    {
        if ($request->has('search')) {
            $data = Assets::select('id', 'name', 'ref_no')->where('name', 'like', '%' . $request->search . '%')/*->where('location',$key)*/ ->get();
        } else {
            $data = Assets::select('id', 'name', 'ref_no')/*->where('location',$key)*/ ->get();
        }
        return response()->json($data);
    }

    public function getCampaign(Request $request)
    {
        if ($request->has('search')) {
            $data = Campaigns::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->where('agency', 'like', '%' . $request->search . '%')->where('brand', 'like', '%' . $request->search . '%')->whereIn('status', ['Active', 'Live'])->get();
        } else {
            $data = Campaigns::select('id', 'name')->whereIn('status', ['Active', 'Live'])->get();
        }
        return response()->json($data);
    }

    public function getUser(Request $request)
    {
        if ($request->has('search')) {
            $data = User::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->where('status', 'Active')->get();
        } else {
            $data = User::select('id', 'name')->where('status', 'Active')->get();
        }
        return response()->json($data);
    }
}
