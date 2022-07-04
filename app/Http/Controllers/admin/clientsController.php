<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Clients;
use Illuminate\Http\Request;
use DataTables;

class clientsController extends Controller
{
    public function index(Request $request)
    {
        if($request->ajax()){
            $data = Clients::select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){

                    $btn = '<a href="'.route('admin-clients-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.clients.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-clients-add');
        $add = 'Add';
        if ($id) {
            $data = Clients::with('handler')->find($id);
            $action = route('admin-clients-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.clients.add', compact('data', 'action', 'add'));
    }

    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $user = new Clients;
        if ($id) {
            $add = 'Edit';
            $user = Clients::find($id);
        }
        if ($id) {

            $this->validate($request, [
                'name' => 'required|unique:clients,name,' . $id.'id',
                'email' => 'required|unique:clients,email,' . $id.'id',
            ]);
        } else {

            $this->validate($request, [
                'name' => 'required|unique:clients,name',
                'email' => 'required|unique:clients,email',
            ]);
        }
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->location = $request->input('location');
        $user->number = $request->input('number');
        $user->type = $request->input('type');
        $user->status = $request->input('status');
        $user->client_handler = $request->input('client_handler');
        $user->save();

        return redirect()->route('admin-clients-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}
