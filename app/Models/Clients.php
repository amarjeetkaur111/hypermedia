<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;

class Clients extends Model
{
    use HasFactory,Userstamps;
    protected $table = 'clients';

    public function handler(){
        return $this->hasOne(User::class,'id','client_handler');
    }
}
