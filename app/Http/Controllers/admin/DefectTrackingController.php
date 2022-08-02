<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\DefectTracking;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use Carbon\CarbonPeriod;

class DefectTrackingController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = DefectTracking::with(['asset.department','campaign'])->select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('campaign_id', function ($row) {
                    return $row->campaign ? $row->campaign->name : 'NA';
                })
                ->addColumn('deparment_id', function ($row) {
                    return $row->asset->department ? $row->asset->department->name : 'NA';
                })
                ->addColumn('asset_id', function ($row) {
                    return $row->asset ? $row->asset->ref_no.' - '.$row->asset->name : $row->asset_id ?? 'N/A';
                })
                ->addColumn('created_at', function ($row) {
                    return Carbon::parse($row->created_at)->format('d/m/Y');
                })
                ->addColumn('fixed_at', function ($row) {
                    $btn = '<a data-href="' . route('admin-defect-tracking-fixed', ['id' => $row->id]) . '" class="defect_fixed btn btn-primary btn-sm">Fixed</a>';
                    $fixed = ($row->fixed_at) ? Carbon::parse($row->fixed_at)->format('d/m/Y') : $btn;
                    return $fixed;
                })
                ->addColumn('owned_by', function ($row) {
                    return ($row->asset->owned_by > 0) ? $row->asset->owned_by : 'None';
                })
                ->addColumn('photo_preview', function ($row) {
                    return '<a class="img_click" href="' . $row->photo_path . '">
                                <img src="' . $row->photo_path . '"  href="' . $row->photo_path . '" alt="" height=35 />
                            </a>';
                })
                ->addColumn('video_download', function ($row) {
                    return '<a href="'.route('download-file',['table' => \Illuminate\Support\Facades\Crypt::encrypt('defect_monitoring'),'field' => 'video_path','id' => $row->id]).'" class="btn btn-sm btn-primary"><i class="fa fa-eye"></i></a>';
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="' . route('admin-defect-tracking-add', ['id' => $row->id]) . '" " class="btn_margin edit btn btn-primary btn-sm"   ><i class="fas fa-edit"></i></a>';
                    return $btn;
                })
                ->rawColumns(['action', 'photo_preview','video_download','fixed_at'])
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
        // echo"<pre>";print_r($_POST);    exit();
        $add = 'Add';
        $obj = new DefectTracking;
        if ($id) {
            $add = 'Edit';
            $obj = DefectTracking::find($id);
        }
        if ($id) {
            $this->validate($request, [
                'status' => 'required',
                'photo' => 'max:1000',
                'video' => 'file|mimes:mp4,mov,ogg,qt|max:2000',
            ]);
        } else {
            $this->validate($request, [
                'photo' => 'required|max:1000',
                'status' => 'required',
                'video' => 'file|mimes:mp4,mov,ogg,qt|max:2000',
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
        if ($request->hasFile('video')) {
            $filename = $request->file('video')->getClientOriginalName();
            $path = Storage::disk('s3')->putFileAs('campaign_monitoring_video',$request->video,$filename ,'public');
            $obj->video_path = config('filesystems.disks.s3.url').'/'.$path;
        }
        $obj->campaign_id = $request->input('campaign_id');
        $obj->description = $request->input('description');
        $obj->status = $request->input('status');
        $obj->asset_id = $request->input('asset_id');
        $obj->location_id = $request->input('location_id');
        $obj->save();
        return redirect()->route('admin-defect-tracking-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
    public function fixed($id = null)
    {
        $defect = DefectTracking::with('asset')->find($id);
        $action = route('admin-defect-tracking-fixed', ['id' => $id]);
        return view('pages.defectTracking.inner.fixed', compact('action', 'defect'))->render();
    }
    public function fixedPost(Request $request, $id = null)
    {
        $add = 'Add';
        $obj = new DefectTracking;
        if ($id) {
            $add = 'Edit';
            $obj = DefectTracking::find($id);
        }
        $fixedtime = Carbon::now();
        echo $fixedtime->toDateTimeString();        
        $obj->fixed_at = $fixedtime;
        $obj->fixed_by = auth()->id();
        $obj->save();
        return redirect()->route('admin-defect-tracking-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "Defect Fixed Successfully!"]);
    }
    
}
