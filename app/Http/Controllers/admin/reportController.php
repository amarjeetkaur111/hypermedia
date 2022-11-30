<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Campaigns;

class reportController extends Controller
{
    public function campaign()
    {
        return view('pages.reports.campaign');
    }

    public function getCampaign(Request $request)
    {
    //    print_r($request->all()); exit();

       if($request->has('all'))
       {
            $this->validate($request, [
                'startdate' => 'required',
                'enddate' => 'required',
            ]);

            $startdate = Carbon::createFromFormat('d/m/Y', $startdate)->format('Y-m-d');
            $enddate = Carbon::createFromFormat('d/m/Y', $enddate)->format('Y-m-d');

            $camps = Campaigns:: where(function($query) use ($startdate,$enddate){
                $query->where('start_date', '>=', $starttime);
                $query->where('end_date', '>=', $endtime);
            });
       }elseif($request->has('one'))
       {
            $this->validate($request, [
                'location' => 'required',
                'campaign' => 'required',
            ]);

            
            if($request->has('pp'))
            {
            
            }
       }
    }
}
