<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;

class Assets extends Model
{
    use HasFactory,Userstamps;
    protected $table = 'assets';

    public function network(){
        return $this->hasOneThrough(AssetNetwork::class,AssetInNetwork::class,'asset_id','id','id','network_id');
    }

    public function department(){
        return $this->hasOne(Departments::class,'id','department_id');
    }

    public function location(){
        return $this->hasOne(Locations::class,'id','location_id');
    }

    public function assetStatus(){
        return $this->hasOne(AssetStatus::class,'asset_id','id');
    }

    public function proof(){
        return $this->hasOne(CampaignProof::class,'asset_id','id')->orderBy('created_at','DESC');
    }

    
}
