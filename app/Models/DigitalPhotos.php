<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;

class DigitalPhotos extends Model
{
    use HasFactory,Userstamps;
    protected $table = 'campaign_monitoring';

    public function campaign(){
        return $this->hasOne(Campaigns::class,'id','campaign_id');
    }
}
