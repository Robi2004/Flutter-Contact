<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $faker = \Faker\Factory::create();
        for($i = 0; $i < 10; $i++){
            DB::table('users')->insert(['login'=>$faker->name,'email'=> $faker->email,'password'=>bcrypt(''),]);}
        for($i = 0; $i < 50; $i++){
            DB::table('contacts')->insert(['firstname'=>$faker->sentence,'lastname'=>$faker->name,'age'=>$faker->randomDigit,'user_id'=> $faker->randomDigitNotZero()]);
        }
    }
}
