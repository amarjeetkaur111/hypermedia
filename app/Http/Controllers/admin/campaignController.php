<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\AssetNetwork;
use App\Models\Assets;
use App\Models\AssetStatus;
use App\Models\CampaignAssign;
use App\Models\CampaignBucket;
use App\Models\CampaignPermits;
use App\Models\Campaigns;
use App\Models\CampaignStatus;
use App\Models\User;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Storage;

class campaignController extends Controller
{
    public function index(Request $request)
    {
        // $d = Carbon::parse('April')->daysInMonth;
        // dd($d);


        if ($request->ajax()) {

            $data = Campaigns::with('client', 'buckets', 'buckets.locations')->select('*');
            if ($request->has('start_date') && $request->start_date) {
                $s_date = Carbon::createFromFormat('d/m/Y', $request->start_date);
                $data = $data->whereDate('start_date', '>=', $s_date)->orWhereDate('end_date', '>=', $s_date);
            }
            if ($request->has('end_date') && $request->end_date) {
                $e_date = Carbon::createFromFormat('d/m/Y', $request->end_date);
                $data = $data->whereDate('end_date', '<=', $e_date)->orWhereDate('start_date', '<=', $e_date);
            }
            return DataTables::eloquent($data)
                ->editColumn('client_name', function ($row) {
                    return $row->client ? $row->client->name : $row->client_name;
                })
                ->addColumn('action', function ($row) {

                    $btn = '<a href="' . route('admin-campaign-overview', ['id' => $row->id]) . '" class="edit btn btn-primary btn-sm"><i class="fas fa-eye"></i></a>';
                    $btn .= '<a href="' . route('admin-campaign-add', ['id' => $row->id]) . '" class="edit btn btn-primary btn-sm" style="margin-top: 5px;"><i class="fas fa-edit"></i></a>';
                    if (in_array($row->status, ['Active', 'Installing', 'Dismantling', 'Not Started'])) {
                        $btn .= ' <a data-href="' . route('admin-campaign-change-status', ['id' => $row->id]) . '" class="btn btn-primary btn-sm status-button" style="margin-top: 5px;">Status</a>';
                        $btn .= ' <a data-href="' . route('admin-campaign-assign', ['id' => $row->id]) . '" class="btn btn-primary btn-sm assign-button" style="margin-top: 5px;">Assign</a>';
                    }

                    return $btn;
                })
                ->addColumn('start_date', function ($row) {
                    $start = Carbon::parse($row->start_date)->format('d/m/Y');
                    $end = Carbon::parse($row->end_date)->format('d/m/Y');
                    return $start . ' to ' . $end;
                })
//                ->addColumn('permits', function ($row) {
//                    return 'abc';
//                })
                ->addColumn('locations', function ($row) {
                    $location = '<ol>';
                    foreach ($row->buckets as $b) {
                        if ($b->locations) {
                            $location .= '<li>' . $b->locations->name . '</li>';
                        }
                    }
                    $location .= '</ol>';
                    $html = '<button data-list-loc="' . $location . '" class="btn btn-primary btn-sm location-btn" ><i class=" fas fa-location-arrow"></i></button>';
                    return $html;
                })
                ->addColumn('photos', function ($row) {
                    return '<button class="btn btn-sm btn-primary photos_btn" dt-data-id="' . route('admin-campaign-campaign-photos', ['id' => $row->id]) . '" ><i class="fas fa-image"></i></button>';
                })
                ->addColumn('permits', function ($row) {
                    return '<button class="btn btn-sm btn-primary permits_btn" dt-add-href="' . route('admin-campaign-campaign-permits-add', ['id' => $row->id]) . '" dt-data-id="' . route('admin-campaign-campaign-permits', ['id' => $row->id]) . '"><i class="fa fa-receipt"></i></button>';
                })
                ->rawColumns(['action', 'locations', 'photos', 'permits'])
                ->make(true);
        }
        return view('pages.campaign.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-campaign-add');
        $add = 'Add';
        if ($id) {
            $data = Campaigns::with('client', 'buckets', 'department')->find($id);
            $action = route('admin-campaign-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.campaign.add', compact('data', 'action', 'add'));
    }

    public function addPost(Request $request, $id = null)
    {
//        if(!Auth::user()->can('')){
//
//        }
        $add = 'Add';
        $user = new Campaigns;
        if ($id) {
            $add = 'Edit';
            $user = Campaigns::find($id);
        }

        $this->validate($request, [
            'name' => 'required',
            'agency' => 'required',
//            'brand' => 'required',
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
        $user->department_id = $request->input('department_id');
        $user->start_date = Carbon::createFromFormat('d/m/Y', $request->input('start_date'))->toDateString();
        $user->start_time = Carbon::createFromFormat('H:i', $request->input('start_time'))->toTimeString();
        $user->end_date = Carbon::createFromFormat('d/m/Y', $request->input('end_date'))->toDateString();
        $user->end_time = Carbon::createFromFormat('H:i', $request->input('end_time'))->toTimeString();
        $user->status = $request->input('status');
        $user->market = $request->input('market');
        if ($request->hasFile('booking_order_file')) {

            $filename = $request->file('booking_order_file')->getClientOriginalName();
            $path = Storage::disk('s3')->putFileAs('booking_order_file', $request->booking_order_file, $filename, 'public');
            $user->booking_order_file = config('filesystems.disks.s3.url') . '/' . $path;

//
//            $file = request()->file('booking_order_file');
//            $name = $file->store('booking_order_file', ['disk' => 'my_files']);
//            $user->booking_order_file = $name;
        }
        $ids = [];
        $done = [];
        $not = [];
        if ($user->save()) {

            CampaignStatus::where('campaign_id', $user->id)->delete();
            $state = new CampaignStatus;
            $state->campaign_id = $user->id;
            $state->status = $user->status;
            $state->save();

            AssetStatus::where('campaign_id', $user->id)->delete();
            foreach ($request->bucket_location ?? [] as $key => $looper) {
                $asset = explode(':', $request->bucket_asset[$key]);
                if ($asset[0] == 'network') {
                    $a = AssetNetwork::with('assets')->find($asset[1]);
                    $type = null;
                    foreach ($a->assets as $asset_each) {
                        if (!in_array($asset_each->id, $done)) {
                            $asset_each->load('assetStatus');
                            if ($asset_each->type != 'digital' && $asset_each->assetStatus && in_array($asset_each->assetStatus->status, ['Booked', 'Maintenance']) && $asset_each->assetStatus->campaign_id != $user->id) {
                                $ids[] = $asset_each->id;
                                $done[] = $asset_each->id;
                                $not[$asset_each->id] = $asset_each->name;
                                continue;
                            }
                            if (isset($request->bucket_id[$key]) && $request->bucket_id[$key]) {
                                $obj = CampaignBucket::find($request->bucket_id[$key]);
                            } else {
                                $obj = new CampaignBucket;
                            }
                            if ($asset[0] == 'network') {
                                $network = AssetNetwork::with('assets')->find($asset[1]);
                            }
                            $obj->campaign_id = $user->id;
                            $obj->location = $request->bucket_location[$key];
                            $obj->start_date = Carbon::createFromFormat('d/m/Y', $request->bucket_start_date[$key])->toDateString();
                            $obj->end_date = Carbon::createFromFormat('d/m/Y', $request->bucket_end_date[$key])->toDateString();
                            $obj->asset_network = $asset[0] == 'network' ? $asset[1] : null;
                            $obj->asset = $asset_each->id;
                            $obj->asset_type = $asset_each->type;
                            $obj->quantity = isset($network) && $network ? $network->assets->count() : null;
                            $obj->availability = null; //:todo check availability and add here (functionality pending)
                            $obj->installation_time = $asset_each->installation_time;
                            $obj->save();
                            $ids[] = $obj->id;
                            $done[] = $obj->id;
                            if (Carbon::createFromFormat('d/m/Y', $request->bucket_start_date[$key])->toDate() < Carbon::createFromFormat('d/m/Y', $request->input('start_date'))->toDate()) {
                                $user->start_date = Carbon::createFromFormat('d/m/Y', $request->bucket_start_date[$key])->toDateString();
                                $user->save();
                            }
                            if (Carbon::createFromFormat('d/m/Y', $request->bucket_end_date[$key])->toDate() > Carbon::createFromFormat('d/m/Y', $request->input('end_date'))->toDate()) {
                                $user->end_date = Carbon::createFromFormat('d/m/Y', $request->bucket_end_date[$key])->toDateString();
                                $user->save();
                            }
                        }
                    }
                } else if ($asset[0] == 'asset') {

                    if (!in_array($asset[1], $done)) {
                        $a = Assets::with('assetStatus')->find($asset[1]);
                        if ($a->type != 'digital' && $a->assetStatus && in_array($a->assetStatus->status, ['Booked', 'Maintenance']) && $a->assetStatus->campaign_id != $user->id) {
                            $ids[] = $a->id;
                            $done[] = $a->id;
                            $not[$a->id] = $a->name;
                            continue;
                        }
                        $type = $a->type;
                        if (isset($request->bucket_id[$key]) && $request->bucket_id[$key]) {
                            $obj = CampaignBucket::find($request->bucket_id[$key]);
                        } else {
                            $obj = new CampaignBucket;
                        }
                        $obj->campaign_id = $user->id;
                        $obj->location = $request->bucket_location[$key];
                        $obj->start_date = Carbon::createFromFormat('d/m/Y', $request->bucket_start_date[$key])->toDateString();
                        $obj->end_date = Carbon::createFromFormat('d/m/Y', $request->bucket_end_date[$key])->toDateString();
                        $obj->asset_network = $asset[0] == 'network' ? $asset[1] : null;
                        $obj->asset = $asset[0] == 'asset' ? $asset[1] : 1;
                        $obj->asset_type = $type;
                        $obj->quantity = isset($network) && $network ? $network->assets->count() : null;
                        $obj->availability = null; //:todo check availability and add here (functionality pending)
                        $obj->installation_time = $a->installation_time;
                        $obj->save();
                        $ids[] = $obj->id;
                        $done[] = $obj->id;
                        if (Carbon::createFromFormat('d/m/Y', $request->bucket_start_date[$key])->toDate() < Carbon::createFromFormat('d/m/Y', $request->input('start_date'))->toDate()) {
                            $user->start_date = Carbon::createFromFormat('d/m/Y', $request->bucket_start_date[$key])->toDateString();
                            $user->save();
                        }
                        if (Carbon::createFromFormat('d/m/Y', $request->bucket_end_date[$key])->toDate() > Carbon::createFromFormat('d/m/Y', $request->input('end_date'))->toDate()) {
                            $user->end_date = Carbon::createFromFormat('d/m/Y', $request->bucket_end_date[$key])->toDateString();
                            $user->save();
                        }
                    }
                } else {
                    return redirect()->route('admin-campaign-index')->with(['status' => 'Error', 'class' => 'danger', 'msg' => "Bucket could not be added!"]);
                }
                if ($asset[0] == 'network') {
                    foreach ($a->assets as $asset) {
                        AssetStatus::where('asset_id', $asset->id)->delete();
                        $state = new AssetStatus;
                        $state->asset_id = $asset->id;
                        $state->campaign_id = $user->id;
                        $state->from_date = Carbon::createFromFormat('d/m/Y', $request->bucket_start_date[$key])->endOfDay()->toDateTimeString();
                        $state->to_date = Carbon::createFromFormat('d/m/Y', $request->bucket_end_date[$key])->startOfDay()->toDateString();
                        $state->comment = $id ? 'Update' : 'New';
                        $state->status = 'Booked';
                        $state->save();
                    }
                } else if ($asset[0] == 'asset') {
                    AssetStatus::where('asset_id', $a->id)->delete();
                    $state = new AssetStatus;
                    $state->asset_id = $a->id;
                    $state->campaign_id = $user->id;
                    $state->from_date = Carbon::createFromFormat('d/m/Y', $request->bucket_start_date[$key])->endOfDay()->toDateTimeString();
                    $state->to_date = Carbon::createFromFormat('d/m/Y', $request->bucket_end_date[$key])->startOfDay()->toDateString();
                    $state->comment = $id ? 'Update' : 'New';
                    $state->status = 'Booked';
                    $state->save();
                }
            }
            if (count($ids)) {
                CampaignBucket::where('campaign_id', $user->id)->whereNotIn('id', $ids)->delete();
            } else {
                CampaignBucket::where('campaign_id', $user->id)->delete();
            }
        }
        if (count($not)) {
            return redirect()->route('admin-campaign-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully without " . implode(', ', $not) . ' Check availability']);
        }
        return redirect()->route('admin-campaign-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }

    public function changeStatus(Request $request, $id)
    {
        $campaign = Campaigns::with('buckets')->findOrFail($id);
        if (in_array($request->campaign_status, ['Completed', 'Cancelled'])) {
            AssetStatus::where('campaign_id', $id)->delete();
            foreach ($campaign->buckets as $bucket) {
                $state = new AssetStatus;
                $state->asset_id = $bucket->asset;
                $state->campaign_id = null;
                $state->from_date = now();
                $state->to_date = null;
                $state->comment = 'New';
                $state->status = 'Available';
                $state->save();
            }
        }

        CampaignStatus::where('campaign_id', $id)->delete();
        $state = new CampaignStatus;
        $state->campaign_id = $id;
        $state->status = $request->campaign_status;
        $state->save();

        $campaign->status = $request->campaign_status;
        $campaign->save();
        return redirect()->route('admin-campaign-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "Updated Successfully!"]);
    }

    public function assignCampaign($id)
    {
        $campaign = Campaigns::with('assignee')->find($id);
        $users = User::all();
        $action = route('admin-campaign-assign-post', ['id' => $id]);
        return view('pages.campaign.inner.users', compact('users', 'action', 'campaign'))->render();
    }

    public function assignCampaignPost(Request $request, $id)
    {
//        $campaign = Campaigns::find($id);
//        $campaign->assignee()->sync($request->user);
        CampaignAssign::where('campaign_id', $id)->delete();
        $state = new CampaignAssign;
        $state->campaign_id = $id;
        $state->user_id = $request->user;
        $state->save();
        return redirect()->route('admin-campaign-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "Assigned Successfully!"]);
    }

//    public function changeCampaignStatus(Request $request, $id)
//    {
//        CampaignStatus::where('campaign_id', $id)->delete();
//        $state = new CampaignStatus;
//        $state->campaign_id = $id;
//        $state->status = $request->status;
//        $state->save();
//        return redirect()->route('admin-campaign-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "Updated Successfully!"]);
//    }


    public function getCampaignPhotos($id)
    {
        $data = Campaigns::with('photos')->find($id);
        // dd($data);
        return view('pages.campaign.inner.photos', compact('data'))->render();
    }

    public function getCampaignPermits($id)
    {
        $data = Campaigns::with('permits')->find($id);
        return view('pages.campaign.inner.permits', compact('data'))->render();
    }

    public function getCampaignPermitsAdd($id, $permit_id = null)
    {
        $data = new CampaignPermits;
        $url = route('admin-campaign-campaign-permits-add', ['id' => $id]);
        if ($permit_id) {
            $url = route('admin-campaign-campaign-permits-add', ['id' => $id, 'permit_id' => $permit_id]);
            $data = CampaignPermits::find($permit_id);
        }
        return view('pages.campaign.inner.addPermit', compact('data', 'url'));
    }

    public function getCampaignPermitsAddPost(Request $request, $id, $permit_id = null)
    {
        if ($permit_id) {
            $obj = CampaignPermits::find($permit_id);
        } else {
            $obj = new CampaignPermits;
            $obj->campaign_id = $id;
        }
        $obj->description = $request->description;
        if ($request->hasFile('permit_file')) {
            $filename = $request->file('permit_file')->getClientOriginalName();
            $path = Storage::disk('s3')->putFileAs('permit_file', $request->permit_file, $filename, 'public');
            $obj->permit_file = config('filesystems.disks.s3.url') . '/' . $path;

//            $file = request()->file('permit_file');
//            $name = $file->store('permit_file', ['disk' => 'my_files']);
//            $obj->permit_file = $name;
        }
        $obj->save();
        return redirect()->route('admin-campaign-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "Permit added successfully!"]);
    }

    public function overview($id)
    {
        $data = Campaigns::with(['client', 'buckets', 'buckets.locations', 'buckets.assets', 'assignee', 'photos', 'permits', 'campaignStatus' => function ($q) {
            $q->withTrashed();
        }])->find($id);
        return view('pages.campaign.overview', compact('data'));
    }

    public function getCampaignMonths(Request $request)
    {
        $month_array = [
            '1' => range(1, Carbon::createFromFormat('m/Y', '1/' . $request->data)->daysInMonth),
            '2' => range(1, Carbon::createFromFormat('m/Y', '2/' . $request->data)->daysInMonth),
            '3' => range(1, Carbon::createFromFormat('m/Y', '3/' . $request->data)->daysInMonth),
            '4' => range(1, Carbon::createFromFormat('m/Y', '4/' . $request->data)->daysInMonth),
            '5' => range(1, Carbon::createFromFormat('m/Y', '5/' . $request->data)->daysInMonth),
            '6' => range(1, Carbon::createFromFormat('m/Y', '6/' . $request->data)->daysInMonth),
            '7' => range(1, Carbon::createFromFormat('m/Y', '7/' . $request->data)->daysInMonth),
            '8' => range(1, Carbon::createFromFormat('m/Y', '8/' . $request->data)->daysInMonth),
            '9' => range(1, Carbon::createFromFormat('m/Y', '9/' . $request->data)->daysInMonth),
            '10' => range(1, Carbon::createFromFormat('m/Y', '10/' . $request->data)->daysInMonth),
            '11' => range(1, Carbon::createFromFormat('m/Y', '11/' . $request->data)->daysInMonth),
            '12' => range(1, Carbon::createFromFormat('m/Y', '12/' . $request->data)->daysInMonth),
        ];
        $data = Campaigns::with(['department' => function($q){
            $q->select('id','name');
        }])->select('id', 'name', 'start_date','end_date','department_id')->whereYear('start_date', $request->data)->whereIn('status', ['Active', 'Live'])->get()->map(function($q){
            $q->date_range = $this->getDatePeriod($q->start_date,$q->end_date);
//            $q->start_month = Carbon::parse($q->start_date)->format('F');
//            $q->end_month = Carbon::parse($q->end_date)->format('F');
//            $q->start_day = Carbon::parse($q->start_date)->day;
//            $q->end_day = Carbon::parse($q->end_date)->day;
            return $q;
        });
//        dd($data);
        $year = $request->data;
        return view('pages.campaign_months', compact('year','month_array', 'data'))->render();
    }

    public function getDatePeriod($start,$end){
        $period = CarbonPeriod::create($start,$end);
        foreach($period as $p){
            $days[$p->year][$p->month][] = $p->day;
        }
        return $days;
        dd($days,$period->toArray());
    }

}
