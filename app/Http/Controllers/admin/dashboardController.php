<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\registrationsModel;
use App\Models\sceneModel;
use Illuminate\Http\Request;

use App\Models\AssetNetwork;
use App\Models\Assets;
use App\Models\AssetStatus;
use App\Models\CampaignAssign;
use App\Models\CampaignBucket;
use App\Models\CampaignPermits;
use App\Models\Campaigns;
use App\Models\CampaignStatus;
use App\Models\Clients;
use App\Models\Departments;

class dashboardController extends Controller
{
//    public function __construct()
//    {
//        $this->middleware(function($request,$next){
////            if()
//            return $next($request);
//        });
//    }


    public function index(){
        $totalCampaigns = Campaigns::all()->toArray();
        $data['totalCampaigns'] =count($totalCampaigns);

        $data['currentYear'] = $currentYear = date('Y');
        $today = date('Y-m-d');
        $actualCampaigns = array_filter($totalCampaigns, function($v, $k) use($currentYear){
            return date('Y',strtotime($v['created_at'])) >= $currentYear;
        }, ARRAY_FILTER_USE_BOTH);

        $data['activeCampaigns'] = count(array_filter($totalCampaigns, function($v, $k) {
            return date('Y',strtotime($v['status'])) >= 'Active';
        }, ARRAY_FILTER_USE_BOTH));

        $data['currentYearTotalCampaign'] = count($actualCampaigns);

        $data['clients'] = Clients::count();

        $todayAssets = AssetStatus::whereDate('from_date','<=',$today)->whereDate('to_date','>=',$today)->where('status','Booked')->get()->groupBy('asset_id')->toArray();

        $data['todayAssetsCount'] = count($todayAssets);

        $last12MonthsCampaigns = array();
        $last12Months = array();
        $departments = Departments::select('id','name')->get();
        foreach($departments as $d => $department)
        {
            $last12MonthsCampaigns[$d]['department'] =$department->name;
            for ($i = 0; $i <= 11; $i++) {
                $last12Months[$i] = date("M y", strtotime( date( 'Y-m-01' )." -$i months"));
                $last12MonthsCampaigns[$d]['data'][] = count(array_filter($totalCampaigns, function($v, $k) use($last12Months,$i,$department){
                    return date('M y',strtotime($v['start_date'])) == $last12Months[$i] && $v['department_id'] == $department->id;
                }, ARRAY_FILTER_USE_BOTH));
            }
        }
        $data['last12MonthsCampaigns'] =  $last12MonthsCampaigns;
        $data['last12Months'] =  $last12Months;
        $data['departments'] =  array_column($departments->toArray(),'name');


        $assetsCount = Assets::groupBy('owned_by')->selectRaw('count(*) as total, owned_by')->get()->toArray();

        $clients = Clients::select('id','name')->get();
        $campaignClientCount = Campaigns::with('client')->groupBy('client_name')->selectRaw('count(*) as total, client_name')->get()->toArray();

        $data['assetsCount'] = $assetsCount;
        $data['campaignClientCount'] = $campaignClientCount ?? null;

        $types = array('Static','Digital','Promo Space','Not Selected');
        $last5YearsCampaigns = array();
        foreach($types as $t => $type)
        {
            if($type == 'Not Selected')
                $typechange = 'Select';
            else
                $typechange = $type;

            $last5YearsCampaigns[$t]['type'] =$type;
            for ($i = 0; $i <= 4; $i++) {
                $last5Years[$i] = date("Y", strtotime( date( 'Y' )." -$i years"));
                $last5YearsCampaigns[$t]['data'][] = count(array_filter($totalCampaigns, function($v, $k) use($last5Years,$i,$typechange){
                    return date('Y',strtotime($v['start_date'])) == $last5Years[$i] && $v['type'] == $typechange;
                }, ARRAY_FILTER_USE_BOTH));
            }
        }

        $data['last5YearsCampaigns'] =  $last5YearsCampaigns;
        $data['last5Years'] =  $last5Years;

        $lastYear = date("Y-m-d", strtotime($today." -1 year"));
        $lastYearCampaigns =array_filter($totalCampaigns, function($v, $k) use($lastYear){
            return date('Y-m-d',strtotime($v['start_date'])) >= $lastYear;
        }, ARRAY_FILTER_USE_BOTH);

        echo"<pre>";print_r($data['lastYearCampaigns']);exit();
        // $data['activeCampaigns'] = Campaigns::where('status','Active')->count();
        return view('pages.dashboard',compact('data'));
    }
}
