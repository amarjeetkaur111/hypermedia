<?php

namespace App\Http\Controllers;

use App\Models\Assets;
use App\Models\Campaigns;
use App\Models\Clients;
use App\Models\Departments;
use App\Models\Locations;
use App\Models\TeamsModel;
use App\Models\TeamMembersModel;
use App\Models\CampaignBucket;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class select2DataController extends Controller
{
    public function downloadFile($table, $field, $id)
    {
        $table = Crypt::decrypt($table);
        $file = DB::table($table)->find($id);
        if($file){
            try{
                $str = str_replace(env('AWS_URL'),'',$file->{$field});
                $str_arr = explode('/',$str);
                $s = explode('.',$str_arr[2]);
                $headers = [
                    'Content-Type' => 'application/'.$s[1],
                    'Content-Disposition' => 'attachment; filename="'.$str_arr[2].'"',
                ];
                return \Response::make(Storage::disk('s3')->get($str), 200, $headers);
            }catch(\Exception $exception){
                return redirect()->back()->with(['status' => 'Error', 'msg' => 'File Not Found', 'class' => 'danger']);
            }
        }
        return redirect()->back()->with(['status' => 'Error', 'msg' => 'File Not Found', 'class' => 'danger']);
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

    public function getLocationsOld(Request $request)
    {
        if ($request->has('search')) {
            $data = Locations::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->get();
        } else {
            $data = Locations::select('id', 'name')->get();
        }
        return response()->json($data);
    }

    public function getLocationsOldd(Request $request)
    {
        if($request->department != 0)
        {
            $asset = Assets::select('location_id')->where('department_id',$request->department)->distinct()->get()->toArray();
            if ($request->has('search')) {
                $data = Locations::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->whereIn('id',$asset)->get();
            } else {
                $data = Locations::select('id', 'name')->whereIn('id',$asset)->get();
            }
        }
        else
        {
            if ($request->has('search')) {
                $data = Locations::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->get();
            } else {
                $data = Locations::select('id', 'name')->get();
            }
        }
        return response()->json($data);
    }

    public function getLocations(Request $request)
    {
        // echo"<pre>";print_r($request->all());exit();
        $locations = Locations::select('id', 'name');
        $asset = Assets::select('location_id');

        if($request->department != 0)        
            $asset = $asset->where('department_id',$request->department);      

        if($request->assettype != 0)       
            $asset = $asset->where('type',$request->assettype);

        if($request->assetname != 0)       
            $asset = $asset->where('name',$request->assetname);

        if($request->package_type != 0)
            $asset = $asset->where('package_type',$request->package_type);

        $asset = $asset->distinct()->get()->toArray();
        $locations =  $locations->whereIn('id',$asset);

        if ($request->has('search')) {
            $locations =  $locations->where('name', 'like', '%' . $request->search . '%');
        }

        $data = $locations->get();
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
            $data = Campaigns::select('id', 'name')->whereIn('status', ['Active', 'Live','Completed'])
            ->where(function($q) use($request){
                $q->where('name', 'like', '%' . $request->search . '%');
                $q->orWhere('agency', 'like', '%' . $request->search . '%');
                $q->orWhere('brand', 'like', '%' . $request->search . '%');
            })
           ->get();
        } else {
            $data = Campaigns::select('id', 'name')->whereIn('status', ['Active', 'Live','Completed'])->get();
        }
        return response()->json($data);
    }

    public function getTeam(Request $request)
    {
        if ($request->has('search')) {
            $data = TeamsModel::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->get();
        } else {
            $data = TeamsModel::select('id', 'name')->get();
        }
        return response()->json($data);
    }  

    public function getTeamUser(Request $request)
    {
        if($request->has('team'))
        {
            $members = User::select('id')->whereHas('team',function($q) use($request){
                $q->whereIn('team_id',$request->team);
            })->get()->toArray();

            $data = User::select('id', 'name')->whereNotIn('id',$members)->get();
        }
        else
        {
            $data = User::select('id', 'name')->where('status', 'Active')->get();
        }
        // if ($request->has('search')) {
        //     $data = User::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->where('status', 'Active')->get();
        // } else {
        //     $data = User::select('id', 'name')->where('status', 'Active')->get();
        // }
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

    public function getCampaignAssets(Request $request)
    {
        if($request->has('campaign_id') && $request->campaign_id !='')
        {
            $data = Assets::with('assetStatus');           

            if($request->has('location') && $request->location != '')
            // print_r($request->location);exit();
                $data = $data->where('location_id',$request->location);

            $cid = $request->campaign_id;
            if ($request->has('search')) {
                $data = $data            
                    ->whereHas('assetStatus',function($query) use($cid){
                        $query->where('campaign_id',$cid);
                    })      
                    ->select('id', 'name', 'ref_no')->where('name', 'like', '%' . $request->search . '%')/*->where('location',$key)*/ ->get();
            } else {
                $data = $data            
                    ->whereHas('assetStatus',function($query) use($cid){
                        $query->where('campaign_id',$cid);
                    })                    
                    ->select('id', 'name', 'ref_no')/*->where('location',$key)*/ ->get();
            }
        }
        else{
            $data = Assets::select('id', 'name', 'ref_no');
            if($request->has('location') && $request->locaion != '')
                $data = $data->where('location_id',$request->location);

            if ($request->has('search')) {
                $data = $data->where('name', 'like', '%' . $request->search . '%')/*->where('location',$key)*/ ->get();
            } else {
                $data = $data/*->where('location',$key)*/ ->get();
            }
        }
        
        return response()->json($data);
    }   
    
    public function getAssetsNameOld(Request $request)
    {
        // print_r($request->all());exit();
        $data = Assets::select('name')->distinct('name');
        if ($request->has('search')) {
            $data = $data->where('name', 'like', '%' . $request->search . '%');
        }
        if($request->has('department') && $request->department != 0)        {
            $did = $request->department;
            $data = $data->where('department_id', $did);
        }
        if($request->has('location') && $request->location != 0)        {
            $lid = $request->location;
            $data = $data->where('location_id', $lid);
        }
        if($request->has('assettype') && $request->assettype != 0)        {
            $assettype = $request->assettype;
            $data = $data->where('type', $assettype);
        }

        $data = $data->get();
        return response()->json($data);
    } 
    
    public function getAssetsName(Request $request)
    {
        // print_r($request->all());exit();
        $assets = Assets::select('name')->distinct('name');

        if($request->has('department') && $request->department != 0)        {
            $did = $request->department;
            $assets = $assets->where('department_id', $did);
        }
        // if($request->has('location') && $request->location != 0)        {
        //     $lid = $request->location;
        //     $assets = $assets->where('location_id', $lid);
        // }
        if($request->has('assettype') && $request->assettype != 0)        {
            $assettype = $request->assettype;
            $assets = $assets->where('type', $assettype);
        }
        if($request->package_type != 0)
        {
            $assets = $assets->where('package_type', $request->package_type);
        }
        if ($request->has('search')) {
            $assets = $assets->where('name', 'like', '%' . $request->search . '%');
        }

        $data = $assets->get();
        return response()->json($data);
    } 

    public function getAssetsNameRef(Request $request)
    {
        $data = Assets::select('id','name','ref_no');
        // echo "<pre>";print_r($request->all());exit();
        if ($request->has('search')) {
            $data = $data->where('name', 'like', '%' . $request->search . '%');
        }
        if($request->has('department') && $request->department != 0)        {
            $did = $request->department;
            $data = $data->where('department_id', $did);
        }
        if($request->has('location') && $request->location != 0)        {
            $lid = $request->location;
            $data = $data->where('location_id', $lid);
        }
        if($request->has('assettype') && $request->assettype != 0)        {
            $assettype = $request->assettype;
            $data = $data->where('type', $assettype);
        }
        if($request->has('name') && $request->name != 0)        {
            $name = $request->name;
            $data = $data->where('name', $name);
        }

        $data = $data->get();
        return response()->json($data);
    }   

    // public function getAssetsNameNNetork(Request $request,$select=[])
    // {
    //     // echo "<pre>";print_r('asdfasdf');exit();

    //     $assets = \App\Models\Assets::select('id', 'name', 'ref_no')->get();
    //     $networks = \App\Models\AssetNetwork::select('id', 'name')->get();
    //     $options = '<option selected disabled>Select Asset</option>';
    //     if ($networks->count()) {
    //         $options .= '<optgroup label="Networks">';
    //         foreach ($networks as $n) {
    //             if (count($select) && $select[0] == 'network') {
    //                 $options .= '<option value="network:' . $n->id . '" '.($n->id == $select[1] ? 'selected="selected"' : '') . ' >' . $n->name . '</option>';
    //             } else {
    //                 $options .= '<option value="network:' . $n->id . '">' . $n->name . '</option>';
    //             }
    //         }
    //         $options .= '</optgroup>';
    //     }
    //     // if ($assets->count()) {
    //     //     $options .= '<optgroup label="Assets">';
    //     //     foreach ($assets as $a) {
    //     //         if (count($select) && $select[0] == 'asset') {
    //     //             $options .= '<option value="asset:' . $a->id . '" '.($a->id == $select[1] ? 'selected="selected"' : '') . ' >' . $a->name .' : ' . $a->ref_no . '</option>';
    //     //         } else {
    //     //             $options .= '<option value="asset:' . $a->id . '">' . $a->ref_no . ' : ' . $a->name .' : ' . $a->ref_no . '</option>';
    //     //         }
    //     //     }
    //     //     $options .= '</optgroup>';
    //     // }
    //     return $options;
    // }  

    public function getAssetsNameNNetork(Request $request,$select=[])
    {
        // echo "<pre>";print_r($request->all());exit();

        return getAssetAndNetworkNew($request->name,$request->department,$request->location,$request->assettype,$request->package_type,$request->startdate,$request->enddate);
    }  


    public function getCampaignLocations(Request $request)
    {
        if($request->campaign != 0)
        {
            $location = CampaignBucket::select('location')->where('campaign_id',$request->campaign)->distinct()->get()->toArray();
            if ($request->has('search')) {
                $data = Locations::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->whereIn('id',$location)->get();
            } else {
                $data = Locations::select('id', 'name')->whereIn('id',$location)->get();
            }
        }
        else
        {
            $location = CampaignBucket::select('location')->distinct()->get()->toArray();
            if ($request->has('search')) {
                $data = Locations::select('id', 'name')->where('name', 'like', '%' . $request->search . '%')->whereIn('id',$location)->get();
            } else {
                $data = Locations::select('id', 'name')->whereIn('id',$location)->get();
            }
        }
        return response()->json($data);
    }

}

