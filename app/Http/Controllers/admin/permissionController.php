<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Permission;
use Illuminate\Http\Request;
use DataTables;

class permissionController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Permission::select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {

                    $btn = '<a href="'.route('admin-permissions-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.permissions.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-permissions-add');
        $add = 'Add';
        if ($id) {
            $data = Permission::find($id);
            $action = route('admin-permissions-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.permissions.add', compact('data', 'action', 'add'));
    }


    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $permissions = new Permission;
        if ($id) {
            $add = 'Edit';
            $permissions = Permission::find($id);
        }
        if ($id) {

            $this->validate($request, [
                'name' => 'required|unique:permissions,id,' . $id,
            ]);
        } else {

            $this->validate($request, [
                'name' => 'required|unique:permissions,name',
            ]);
        }
        $permissions->name = $request->input('name');
        $permissions->save();
        return redirect()->route('admin-permissions-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}
