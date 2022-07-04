<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Http\Request;
use DataTables;

class roleController extends Controller
{
    public function index(Request $request)
    {
        if($request->ajax()){
            $data = Role::select('*');
            return DataTables::eloquent($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){

                           $btn = '<a href="'.route('admin-roles-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>';

                            return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }
        return view('pages.roles.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-roles-add');
        $add = 'Add';
        $permissions = Permission::get();
        if($id){
            $data = Role::with('permissions')->find($id);
            $action = route('admin-roles-add',['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.roles.add',compact('data','action','add','permissions'));
    }

    public function addPost(Request $request,$id = null)
    {
        $add = 'Add';
        $role = new Role;
        if ($id) {
            $add = 'Edit';
            $role = Role::find($id);
        }
        if ($id) {

            $this->validate($request, [
                'name' => 'required|unique:roles,id,' . $id,
                'permissions' => 'required',
            ]);
        } else {

            $this->validate($request, [
                'name' => 'required|unique:roles,name',
                'permissions' => 'required',
            ]);
        }
        $role->name = $request->input('name');
        $role->save();
        $role->syncPermissions($request->input('permissions'));
        return redirect()->route('admin-roles-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}
