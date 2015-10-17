<?php namespace App\Http\Controllers;




class userController extends Controller {

	public function index()
	{
		return view("formulariolaravel");
	}

	public function instructores()
	{
		return view("instructores");
	}
}