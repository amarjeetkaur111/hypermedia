<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class authController extends Controller
{
    public function login(Request $request)
    {

        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');
        $user = User::where('email', $credentials['email'])->where('password', md5($credentials['password']))->first();

        if (!$user) {
            return redirect()->route('login')->with(['status' => 'Error', 'class' => 'danger', 'msg' => "Invalid Credentials!"]);
        }
        Auth::login($user);
        $name = $user->name;
        if (Auth::check()) {
            session(['username'=>$name]);
            if($user->can('Level7'))
                return redirect()->route('admin-campaign-monitoring-index')
                 ->with(['status' => 'Success','class' => 'success', 'msg' => 'Logged In']);
            elseif($user->can('Level5') || $user->can('Level6'))
                return redirect()->route('admin-campaign-index')
                ->with(['status' => 'Success','class' => 'success', 'msg' => 'Logged In']);
            else
                return redirect()->route('admin-index')
                    ->with(['status' => 'Success','class' => 'success', 'msg' => 'Logged In']);
        }

        return redirect()->route('login')->with(['status' => 'Error', 'class' => 'danger', 'msg' => "Invalid Credentials!"]);

    }

    public function logout()
    {
        auth()->logout();
        return redirect('/login');
    }
}
