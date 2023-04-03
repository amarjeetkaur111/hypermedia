<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class CampaignBucket extends Model
{
    use HasFactory,Userstamps,SoftDeletes;
    protected $appends = ['asset_data'];
    protected $table = 'campaign_buckets';
    

    public function campaign(){
        return $this->hasOne(Campaigns::class,'id','campaign_id');
    }

    public function locations(){
        return $this->hasOne(Locations::class,'id','location');
    }

    public function assets(){
        return $this->hasOne(Assets::class,'id','asset');
    }

    public function proofpictures()
    {
        return $this->hasOne(CampaignProof::class,'bucket_id','id')->where('status',1);
    }

    // public function proofpictures()
    // {
    //     return $this->belongsTo(CampaignProof::class,'id','bucket_id');
    // }

    public function assetNetwork(){
        return $this->hasOne(AssetNetwork::class,'id','asset_network');
    }

    public function getAssetDataAttribute()
    {
        $assets = explode(", ", $this->asset);
        $asset_set =  Assets::with(['proof' => 
                        function($q)  
                        {return $q->where('bucket_id', $this->id); },'proof.pictures'])
                        ->whereIn('id',$assets)->get();
        return $asset_set;
    }
}
