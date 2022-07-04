<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class AssetStatus extends Model
{
    use HasFactory,SoftDeletes,Userstamps;
    protected $table = 'asset_status';

    public function asset(){
        return $this->hasOne(Assets::class,'id','asset_id');
    }

    public function campaign(){
        return $this->hasOne(Campaigns::class,'id','campaign_id');
    }
}
