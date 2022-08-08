<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class InstallationTypes extends Model
{
    use HasFactory,Userstamps,SoftDeletes;
    protected $table = 'campaign_installations';

    public function assignee(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(User::class,(new CampaignInstallationAssign)->getTable(),'campaign_installation_id','user_id','id','id');
    }
}
