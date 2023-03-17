<?php
use App\Models\CampaignBucket;
use App\Models\Campaigns;
use App\Models\AssetStatus;
use Carbon\Carbon;

function getFormattedTime($seconds)
{
    $seconds = (int)$seconds;
    $days = floor($seconds / 86400);
    $hours = floor(($seconds - ($days * 86400)) / 3600);
    $minutes = floor(($seconds / 60) % 60);
    return str_pad($days, 2, '0', STR_PAD_LEFT) . ' ' . str_pad($hours, 2, '0', STR_PAD_LEFT) . ':' . str_pad($minutes, 2, '0', STR_PAD_LEFT);
}

function getFormattedTimeHuman($seconds)
{
    $seconds = (int)$seconds;
    $days = floor($seconds / 86400);
    $hours = floor(($seconds - ($days * 86400)) / 3600);
    $minutes = floor(($seconds / 60) % 60);
    $return = '';
    if($days){
        $return .= $days . ' days, ';
    }
    if($hours){
        $return .=   $hours . ' hours, ';
    }
    return $return. $minutes . ' minutes';
}

function getAssetAndNetwork($select = [])
{
    // print_r($select);exit();
    $assets = \App\Models\Assets::select('id', 'name', 'ref_no')->get();
    $networks = \App\Models\AssetNetwork::select('id', 'name')->get();
    // $options = '<option selected disabled>Select Asset</option>';
    $options = '';
    // if ($networks->count()) {
    //     $options .= '<optgroup label="Networks">';
    //     foreach ($networks as $n) {
    //         if (count($select) && $select[0] == 'network') {
    //             $options .= '<option value="network:' . $n->id . '" '.($n->id == $select[1] ? 'selected="selected"' : '') . ' >' . $n->name . '</option>';
    //         } else {
    //             $options .= '<option value="network:' . $n->id . '">' . $n->name . '</option>';
    //         }
    //     }
    //     $options .= '</optgroup>';
    // }
    if ($assets->count()) {
        $options .= '<optgroup label="Assets">';
        foreach ($assets as $a) {
            if (count($select)) {
                foreach($select as $key => $list)
                {
                    $options .= '<option value="asset:' . $a->id . '" '.($a->id == $list ? 'selected="selected"' : '') . ' >' . $a->name .' : ' . $a->ref_no . '</option>';
                }
            } else {
                $options .= '<option value="asset:' . $a->id . '">' . $a->name .' : ' . $a->ref_no . '</option>';
            }
        }
        $options .= '</optgroup>';
    }
    return $options;
}

function getAssetAndNetworkNew($name=null,$deparment=null,$location=null,$assettype=null,$package_type=null,$startdate=null,$enddate=null,$select = [])
{
    $assets = \App\Models\Assets::select('id', 'name', 'ref_no');
    // $assets = \App\Models\Assets::select('*');
   
    if($deparment)
        $assets = $assets->where('department_id',$deparment);
    if($location)
        $assets = $assets->where('location_id',$location);
    if($assettype)
        $assets = $assets->where('type',$assettype);
    if($package_type)
        $assets = $assets->where('package_type',$package_type);
    if($name)
        $assets = $assets->where('name',$name);

    $assets=$assets->get()->toArray();
    $options = '';
    if (count($select)) {        
        $options .= '<optgroup label="Assets">';
        foreach ($assets as $a) {

            $options .= '<option value="asset:' . $a['id'] . '" ';
            foreach($select as $key => $list)
            {
                if($a['id'] == $list)
                {
                    $options .= 'selected="selected"';
                }                
            }
            $options .= ' >' . $a['name'] .' : ' . $a['ref_no'] . '</option>';
            // foreach($select as $key => $list)
            // {
            //     echo "<pre>";print_r($a['id'].'-'.$list);
            //     $options .= '<option value="asset:' . $a['id'] . '" '.($a['id'] == $list ? 'selected="selected"' : '') . ' >' . $a['name'] .' : ' . $a['ref_no'] . '</option>';
            // }
            // } else {
            //     $options .= '<option value="asset:' . $a['id'] . '">' . $a['name'] .' : ' . $a['ref_no'] . '</option>';
            // }
        }
        $options .= '</optgroup>';        
    }else
    {
        $startdate = Carbon::createFromFormat('d/m/Y', $startdate)->format('Y-m-d');
        $enddate = Carbon::createFromFormat('d/m/Y', $enddate)->format('Y-m-d');

        $booked = AssetStatus::select('asset_id', DB::raw("count(asset_id) as asset_count"))->where(function($query) use($startdate,$enddate){
                    $query->where('from_date','>=',$startdate)
                        ->where('from_date','<=',$enddate);
                })
                ->orWhere(function($query) use($startdate,$enddate){
                    $query->where('to_date','>=',$startdate)
                    ->where('to_date','<=',$enddate);
                })
                ->orWhere(function($query) use($startdate,$enddate){
                    $query->where('from_date','<=',$startdate)
                    ->where('to_date','>=',$enddate);
                })
                ->groupBy('asset_id')
                ->with('asset')
                ->get()->toArray();
        
        

        if($booked){
            $booked = array_filter($booked, function ($var){
                return $var['asset_count'] >= $var['asset']['slots'];
            });
        }
        // echo"<pre>";print_r($booked);exit();

        $booked = array_column($booked,'asset_id');
    
        if($booked){
            $assets = array_filter($assets, function ($var) use ($booked) {
                return !in_array($var['id'],$booked);
            });
        }
        // return($newassets);

        if (count($assets) > 0) {
            $options .= '<optgroup label="Assets">';
            foreach ($assets as $a) {
                if (count($select) && $select[0] == 'asset') {
                    $options .= '<option value="asset:' . $a['id'] . '" '.($a['id'] == $select[1] ? 'selected="selected"' : '') . ' >' . $a['name'] .' : ' . $a['ref_no'] . '</option>';
                } else {
                    $options .= '<option value="asset:' . $a['id'] . '">' . $a['name'] .' : ' . $a['ref_no'] . '</option>';
                }
            }
            $options .= '</optgroup>';
        }  
    }
    return $options;
}


function changeAssetStatus($id,$status = 'Booked'){
    \App\Models\AssetStatus::where('asset_id',$id)->delete();
    $asset = new \App\Models\AssetStatus;
    $asset->asset_id = $id;
    $asset->status = $status;
    return $asset->save();
}


function changeCampaignStatus($id){
    $campaign = Campaigns::with('buckets')->find($id);
    if($campaign->has('buckets'))
    {
        $proofstatus = CampaignBucket::where('campaign_id',$id)->where('proof_status',0)->get();
        if(count($proofstatus) == 0)
        {
            $campaign->status = 'Completed';
            $campaign->save();
        }
        else
        {
            $campaign->status = 'Active';
            $campaign->save();
        }
    }
}
