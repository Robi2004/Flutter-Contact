<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function storeUser(Request $request){
        $request->validate([
            'login' => 'required',
            'email' => 'required',
            'password' => 'required',
            'device_name' => 'required']);
        $user = User::create([
            'login' => $request->login,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'device_name' => $request->device_name,
        ]);
        
        $token = $user->createToken($request->device_name)->plainTextToken;
        $reponse = ['token' => $token, 'user_id' => $user->id];
        return response($reponse, 201);
    }

    public function removeToken(Request $request){
        $request->user()->tokens()->delete();
        return response()->json(['message' => 'Token révoqué avec succès']);
    }

    public function authUser(Request $request){
        $request->validate([
            'email' => 'required',
            'password' => 'required',
            'device_name' => 'required',]);
        $credentials = $request->only('email', 'password');

        if(Auth::attempt($credentials)){
            $user = Auth::user();
            $token = $user->createToken($request->device_name)->plainTextToken;
            $reponse = ['token' => $token, 'user_id' => $user->id];
            return response($reponse, 201);
        }
        return response()->json(['message' => 'Unauthorized'], 401);
    }
}
