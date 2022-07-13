<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\TeamsModel;
use Illuminate\Http\Request;
use DataTables;

class teamsController extends Controller
{

    public function index(Request $request)
    {
        if($request->ajax()){
            $data = TeamsModel::with('supervisor','members')->select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $btn = '<a href="'.route('admin-teams-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>';

                    return $btn;
                })
                ->addColumn('supervisor_id',function($row){
                    return $row->supervisor ? $row->supervisor->name : $row->supervisor_id;
                })
                ->addColumn('members',function($row){
                    return $row->members ? $row->members->count() : 0;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.teams.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-teams-add');
        $add = 'Add';
        if ($id) {
            $data = TeamsModel::with('supervisor','members')->find($id);
            $action = route('admin-teams-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.teams.add', compact('data', 'action', 'add'));
    }

    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $user = new TeamsModel;
        if ($id) {
            $add = 'Edit';
            $user = TeamsModel::find($id);
        }
        if ($id) {

            $this->validate($request, [
                'name' => 'required|unique:teams,name,' . $id.'id',
            ]);
        } else {

            $this->validate($request, [
                'name' => 'required|unique:teams,name',
            ]);
        }
        $user->name = $request->input('name');
        $user->supervisor_id = $request->input('supervisor');
        $user->save();
        $user->members()->sync($request->input('team_members'));
//        $user->syncRoles($request->input('roles'));

        return redirect()->route('admin-teams-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}

