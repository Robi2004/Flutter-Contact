<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Contact;
use App\Models\User;

class ContactController extends Controller
{
    public function index($id){
        if(User::where('id',$id)->exists()){
            $contacts = Contact::where('user_id',$id)
            ->orderByRaw('firstname ASC')
            ->get();
            return response()->json($contacts);
        }
        else{
            response()->json(["message" => "Impossible de trouver des contacts"], 404);
        }
    }

    public function storeContact($id,Request $request){
        $request->validate([
            'firstname' => 'required',
            'lastname' => 'required',
            'age' => 'required',
        ]);
        Contact::create([
            'firstname' => $request->firstname,
            'lastname' => $request->lastname,
            'age' => $request->age,
            'user_id' => $id,
        ]);
        return response()->json(["message" => "Contact ajouté."], 201);
    }

    public function update($id,Request $request){
        $request->validate([
            'firstname' => 'required',
            'lastname' => 'required',
            'age' => 'required',
        ]);
        if(Contact::where('id',$id)->exists()){
            $contact = Contact::find($id);
            $contact->firstname = is_null($request->firstname) ? $contact->firstname : $request->firstname;
            $contact->lastname = is_null($request->lastname) ? $contact->lastname : $request->lastname;
            $contact->age = is_null($request->age) ? $contact->age : $request->age;
            $contact->update();
            return response()->json(["message" => "Contact mis à jour."],200);
        }
        else{
            return response()->json(["message" => "Contact pas trouver"],404);
        }
    }

    public function destroy($id){
        if(Contact::where('id',$id)->exists()){
            $contact = Contact::find($id);
            $contact->delete();
            return response()->json(["message" => "Contact supprimer."],200);
        }
        return response()->json(["message" => "Contact pas trouver."],404);
    }
}
