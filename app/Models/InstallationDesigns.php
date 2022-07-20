<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;

class InstallationDesigns extends Model
{
    use HasFactory;
    use HasFactory,Userstamps;
    protected $table = 'campaign_installations_designs';

    public function campaignInstallation(){
        return $this->hasOne(InstallationTypes::class,'id','installation_id');
    }
}
