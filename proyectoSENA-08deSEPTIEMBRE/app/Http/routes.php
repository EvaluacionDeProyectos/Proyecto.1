<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/ins1', 'userController@formulario');
Route::get('/ins2', 'userController@formulario');
Route::get('/ins3', 'userController@formulario');

Route::get('/', 'WelcomeController@index');
//ruta que nos llevara al home si escribimos /home en el navegador
Route::get('home', 'HomeController@index');

Route::resource('regional','regionalController');

Route::get('regional/destroy/{id}', ['as' => 'regional/destroy', 'uses'=>'regionalController@destroy']);
//ruta para realizar busqueda de registros.
Route::post('regional/search', ['as' => 'regional/search', 'uses'=>'regionalController@search']);

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);
