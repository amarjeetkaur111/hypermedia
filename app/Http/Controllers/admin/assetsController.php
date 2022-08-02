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

class assetsController extends Controller
{
    public function index(Request $request)
    {
        if($request->ajax()){
            $data = Assets::select('*');
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
                ->addColumn('installation_time',function($row){
                    return getFormattedTimeHuman($row->installation_time);
                })
                ->rawColumns(['action','asset_photo'])
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
            ]);
        } else {
            $this->validate($request, [
                'ref_no' => 'required|unique:assets,ref_no',
                'name' => 'required',
            ]);
        }
        $user->ref_no = $request->input('ref_no');
        $user->name = $request->input('name');
        $user->department_id = $request->input('department_id');
        $user->location_id = $request->input('location');
        $user->owned_by = $request->input('owner_id');
        $user->description = $request->input('description');
        $user->type = $request->input('type');
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
            $new->from_date = null;
            $new->to_date = null;
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
}
