<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ViewUserTravel extends Model
{
    protected $table = 'view_user_travel';

    public function getTravellingLocations()
    {
        $locations = [];
        $result = $this->get();
        $result->each(function ($location, $index) use (&$locations) {
            $locations[] = [
                $location->user_name . ' - ' . $location->created_at,
                $location->lat,
                $location->lon,
                $index + 1

            ];
        });
        return $locations;
    }
}