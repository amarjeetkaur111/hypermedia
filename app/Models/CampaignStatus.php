<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class CampaignStatus extends Model
{
    use HasFactory,SoftDeletes,Userstamps;

    protected $table = 'campaign_status';

    public function campaign(){
        return $this->hasOne(Campaigns::class,'id','campaign_id');
    }
}

