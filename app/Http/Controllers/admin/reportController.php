<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Campaigns;
use App\Models\CampaignBucket;
use App\Models\CampaignProof;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use PDF;

class reportController extends Controller
{
    public function campaign()
    {
        return view('pages.reports.campaign');
    }

    public function getCampaign(Request $request)
    {
    //    echo"<pre>";print_r($request->all()); exit();

       if($request->has('all'))
       {
            $this->validate($request, [
                'startdate' => 'required',
                'enddate' => 'required',
            ]);

            $startdate = $request->startdate;
            $enddate = $request->enddate;
            $startdate = Carbon::createFromFormat('d/m/Y', $startdate)->format('Y-m-d');
            $enddate = Carbon::createFromFormat('d/m/Y', $enddate)->format('Y-m-d');

            $camps = Campaigns::with('client','department') 
            ->where(function($query) use ($startdate,$enddate){
                $query->where('start_date', '<=', $startdate);
                $query->where('end_date', '>=', $startdate);
            })
            ->orWhere(function($query) use ($startdate,$enddate){
                $query->where('start_date', '>=', $startdate);
                $query->where('end_date', '<=', $enddate);
            })
            ->orWhere(function($query) use ($startdate,$enddate){
                $query->where('start_date', '>=', $startdate);
                $query->where('start_date', '<=', $enddate);
                $query->where('end_date', '>=', $enddate);
            })
            ->orderBy('start_date','ASC')->get();
            // return view('pages.reports.allCampPdf',compact('camps','startdate','enddate'));
            $pdf = PDF::loadView('pages.reports.allCampPdf',compact('camps','startdate','enddate'));
            $pdf->setOption('enable-javascript', true);
            return $pdf->download('CampaignList.pdf');

            // $csv_headers = array(
            //     "Campaign Name",
            //     "Agency",
            //     "Created At"
            // );
            // $csv_data[] = $csv_headers;r
        
            // foreach ($camps as $camps) {s
            //         $csv_row = array(
            //             "Campaign Name" => $camps->name ,
            //             "Agency" =>  $camps->agency,
            //             "Created At" =>  $camps->start_date,
            //         );    
            //     $csv_data[] = $csv_row;
            // }
            // header("Content-type: application/csv");
            // header("Content-Disposition: attachment; filename=\"login_report".".csv\"");
            // header("Pragma: no-cache");
            // header("Expires: 0");
    
            // $handle = fopen('php://output', 'w');
    
            // foreach ($csv_data as $data) {
            //     fputcsv($handle, $data);
            // }
            // fclose($handle);
            

       }elseif($request->has('one'))
       {
            $this->validate($request, [
                'location' => 'required',
                'campaign' => 'required',
            ]);

            $camp = Campaigns::with('client','department','buckets.assets');
            $ppp = 0;
            // $camp = Campaigns::with('client','department','buckets.assets','buckets.locations','buckets.proofpictures.pictures')->where('id',$request->campaign)->get();           
            if($request->has('pp'))
            {
                $camp = $camp->with('buckets.proofpictures.pictures');
                $ppp = 1;
            }
            $camp = $camp->with(['buckets'=> function($q) use($request){$q->whereIn('location',$request->location);},'buckets.locations']);
            $camp = $camp->where('id',$request->campaign)
            ->get()->toArray();

            // echo"<pre>";print_r($ppp); exit();
            return view('pages.reports.campaignDetail',compact('camp','ppp'));

            $pdf = PDF::loadView('pages.reports.campaignDetail',compact('camp','ppp'));
            return $pdf->download('Campaign Detail.pdf');
       }
    }
}
