<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class TeamMembersModel extends Model
{
    use HasFactory,Userstamps;
    protected $table = 'team_members';

    public function users()
    {
        return $this->hasOne(User::class, 'id', 'member_id');
    }
}
