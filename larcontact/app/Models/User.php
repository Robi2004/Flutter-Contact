<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasFactory, HasApiTokens;
    protected $table = 'users';
    public $timestamps = false;
    protected $fillable = ['login', 'password','email'];
    protected $hidden = [
        'password',
        'device_name',
    ];
}
