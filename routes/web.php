<?php

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index');
Route::get('/user', 'UserController@index');
Route::get('/traveling', 'TravelingController@index');
Route::get('/traveling/locations', 'TravelingController@locations');
Route::get('/collision', 'CollisionController@index');
