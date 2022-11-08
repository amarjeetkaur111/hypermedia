<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\AssetNetwork;
use App\Models\Assets;
use App\Models\CampaignBucket;
use Illuminate\Http\Request;
use DataTables;
use Carbon\Carbon;


class campaignBucketController extends Controller
{
    public function index($id){
        $data = CampaignBucket::where('campaign_id',$id)->select('*');
        return DataTables::eloquent($data)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {

                $btn = '<a href="' . route('admin-campaign-bucket-add', ['id' => $row->id]) . '" class="edit btn btn-primary btn-sm">Edit</a>';

                return $btn;
            })
            ->rawColumns(['action'])
            ->make(true);
    }
    public function add($campaign_id,$id = null)
    {
        $data = null;
        $action = route('admin-campaign-bucket-add',['campaign_id' => $campaign_id]);
        $add = 'Add';
        if ($id) {
            $data = CampaignBucket::find($id);
            $action = route('admin-campaign-bucket-add', ['campaign_id' => $campaign_id,'id' => $id]);
            $add = 'Edit';
        }
        return view('pages.campaign.add', compact('data', 'action', 'add'));
    }

    public function addPost(Request $request,$campaign_id, $id = null)
    {
//        dd($request->all());
        $add = 'Add';
        $user = new Campaigns;
        if ($id) {
            $add = 'Edit';
            $user = Campaigns::find($id);
        }

        $this->validate($request, [
            'name' => 'required',
//            'name' => 'required|unique:campaign,name',
            'agency' => 'required',
            'brand' => 'required',
            'client_name' => 'required',
            'contract_name' => 'required',
            'contract_number' => 'required',
        ]);
        $user->name = $request->input('name');
        $user->agency = $request->input('agency');
        $user->brand = $request->input('brand');
        $user->client_name = $request->input('client_name');
        $user->contract_name = $request->input('contract_name');
        $user->contract_number = $request->input('contract_number');
        $user->description = $request->input('description');
        $user->campaign_type = $request->input('campaign_type');
        $user->payment_status = $request->input('payment_status');
        $user->booking_order = $request->input('booking_order');
        $user->start_date = Carbon::createFromFormat('d/m/Y',$request->input('start_date'))->toDateString();
        $user->start_time = Carbon::createFromFormat('H:i',$request->input('start_time'))->toTimeString();
        $user->end_date = Carbon::createFromFormat('d/m/Y',$request->input('end_date'))->toDateString();
        $user->end_time = Carbon::createFromFormat('H:i',$request->input('end_time'))->toTimeString();
        $user->status = $request->input('status');
        $user->save();

        return redirect()->route('admin-campaign-bucket-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }

    public function getAssetData(Request $request){
        $data = explode(':',$request->data);
        $quantity = '---';
        $asset_type = '---';
        $availability = '---';
        $inst_time = '---';
        $startdate = $request->startdate;
        $enddate = $request->enddate;

        $startdate = Carbon::createFromFormat('d/m/Y', $startdate)->format('Y-m-d');
        $enddate = Carbon::createFromFormat('d/m/Y', $enddate)->format('Y-m-d');

        if($data[0] == 'network'){
            $network = AssetNetwork::with('assets')->find($data[1]);
            $quantity = $network->assets->count();
            $inst_time = getFormattedTimeHuman($network->assets->sum('installation_time'));
        }
        else if($data[0] == 'asset'){
            $assets = Assets::with('assetStatus')->find($data[1]);
            $from_date =   $assets->assetStatus ? $assets->assetStatus->from_date : 'N/A';
            $to_date =   $assets->assetStatus ?  $assets->assetStatus->to_date : 'N/A';
            $quantity = 1;
            $asset_type = $assets->type;
            $availability = $assets->assetStatus ? $assets->assetStatus->status : 'N/A';
            $inst_time = getFormattedTimeHuman($assets->installation_time);

            if($assets->assetStatus && (($from_date >= $startdate && $from_date <= $enddate)|| ($to_date >= $startdate && $to_date <= $enddate) || ($from_date <= $startdate && $to_date >= $enddate)))
            {
                // echo $startdate." DC is greator </br>";  
                $availability = 'Booked';                  
            }else{        
                // echo $to_date." DB is greator </br>";  
                $availability = 'Available';
            }
        }
        return response()->json(['status' => 'Success', 'data' => ['asset_type' => $asset_type,'quantity' => $quantity,'availability' => $availability,'inst_time' => $inst_time]]);
    }
}
