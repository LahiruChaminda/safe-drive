<?php

namespace App\Http\Controllers;

class CollisionController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('collision');
    }

}