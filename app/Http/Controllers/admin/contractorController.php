<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Contractor;
use Illuminate\Http\Request;
use DataTables;

class contractorController extends Controller
{

    public function index(Request $request)
    {
        if($request->ajax()){
            $data = Contractor::select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){

                    $btn = '<a href="'.route('admin-contractor-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.contractor.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-contractor-add');
        $add = 'Add';
        if ($id) {
            $data = Contractor::find($id);
            $action = route('admin-contractor-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.contractor.add', compact('data', 'action', 'add'));
    }

    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $user = new Contractor;
        if ($id) {
            $add = 'Edit';
            $user = Contractor::find($id);
        }
        if ($id) {

            $this->validate($request, [
                'name' => 'required|unique:contractor,name,' . $id.'id',
                'email' => 'required|unique:contractor,email,' . $id.'id',
            ]);
        } else {

            $this->validate($request, [
                'name' => 'required|unique:contractor,name',
                'email' => 'required|unique:contractor,email',
            ]);
        }
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->phone = $request->input('phone');
        $user->location = $request->input('location');
        $user->status = $request->input('status');
        $user->save();

        return redirect()->route('admin-contractor-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}
