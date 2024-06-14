<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\UserController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/    
Route::controller(UserController::class)->group(function() {
    Route::post('register', 'storeUser');
    Route::post('login', 'authUser');

});

Route::middleware('auth:sanctum')->group(function () {
    Route::get('contact/{id}', [ContactController::class, 'index']);
    Route::delete('delete-contact/{id}',[ContactController::class, 'destroy']);
    Route::post('add-contact/{id}',[ContactController::class, 'storeContact']);
    Route::put('edit-contact/{id}',[ContactController::class, 'update']);
    Route::delete('auth/token',[UserController::class, 'removeToken']);
});