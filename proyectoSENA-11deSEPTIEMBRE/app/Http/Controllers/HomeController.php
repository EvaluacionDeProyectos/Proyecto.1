<?php namespace App\Http\Controllers;

class HomeController extends Controller {


	//Este constructor nos redireccionara al metodo que declaremos
	public function __construct()
	{
		//llamamos auth del controlador haciendo de "middleware" un mediador entre el controlador y la vista
		//si no estubiera esta linea, no hubiera login y redirecciona directamente
		$this->middleware('auth');
	}

	/**
	 * Show the application dashboard to the user
	 *
	 * @return Response
	 */

	//declaramos una funcion "index" que devolvera una vista
	public function index()
	{
		return view('home');
	}

}
