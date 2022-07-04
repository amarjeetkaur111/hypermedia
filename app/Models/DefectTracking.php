<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;

class DefectTracking extends Model
{
    use HasFactory,Userstamps;
    protected $table = 'defect_monitoring';

    public function asset(){
        return $this->hasOne(Assets::class,'id','asset_id');
    }

    public function location(){
        return $this->hasOne(Locations::class,'id','location_id');
    }
}
