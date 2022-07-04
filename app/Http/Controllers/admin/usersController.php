<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Illuminate\Http\Request;
use DataTables;

class usersController extends Controller
{
    public function index(Request $request)
    {
        if($request->ajax()){
            $data = User::select('*');
            return DataTables::eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){

                           $btn = '<a href="'.route('admin-users-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>';

                            return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('pages.users.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-users-add');
        $add = 'Add';
        $roles = Role::get();
        if ($id) {
            $data = User::with('roles')->find($id);
            $action = route('admin-users-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.users.add', compact('data', 'action', 'add','roles'));
    }

    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $user = new User;
        if ($id) {
            $add = 'Edit';
            $user = User::find($id);
        }
        if ($id) {

            $this->validate($request, [
                'name' => 'required|unique:users,name,' . $id.'id',
                'email' => 'required|unique:users,email,' . $id.'id',
            ]);
        } else {

            $this->validate($request, [
                'name' => 'required|unique:users,name',
                'email' => 'required|unique:users,email',
            ]);
        }
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        if($request->has('password') && $request->password){
            $user->password = md5($request->input('password'));
        }
        $user->status = $request->input('status');
        $user->save();
        $user->syncRoles($request->input('roles'));

        return redirect()->route('admin-users-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}
