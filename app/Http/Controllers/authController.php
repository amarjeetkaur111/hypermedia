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
        if (Auth::check()) {
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
