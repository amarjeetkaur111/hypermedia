<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Departments;
use Illuminate\Http\Request;
use DataTables;

class departmentController extends Controller
{

    public function index(Request $request)
    {
        if($request->ajax()){
            $data = Departments::select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){

                    $btn = '<a href="'.route('admin-departments-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.departments.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-departments-add');
        $add = 'Add';
        if ($id) {
            $data = Departments::find($id);
            $action = route('admin-departments-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.departments.add', compact('data', 'action', 'add'));
    }

    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $user = new Departments;
        if ($id) {
            $add = 'Edit';
            $user = Departments::find($id);
        }
        if ($id) {

            $this->validate($request, [
                'name' => 'required|unique:departments,name,' . $id.'id',
            ]);
        } else {

            $this->validate($request, [
                'name' => 'required|unique:departments,name',
            ]);
        }
        $user->name = $request->input('name');
        $user->status = $request->input('status');
        $user->save();

        return redirect()->route('admin-departments-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}
