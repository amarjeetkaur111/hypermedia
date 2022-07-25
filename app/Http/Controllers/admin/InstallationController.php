<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\CampaignBucket;
use App\Models\Campaigns;
use App\Models\InstallationTypes;
use App\Models\InstallationDesigns;
use Carbon\Carbon;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Storage;

class InstallationController extends Controller
{
    public function checkDate($start, $end)
    {
        if (now()->startOfDay()->lt($start)) {
            return '<label class="label label-primary">Pending</label>';
        } else if (now()->endOfDay()->gt($end)) {
            return '<label class="label label-danger">Done</label>';
        }
        return '<label class="label label-success">Current</label>';
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Campaigns::with('buckets.locations')->select('*');
            return DataTables::eloquent($data)
                ->editColumn('timer', function ($row) {
                    $start_date = Carbon::parse($row->start_date);
                    $end_date = Carbon::parse($row->end_date);
                    return $this->checkDate($start_date, $end_date);
                })
                ->editColumn('type', function ($row) {
                    return $row->status;
                })
                ->addColumn('start_date', function ($row) {
                    $start = Carbon::parse($row->start_date)->format('d/m/Y');
                    $end = Carbon::parse($row->end_date)->format('d/m/Y');
                    return $start . ' to ' . $end;
                })
                ->addColumn('locations', function ($row) {
                    $location = '<ol>';
                    foreach ($row->buckets as $b) {
                        if ($b->locations) {
                            $location .= '<li>' . $b->locations->name . '</li>';
                        }
                    }
                    $location .= '</ol>';
                    $html = '<button data-list-loc="' . $location . '" class="btn btn-primary btn-sm location-btn" title="Location"><i class=" fas fa-location-arrow"></i></button>';
                    return $html;
                })
                ->addColumn('photos', function ($row) {
                    return '<button class="btn btn-sm btn-primary photos_btn" dt-data-id="' . route('admin-campaign-campaign-photos', ['id' => $row->id]) . '">Photos</button>';
                })
                ->addColumn('permits', function ($row) {
                    return '<button class="btn btn-sm btn-primary permits_btn" dt-add-href="' . route('admin-campaign-campaign-permits-add', ['id' => $row->id]) . '" dt-data-id="' . route('admin-campaign-campaign-permits', ['id' => $row->id]) . '" title="Permits"><i class="fas fa-money-bill-alt"></i></button>';
                })
                ->addColumn('assets', function ($row) {
                    return '<button class="btn btn-sm btn-primary asset_btn" dt-data-id="' . route('admin-campaign-installation-assets', ['id' => $row->id]) . '"><i class="fas fa-th-list"></i></button>';
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="' . route('admin-campaign-installation-types-index', ['id' => $row->id]) . '" class="btn_margin edit btn btn-primary btn-sm" title="Installations"><i class="fas fa-plus-square"></i></a>';
                    return $btn;
                })
                ->rawColumns(['action', 'locations', 'photos', 'permits', 'timer', 'assets'])
                ->make(true);
        }
        return view('pages.campaign.installation.index');
    }

    public function getCampaignAssets($id)
    {
        $data = CampaignBucket::with('assets')->where('campaign_id', $id)->get();
        return view('pages.campaign.installation.inner.assets', compact('data'))->render();
    }

    public function installationIndex(Request $request, $id){
        $campaign_id = $id;

        
        if ($request->ajax()) {
            $data = InstallationTypes::where('campaign_id',$id)->select('*');
            return DataTables::eloquent($data)
                
                ->editColumn('type', function ($row) {
                    return $row->type;
                })
                ->addColumn('start_date', function ($row) {
                    $start = Carbon::parse($row->start_date)->format('d/m/Y');
                    $end = Carbon::parse($row->end_date)->format('d/m/Y');
                    return $start . ' to ' . $end;
                })
               
                
                ->editColumn('instructions', function ($row) {
                    return '<button class="btn btn-sm btn-primary instruction_view" dt-data-id="'.$row->instructions.'"><i class="fas fa-eye"></i></button>';
                })
                
                ->addColumn('action', function ($row) use ($id) {
                    // dd($row->id);
                    $btn = '<a href="' . route('admin-campaign-installation-types-add', ['campaign_id' => $id,'id' => $row->id]) . '" class="btn_margin edit btn btn-primary btn-sm" title="Installations"><i class="fas fa-edit"></i></a>
                            <a href="' . route('admin-campaign-installation-designs-index', ['id' => $row->id]) . '" class="btn_margin edit btn btn-primary btn-sm" title="Designs"><i class="fas fa-image"></i></a>;
                            <a data-href="' . route('admin-campaign-assign', ['id' => $row->id]) . '" class="btn_margin btn btn-primary btn-sm assign-button" title="Assign"><i class="fas fa-user-plus"></i></a>';

                    return $btn;
                })
                ->rawColumns(['action',  'timer','instructions'])
                ->make(true);
        }
        return view('pages.campaign.installation.types.index',compact('campaign_id'));
    }

    public function add($campaign_id ,$id = null)
    {
        // dd($campaign_id);
        $c_id = $campaign_id;
        $data = null;
        $action = route('admin-campaign-installation-types-add',['campaign_id'=>$campaign_id]);
        $add = 'Add';
        if ($id) {
            $data = InstallationTypes::find($id);
            $action = route('admin-campaign-installation-types-add', ['campaign_id'=>$campaign_id, 'id' => $id]);
            $add = 'Edit';
        }
        // dd()
        return view('pages.campaign.installation.types.add', compact('data', 'action', 'add', 'c_id'));
    }

    public function addPost(Request $request, $campaign_id, $id = null)
    {
        // dd($request->all());
        //        if(!Auth::user()->can('')){
        //
        //        }
        $add = 'Add';
        $user = new InstallationTypes;
        if ($id) {
            $add = 'Edit';
            $user = InstallationTypes::find($id);
        }
        // dd('hi');
        $this->validate($request, [
            'type' => 'required',
            'instructions' => 'required',
            'priority' => 'required',
        ]);
        // dd('kk');
        $user->type = $request->input('type');
        $user->instructions = $request->input('instructions');
        $user->priority = $request->input('priority');
        $user->start_date = Carbon::createFromFormat('d/m/Y', $request->input('start_date'))->toDateString();
        $user->end_date = Carbon::createFromFormat('d/m/Y', $request->input('end_date'))->toDateString();
        $user->status = $request->input('status');
        $user->campaign_id = $request->input('campaign_id');
        $user->save();
        // dd($user->id);
        if($user->save()){
        return redirect()->route('admin-campaign-installation-types-index',$campaign_id)->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);

        }
        return redirect()->route('admin-campaign-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }

    // -----------------------------------------------------Installation Designs---------------------------------------------------

    public function designIndex(Request $request, $id)
    {
        $installation_id = $id;
        if ($request->ajax()) {
            $data = InstallationDesigns::with('campaignInstallation')->where('installation_id',$id)->select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('campaign_id', function ($row) {
                    return $row->campaignInstallation ? $row->campaignInstallation->type : $row->campaign_id;
                })
                ->addColumn('photo_preview', function ($row) {
                    return '<a class="img_click" href="' . $row->photo_path . '">
                                <img src="' . $row->photo_path . '"  href="' . $row->photo_path . '" alt="" height=35 />
                            </a>';
                })
                ->addColumn('action', function ($row) use($installation_id) {
                    $btn = '<a href="' . route('admin-campaign-installation-designs-add',['installation_id' => $installation_id,'id' => $row->id]) . '" class="edit btn btn-primary btn-sm">Edit</a>';
                    return $btn;
                })
                ->rawColumns(['action', 'photo_preview'])
                ->make(true);
        }
        return view('pages.campaign.installation.designs.index',compact('installation_id'));
    }

    public function addDesign($installation_id , $id = null)
    {
        $ins_id = $installation_id;
        $data = null;
        $action = route('admin-campaign-installation-designs-add',['installation_id'=>$installation_id]);
        $add = 'Add';
        if ($id) {
            $data = InstallationDesigns::with('campaignInstallation')->find($id);
            $action = route('admin-campaign-installation-designs-add', ['installation_id'=>$installation_id, 'id' => $id]);
            $add = 'Edit';
        }
        return view('pages.campaign.installation.designs.add', compact('data', 'action', 'add','ins_id'));
    }

    public function addDesignPost(Request $request, $installation_id , $id = null)
    {
        // dd($request->all());

        $add = 'Add';
        $obj = new InstallationDesigns;
        if ($id) {
            $add = 'Edit';
            $obj = InstallationDesigns::find($id);
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
            $path = Storage::disk('s3')->putFileAs('installation_designs',$request->photo,$filename ,'public');
            $obj->photo_path = config('filesystems.disks.s3.url').'/'.$path;

//            $file = request()->file('photo');
//            $name = $file->store('campaign_monitoring', ['disk' => 'my_files']);
//            $obj->photo_path = $name;
        }
        $obj->installation_id = $request->input('installation_id');
        $obj->description = $request->input('description');
        $obj->status = $request->input('status');
        $obj->save();
        return redirect()->route('admin-campaign-installation-designs-index',$installation_id)->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
    // ---------------------------------------------------------End-----------------------------------------------------------------
}
