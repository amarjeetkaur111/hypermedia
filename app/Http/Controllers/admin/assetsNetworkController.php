<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\AssetInNetwork;
use App\Models\AssetNetwork;
use App\Models\Assets;
use Illuminate\Http\Request;
use DataTables;

class assetsNetworkController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = AssetNetwork::with('assets')->select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {

                    $btn = '<a href="'.route('admin-assets-network-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>
                            <a href="'.route('admin-assets-network-add-assets',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Add Assets</a>';

                    return $btn;
                })
                ->addColumn('installation_hours',function($row){
                    return $row->assets ? getFormattedTimeHuman($row->assets->sum('installation_time')) : 0;
                })
                ->addColumn('quantity',function($row){
                    return $row->assets ? $row->assets->count() : 0;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.assetNetwork.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-assets-network-add');
        $add = 'Add';
        if ($id) {
            $data = AssetNetwork::find($id);
            $action = route('admin-assets-network-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.assetNetwork.add', compact('data', 'action', 'add'));
    }


    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $permissions = new AssetNetwork;
        if ($id) {
            $add = 'Edit';
            $permissions = AssetNetwork::find($id);
        }
        if ($id) {

            $this->validate($request, [
                'name' => 'required|unique:asset_network,id,' . $id,
            ]);
        } else {

            $this->validate($request, [
                'name' => 'required|unique:asset_network,name',
            ]);
        }
        $permissions->name = $request->input('name');
        $permissions->status = $request->input('status');
        $permissions->save();
        return redirect()->route('admin-assets-network-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }

    public function addAssets($id = null){
        $assets = Assets::select('id','ref_no','name')->whereDoesntHave('network')->get();
        $action = route('admin-assets-network-add-assets',['id' => $id]);
        $add = 'Add';
        $network = AssetNetwork::with('assets')->find($id);
        return view('pages.assetNetwork.addAssets',compact('assets','id','action','add','network'));
    }

    public function addAssetsPost(Request $request,$id = null){
        $new = new AssetInNetwork;
        $new->network_id = $id;
        $new->asset_id = $request->assets;
        $new->save();
        return redirect()->route('admin-assets-network-add-assets',['id' => $id])->with(['status' => 'Success','class' => 'success', 'msg' => 'Added Successfully']);
    }

    public function removeAsset($id,$asset_id){
        AssetInNetwork::where('network_id',$id)->where('asset_id',$asset_id)->delete();
        return redirect()->route('admin-assets-network-add-assets',['id' => $id])->with(['status' => 'Success','class' => 'success', 'msg' => 'Removed Successfully']);
    }
}
