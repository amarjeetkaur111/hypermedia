<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Locations;
use Illuminate\Http\Request;
use DataTables;

class locationsController extends Controller
{
    public function index(Request $request)
    {
        if($request->ajax()){
            $data = Locations::select('*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){

                    $btn = '<a href="'.route('admin-locations-add',['id' => $row->id]).'" class="edit btn btn-primary btn-sm">Edit</a>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('pages.locations.index');
    }

    public function add($id = null)
    {
        $data = null;
        $action = route('admin-locations-add');
        $add = 'Add';
        if ($id) {
            $data = Locations::find($id);
            $action = route('admin-locations-add', ['id' => $id]);
            $add = 'Edit';
        }
        return view('pages.locations.add', compact('data', 'action', 'add'));
    }

    public function addPost(Request $request, $id = null)
    {
        $add = 'Add';
        $user = new Locations;
        if ($id) {
            $add = 'Edit';
            $user = Locations::find($id);
        }
        if ($id) {

            $this->validate($request, [
                'name' => 'required|unique:locations,name,' . $id.'id',
            ]);
        } else {

            $this->validate($request, [
                'name' => 'required|unique:locations,name',
            ]);
        }
        $user->name = $request->input('name');
        $user->building_name = $request->input('building_name');
        $user->street = $request->input('street');
        $user->city = $request->input('city');
        $user->country = $request->input('country');
        $user->area = $request->input('area');
        $user->near_by_landmark = $request->input('near_by_landmark');
        $user->status = $request->input('status');
        $user->save();

        return redirect()->route('admin-locations-index')->with(['status' => 'Success', 'class' => 'success', 'msg' => "{$add}ed Successfully!"]);
    }
}
