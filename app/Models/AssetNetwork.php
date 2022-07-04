<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class AssetNetwork extends Model
{
    use HasFactory,Userstamps,SoftDeletes;

    protected $table = 'asset_network';

    public function assets(){
        return $this->hasManyThrough(Assets::class,AssetInNetwork::class,'network_id','id','id','asset_id');
    }
}
