<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\AssetInNetwork;
use App\Models\AssetNetwork;
use App\Models\Assets;
use App\Models\AssetStatus;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;

class assetsController extends Controller
{
    public function index(Request $request)
    {
        if($request->ajax()){
            $data = Assets::with('location')->select('*');
            if ($request->has('packagetype') && $request->packagetype) {
                $data = $data->where('package_type', '>=', $request->packagetype);
            }
            if ($request->has('assettype') && $request->assettype) {
                $data = $data->where('type', $request->assettype);
            }
            if ($request->has('locations_id') && $request->locations_id) {
                $data = $data->where('location_id', $request->locations_id);
            }
            if ($request->has('owned_by') && $request->owned_by) {
                $data = $data->where('owned_by', $request->owned_by);
            }
            if ($request->has('status') && $request->status) {
                $data = $data->where('status', $request->status);
            }
            if ($request->has('slot') && $request->slot) {
                $data = $data->where('slots', $request->slot);
            }

            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $btn = '<a href="'.route('admin-assets-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>';
                    return $btn;
                })
                ->addColumn('asset_photo',function($row){
                    return '<a class="img_click" href="' . $row->asset_photo . '">
                                <img src="' . $row->asset_photo . '"  href="' . $row->asset_photo . '" alt="" height=35 />
                            </a>';
                })
                ->addColumn('location',function($row){
                    $location = ($row->location->name) ?? 'NA';
                    return $location;
                })
                ->addColumn('installation_time',function($row){
                    return getFormattedTimeHuman($row->installation_time);
                })
                ->rawColumns(['action','asset_photo','location','installation_time'])
                ->make(true);
        }
        return view('pages.assets.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-assets-add');
        $add = 'Add';
        if ($id) {
            $data = Assets::with('network','department')->find($id);
            $action = route('admin-assets-add', ['id' => $id]);
            $add = 'Edit';
        }
        $networks = AssetNetwork::where('status','Active')->get()->pluck('name','id');
        return view('pages.assets.add', compact('data', 'action', 'add','networks'));
    }

    public function addPost(Request $request, $id = null)
    {

        $add = 'Add';
        $user = new Assets;
        if ($id) {
            $add = 'Edit';
            $user = Assets::find($id);
        }
        if ($id) {
            $this->validate($request, [
                'ref_no' => 'required|unique:assets,ref_no,' . $id.'id',
                'name' => 'required',
                'department_id' => 'required',
                'location' => 'required',
                'package_type' => 'required',
                'slots' => ['required_if:package_type,==,package'],
                'no_of_assets' => ['required_if:package_type,==,package'],
            ]);
        } else {
            $this->validate($request, [
                'ref_no' => 'required|unique:assets,ref_no',
                'name' => 'required',
                'department_id' => 'required',
                'location' => 'required',
                'package_type' => 'required',
                'slots' => ['required_if:package_type,==,package'],
                'no_of_assets' => ['required_if:package_type,==,package'],
            ]);
        }
        // echo "<pre>";print_r($request->all());exit();

        $user->ref_no = $request->input('ref_no');
        $user->name = $request->input('name');
        $user->department_id = $request->input('department_id');
        $user->location_id = $request->input('location');
        $user->owned_by = $request->input('owner_id');
        $user->description = $request->input('description');
        $user->type = $request->input('type');

        $user->package_type = $request->input('package_type');
        $user->slots = $request->input('slots');
        $user->no_of_assets = $request->input('no_of_assets');

        $user->status = $request->input('status');
        if ($request->hasFile('asset_photo')) {
            $filename = $request->file('asset_photo')->getClientOriginalName();
            $path = Storage::disk('s3')->putFileAs('asset_photo',$request->asset_photo,$filename ,'public');
            $user->asset_photo = config('filesystems.disks.s3.url').'/'.$path;
//            $file = request()->file('asset_photo');
//            $name = $file->storeAs('asset_photo', $request->input('ref_no').'-'.$request->input('name').now()->format('d-m-Y-H-i-s') ,['disk' => 'my_files']);
//            $user->asset_photo = $name;
        }
        $diff = explode(' ',$request->installation_time);
        $time = explode(':',$diff[1]);
        $user->installation_time = now()->diffInSeconds(now()->addDays($diff[0])->addHours($time[0])->addMinutes($time[1]));
        $user->save();
        if(!$id){
            changeAssetStatus($user->id,'Available');
        }
        if($request->has('network') && ( !($user->network) || ($user->network->id != $request->network))){
            AssetInNetwork::where('asset_id',$user->id)->delete();
            $new = new AssetInNetwork;
            $new->network_id = $request->network;
            $new->asset_id = $user->id;
            // $new->from_date = null;
            // $new->to_date = null;
            $new->save();
        }
        if(!$id){
            $state = new AssetStatus;
            $state->asset_id = $user->id;
            $state->campaign_id = null;
            $state->from_date = now();
            $state->to_date = null;
            $state->comment = 'New';
            $state->status = 'Available';
            $state->save();
        }

        return redirect()->route('admin-assets-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }

    public function availabilityCheck(){
        $asset = Assets::with('assetStatus')->get();
        return view('pages.assets.inner.availability',compact('asset'))->render();
    }

    public function availabilityCheckPost($id){
        $asset = Assets::with('assetStatus')->find($id);
        return view('pages.assets.inner.availability-table',compact('asset'))->render();
    }

    public function availabilityCheckNew(){
        return view('pages.assets.inner.availabilityNew');
    }

    public function availabilityCheckPostNew(Request $request){
        // echo "<pre>";print_r($request->all());exit();
        $startdate = $request->startdate;
        $enddate = $request->enddate;
        $department = $request->department;
        $location = $request->location;
        $name = $request->name;
        $ref_no = $request->ref_no;
        $assettype = $request->assettype;

        $asset = Assets::with('multiAssetStatus.campaign');

     
        if($ref_no != 0)        
            $asset  = $asset->where('id',$ref_no);
        if($name != 0)
            $asset  = $asset->where('name',$name);
        if($assettype != 0)
            $asset  = $asset->where('type',$assettype);    
        if($department != 0)
            $asset  = $asset->where('department_id',$department);
        if($location != 0)
            $asset  = $asset->where('location_id',$location);  

        $asset=array_values($asset->get()->toArray());
        echo "<pre>";print_r($asset);exit();

        $startdate = Carbon::createFromFormat('d/m/Y', $startdate)->format('Y-m-d');
        $enddate = Carbon::createFromFormat('d/m/Y', $enddate)->format('Y-m-d');
        
        for($i = 0;$i < count($asset);$i++)
        {
            if($asset[$i]['asset_status']) 
            {              
                $status = $asset[$i]['asset_status'];
                $from_date = $asset[$i]['asset_status']['from_date'];
                $to_date = $asset[$i]['asset_status']['to_date'];
                if(($from_date >= $startdate && $from_date <= $enddate)|| ($to_date >= $startdate && $to_date <= $enddate) || ($from_date <= $startdate && $to_date >= $enddate))
                {
                    // echo $startdate." DC is greator </br>";  
                    $asset[$i]['asset_status']['status'] = 'Booked';                  
                }else{        
                    // echo $to_date." DB is greator </br>";  
                    $asset[$i]['asset_status']['status'] = 'Available';
                }
            }
            else{
                $asset[$i]['asset_status']['status'] = 'Available';
            }
           
        }
        // echo "<pre>";print_r($asset); 
        // exit();

        return view('pages.assets.inner.availability-table-new',compact('asset'))->render();
    }
}
