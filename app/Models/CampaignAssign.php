<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class CampaignAssign extends Model
{
    use HasFactory,Userstamps,SoftDeletes;

    protected $table = 'campaign_assign';
}
