<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    //Custom Controller
    Route::get('/custom-controller','Admin\CustomController@index');
    Route::get('/custom-controller/create','Admin\CustomController@create');
    Route::post('/custom-controller','Admin\CustomController@store');
    Route::get('/custom-controller/{id}/edit','Admin\CustomController@edit');
    Route::post('/custom-controller/{id}','Admin\CustomController@update');
    Route::get('/custom-controller/{id}','Admin\CustomController@show');
    Route::get('/custom-controller/delete/{id}','Admin\CustomController@destroy');
});
