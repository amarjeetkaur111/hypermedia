<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;

class TeamsModel extends Model
{
    use HasFactory, Userstamps, SoftDeletes;

    protected $table = 'teams';

    public function supervisor()
    {
        return $this->hasOne(User::class, 'id', 'supervisor_id');
    }

    public function members()
    {
        return $this->belongsToMany(User::class, (new TeamMembersModel)->getTable(), 'team_id', 'member_id', 'id', 'id');
    }
}
