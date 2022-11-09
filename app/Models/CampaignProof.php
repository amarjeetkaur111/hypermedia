<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;

class CampaignProof extends Model
{
    use HasFactory,Userstamps;
    protected $table = 'campaign_proof';

    public function campaign(){
        return $this->hasOne(Campaigns::class,'id','campaign_id');
    }

    public function pictures(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ProofPictures::class,'campaign_proof_id','id');
    }

}
