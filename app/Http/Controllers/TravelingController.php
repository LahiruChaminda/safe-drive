<?php

namespace App\Http\Controllers;

use App\Models\ViewUserTravel;

class TravelingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {   $locationsUrl = url('traveling/locations');
        return view('traveling', compact('locationsUrl'));
    }

    public function locations()
    {
        $locations = (new ViewUserTravel)->getTravellingLocations();
        echo json_encode(['locations' => $locations]);
        die;
    }

}