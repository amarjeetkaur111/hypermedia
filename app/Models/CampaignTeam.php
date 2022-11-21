<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class CampaignTeam extends Model
{
    use HasFactory,Userstamps,SoftDeletes;

    protected $table = 'campaign_team_assign';

    public function members()
    {
        return $this->hasMany(TeamMembersModel::class,'team_id','team_id');
    }
}
