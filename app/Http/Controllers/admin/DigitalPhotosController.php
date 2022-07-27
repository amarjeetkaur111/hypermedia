<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\DigitalPhotos;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Storage;

class DigitalPhotosController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = DigitalPhotos::with('campaign')->select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('campaign_id', function ($row) {
                    return $row->campaign ? $row->campaign->name : $row->campaign_id;
                })
                ->addColumn('photo_preview', function ($row) {
                    return '<a class="img_click" href="' . $row->photo_path . '">
                                <img src="' . $row->photo_path . '"  href="' . $row->photo_path . '" alt="" height=35 />
                            </a>';
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="' . route('admin-campaign-monitoring-add', ['id' => $row->id]) . '" class="edit btn btn-primary btn-sm">Edit</a>';
                    return $btn;
                })
                ->rawColumns(['action', 'photo_preview'])
                ->make(true);
        }
        return view('pages.monitoring.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-campaign-monitoring-add');
        $add = 'Add';
        if ($id) {
            $data = DigitalPhotos::with(['campaign','campaign.department'])->find($id);
            $action = route('admin-campaign-monitoring-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.monitoring.add', compact('data', 'action', 'add'));
    }

    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $obj = new DigitalPhotos;
        if ($id) {
            $add = 'Edit';
            $obj = DigitalPhotos::find($id);
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
            $path = Storage::disk('s3')->putFileAs('campaign_monitoring',$request->photo,$filename ,'public');
            $obj->photo_path = config('filesystems.disks.s3.url').'/'.$path;

//            $file = request()->file('photo');
//            $name = $file->store('campaign_monitoring', ['disk' => 'my_files']);
//            $obj->photo_path = $name;
        }
        if ($request->hasFile('video')) {

            $filename = $request->file('video')->getClientOriginalName();
            $path = Storage::disk('s3')->putFileAs('campaign_monitoring_video',$request->photo,$filename ,'public');
            $obj->photo_path = config('filesystems.disks.s3.url').'/'.$path;
        }
        $obj->campaign_id = $request->input('campaign_id');
        $obj->description = $request->input('description');
        $obj->status = $request->input('status');
        $obj->save();
        return redirect()->route('admin-campaign-monitoring-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}
