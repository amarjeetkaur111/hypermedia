<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\DefectTracking;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Storage;

class DefectTrackingController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = DefectTracking::with('asset')->select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('campaign_id', function ($row) {
                    return $row->campaign ? $row->campaign->name : $row->campaign_id;
                })
                ->addColumn('asset_id', function ($row) {
                    return $row->asset ? $row->asset->ref_no.' - '.$row->asset->name : $row->asset_id ?? 'N/A';
                })
                ->addColumn('photo_preview', function ($row) {
                    return '<a class="img_click" href="' . $row->photo_path . '">
                                <img src="' . $row->photo_path . '"  href="' . $row->photo_path . '" alt="" height=35 />
                            </a>';
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="' . route('admin-defect-tracking-add', ['id' => $row->id]) . '" class="edit btn btn-primary btn-sm">Edit</a>';
                    return $btn;
                })
                ->rawColumns(['action', 'photo_preview'])
                ->make(true);
        }
        return view('pages.defectTracking.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-defect-tracking-add');
        $add = 'Add';
        if ($id) {
            $data = DefectTracking::with('asset','location')->find($id);
            $action = route('admin-defect-tracking-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.defectTracking.add', compact('data', 'action', 'add'));
    }

    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $obj = new DefectTracking;
        if ($id) {
            $add = 'Edit';
            $obj = DefectTracking::find($id);
        }
        if ($id) {
            $this->validate($request, [
                'status' => 'required',
            ]);
        } else {
            $this->validate($request, [
                'photo' => 'required',
                'status' => 'required',
            ]);
        }
        if ($request->hasFile('photo')) {

            $filename = $request->file('photo')->getClientOriginalName();
            $path = Storage::disk('s3')->putFileAs('defect_tracking',$request->photo,$filename ,'public');
            $obj->photo_path = config('filesystems.disks.s3.url').'/'.$path;

//            $file = request()->file('photo');
//            $name = $file->store('defect_tracking', ['disk' => 'my_files']);
//            $obj->photo_path = $name;
        }
        $obj->description = $request->input('description');
        $obj->status = $request->input('status');
        $obj->asset_id = $request->input('asset_id');
        $obj->location_id = $request->input('location_id');
        $obj->save();
        return redirect()->route('admin-defect-tracking-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}
