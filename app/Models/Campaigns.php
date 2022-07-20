<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class Campaigns extends Model
{
    use HasFactory,Userstamps,SoftDeletes;

    protected $table = 'campaign';

    public function client(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Clients::class,'id','client_name');
    }

    public function buckets(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(CampaignBucket::class,'campaign_id','id');
    }

    public function assignee(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(User::class,(new CampaignAssign)->getTable(),'campaign_id','user_id','id','id');
    }

    public function photos(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(DigitalPhotos::class,'campaign_id','id');
    }

    public function permits(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(CampaignPermits::class,'campaign_id','id');
    }

    public function campaignStatus(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(CampaignStatus::class,'campaign_id','id');
    }
    public function department(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Departments::class,'id','department_id');
    }
    public function campaignInstallationsTypes(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(InstallationTypes::class,'campaign_id','id');
    }
}
