<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;


class ProofPictures extends Model
{
    use HasFactory,Userstamps;
    protected $table = 'proof_pictures';
    
    protected $fillable = ['campaign_proof_id','image'];

    public function campaign_proof(){
        return $this->hasOne(CampaignProof::class,'id','campaign_proof_id');
    }
}
