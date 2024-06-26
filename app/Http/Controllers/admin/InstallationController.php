<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\CampaignBucket;
use App\Models\Campaigns;
use App\Models\InstallationTypes;
use App\Models\CampaignInstallationAssign;
use App\Models\InstallationDesigns;
use App\Models\CampaignProof;
use App\Models\ProofPictures;
use Carbon\Carbon;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Storage;
use App\Models\User;
use Illuminate\Support\Facades\DB;

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
            $data = Campaigns::with('buckets.locations')->whereHas('buckets')->select('*')->where('status', '<>','Cancelled')->orderBy('id','DESC');
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
                ->addColumn('proof_pictures', function ($row) {
                    $btn = '<a href="' . route('admin-campaign-installation-proofpictures-index', ['id' => $row->id]) . '" class="btn_margin edit btn btn-primary btn-sm" title="Production Proof Pictures"><i class="fas fa-plus-square"></i></a>';
                    return $btn;
                })
                ->rawColumns(['proof_pictures','action', 'locations', 'photos', 'permits', 'timer', 'assets'])
                ->make(true);
        }
        return view('pages.campaign.installation.index');
    }

    public function getCampaignAssets($id)
    {
        $data = CampaignBucket::with('assets','locations')->where('campaign_id', $id)->get();
        // $proofcount = Campaigns::find($id);
        $proofcount = CampaignProof::where('campaign_id',$id)->select('asset_id')->distinct('asset_id')->count();
        $approved = CampaignProof::where('campaign_id',$id)->select('asset_id')->where('status',1)->distinct('asset_id')->get()->toArray();
        $approved= array_column($approved,'asset_id');
        $rejected = CampaignProof::where('campaign_id',$id)->select('asset_id')->where('status',0)->distinct('asset_id')->get()->toArray();
        $rejected= array_column($rejected,'asset_id');

        $rejectcount = count(array_diff($rejected, $approved));
        // echo"<pre>";print_r($rejectcount);exit();
        return view('pages.campaign.installation.inner.assets', compact('data','proofcount','rejectcount'))->render();
    }

    public function installationIndex(Request $request, $id){
        $campaign_id = $id;
        $campaign_name = Campaigns::findorfail($id);
        $campaign_name=$campaign_name->name;
        
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
                        <a data-href="' . route('admin-campaign-installation-types-assign', ['id' => $row->id]) . '" class="btn_margin btn btn-primary btn-sm assign-button" title="Assign"><i class="fas fa-user-plus"></i></a>';

                    return $btn;
                })
                ->rawColumns(['action',  'timer','instructions'])
                ->make(true);
        }
        return view('pages.campaign.installation.types.index',compact('campaign_id','campaign_name'));
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
    public function assignInstallation($id)
    {
        // $campaign = Campaigns::with('assignee')
        //                        ->find($id)->toArray();
        $campaign = CampaignInstallationAssign::where('campaign_installation_id',$id)->whereNull('deleted_at')->get();         
        $users = User::all();
        $action = route('admin-campaign-installation-types-assign-post', ['id' => $id]);
        return view('pages.campaign.inner.users', compact('users', 'action', 'campaign'))->render();
    }

    public function assignInstallationPost(Request $request, $id)
    {
        $existUsers =  CampaignInstallationAssign::where('campaign_installation_id', $id)->get()->toArray();
        $existUsers = array_column($existUsers,'user_id');
        $newUsers = $request->users;
        if(!empty($existUsers))
        {
            $uniqueUsers = array_diff($existUsers,$newUsers);
            if(!empty($uniqueUsers))
            {
                foreach($uniqueUsers as $user)
                {
                    CampaignInstallationAssign::where('campaign_installation_id', $id)->where('user_id',$user)->delete();
                }
            }
            $uniqueUsers = array_diff($newUsers,$existUsers);
            if(!empty($uniqueUsers))
            {
                foreach($uniqueUsers as $user)
                {
                    $state = new CampaignInstallationAssign;
                    $state->campaign_installation_id = $id;
                    $state->user_id = $user;
                    $state->save();
                }
            }
        }
        else{
            foreach($newUsers as $user)
            {
                $state = new CampaignInstallationAssign;
                $state->campaign_installation_id = $id;
                $state->user_id = $user;
                $state->save();
            }
        }
        return redirect()->back()->with(['status' => 'Success', 'class' => 'success', 'msg' => "Assigned Successfully!"]);
    }

    // --------------------Proof Pictures-------------------------

    public function proofIndex(Request $request, $id){
        $campaign_id = $id;
        $campaign_name = Campaigns::findorfail($id);
        $campaign_name=$campaign_name->name;
        
        if ($request->ajax()) {
            $data = CampaignProof::with('assets')->where('campaign_id',$id)
            ->whereIn('id',function($q){
                $q
                ->from('campaign_proof')
                ->select(DB::raw('MAX(id) as id'))
                ->groupBy('asset_id');
            })
            ->select('*')->orderBy('created_at','DESC');
            return DataTables::eloquent($data)
                
                ->addColumn('photos', function ($row) {
                    return '<button class="btn btn-sm btn-primary photos_btn" dt-data-id="' . route('admin-campaign-installation-proofpictures-proof-pictures', ['id' => $row->id]) . '">Photos</button>';
                })

                ->editColumn('status', function ($row) {
                    if($row->status == '')
                        return '<span class="badge" style="background:grey;padding:7px;font-weight:bold;border-radius:3px;">Not Checked</span>';
                    elseif($row->status == 1)
                        return '<span class="badge" style="background:green;padding:7px;font-weight:bold;border-radius:3px;">Approved</span>';
                    else
                        return '<span class="badge" style="background:orange;padding:7px;font-weight:bold;border-radius:3px;">Re DO</span>';
                })

                ->editColumn('comment', function ($row) {
                    return ($row->comment ?? '-');
                })
                
                ->addColumn('added_on', function ($row) {
                    return Carbon::parse($row->created_at)->format('d M Y');
                })  
                
                // ->addColumn('location', function ($row) {
                //     if($row->asset)
                //         return $row->locations->name;
                //     else
                //         return 'NA';
                // })  
                ->addColumn('asset', function ($row) {
                    if($row->assets)
                        return $row->assets->name.'-'.$row->assets->ref_no;
                    else
                        return 'NA';
                })  
                ->addColumn('action', function ($row) use ($id) {
                    if($row->status == '0')
                        return '<span class="badge" style="background:orange;padding:7px;font-weight:bold;border-radius:3px;">Rejected</span>';
                    else
                    {
                        $btn = '<a href="' . route('admin-campaign-installation-proofpictures-approval', ['id' => $row->bucket_id.':'.$row->id]) . '" class="btn_margin approval btn btn-primary btn-sm" title="Installations">Reject</a>';
                        return $btn;
                    }
                })
                ->rawColumns(['asset','photos', 'status', 'comments', 'added_on', 'action'])
                ->make(true);
        }
        return view('pages.campaign.installation.proof.index',compact('campaign_id','campaign_name'));
    }

    public function proofAdd($campaign_id = null)
    {
        // dd($campaign_id);
        $c_id = $campaign_id;
        $campaign_name='';
        $assets = array();
        if($c_id){
            $campaign_name = Campaigns::with('buckets.locations')->findorfail($c_id);
            // $locations =  CampaignBucket::select('location')->with('locations')->where('campaign_id',$c_id)->get();
            $assets =  CampaignBucket::select('asset','id')->with('assets')->where('campaign_id',$c_id)->where('proof_status',0)->get();
            // echo"<pre>"; print_r($assets->toArray());exit();
        }
        $data = null;
        $action = route('admin-campaign-installation-proofpictures-add',['campaign_id'=>$campaign_id]);
        $add = 'Add';
        
        return view('pages.campaign.installation.proof.add', compact('assets','data', 'action', 'add', 'c_id','campaign_name'));
    }

    public function proofAddPost(Request $request, $campaign_id)
    {

        $this->validate($request, [
            'file' => 'required',
            'assets' => 'required',
        ]);

        if($request->hasFile('file'))
        {
            $assets = explode(':',$request->assets);
            $asset = $assets[0];
            $bucket = $assets[1];
            $campaign_proof = new CampaignProof;
            $campaign_proof->campaign_id = $request->campaign_id;
            $campaign_proof->asset_id = $asset;
            $campaign_proof->bucket_id = $bucket;
            $campaign_proof->status =  1;
            $campaign_proof->save();
            $campaign_proof_id = $campaign_proof->id;

            $files = $request->file('file');

            foreach($files as $file){
                $pp  = new ProofPictures;
                $pp->campaign_proof_id = $campaign_proof_id;

                $filename = $file->getClientOriginalName();
                $extension = $file->getClientOriginalExtension();
                $path = Storage::disk('s3')->putFileAs('proof_pictures',$file,$filename.'.'.$extension,'public');
                $pp->image = config('filesystems.disks.s3.url').'/'.$path;
                $pp->save();
            }

            $campStatus = Campaigns::findorfail($request->campaign_id);
            if($campStatus->status == 'Not Started')
            {
                $campStatus->status = 'Active';
                $campStatus->save();
            }


            $bucketStatus = CampaignBucket::where('campaign_id',$request->campaign_id)->where('id',$bucket)->first();
            $asset_array = $bucketStatus->asset_data->toArray();
            $totalCount =  count($asset_array);
            $proofcount = 0;
            array_walk($asset_array, function ($value, $key) use(&$proofcount){
                if(is_array($value['proof']))
                    $proofcount++;
              });

            if($proofcount >= $totalCount)
            {
                $bucketStatus->proof_status=1;
                $bucketStatus->save();
                changeCampaignStatus($request->campaign_id);
            }
            
        }
        return redirect()->route('admin-campaign-installation-proofpictures-index',['id'=>$request->campaign_id])->with(['status' => 'Success', 'class' => 'success', 'msg' => "Pictures Added Successfully!"]);
    }

    public function getProofPictures($id)
    {
        $data = CampaignProof::with('pictures')->find($id);
        // print_r($data);exit();
        return view('pages.campaign.installation.proof.pictures', compact('data'))->render();
    }

    public function getApproval($id)
    {
        $id = explode(':',$id);
        $bucket = $id[0];
        $id = $id[1];

        $url = route('admin-campaign-installation-proofpictures-approval-post');
        // print_r($data);exit();
        return view('pages.campaign.installation.proof.approval', compact('id','url','bucket'))->render();
    }

    public function ApprovalPost(Request $request)
    {
        $compaign_proof = CampaignProof::find($request->id);
        $campaign = $compaign_proof->campaign_id;
        $compaign_proof->status =  $request->status;
        $compaign_proof->comment =  $request->comment;
        
        $bucketStatus = CampaignBucket::where('campaign_id',$campaign)->where('id',$request->bucket)->first();
        $bucketStatus->proof_status=0;
        $bucketStatus->save();

        $status = Campaigns::find($campaign);
        if($status->status == 'Completed')
        {
            $status->status = 'Active';
            $status->save();
        }
        if($compaign_proof->save())
        return redirect()->route('admin-campaign-installation-proofpictures-index',['id'=>$campaign])->with(['status' => 'Success', 'class' => 'success', 'msg' => "Status Updated Successfully!"]);
    }


    // ---------------------------------------------------------End-----------------------------------------------------------------
}
