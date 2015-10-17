<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\cuestionario as cuestionario;

class cuestionarioController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$cuestionario = cuestionario::all();

		//consulta a una vista
    	//$cargos = \DB::table('ver_cargos')->get();
    	
		return \View::make('cuestionario/list',compact('cuestionario'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		return \View::make('cuestionario/new');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		$cuestionario = new cuestionario;
	    $cuestionario->create($request->all());
	    return redirect('cuestionario');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
		$cuestionario = cuestionario::find($id); 
        return \View::make('cuestionario/update',compact('cuestionario'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update(Request $request)
	{
		//
		$cuestionario = cuestionario::find($request->id);
        $cuestionario->Nombre = $request->Nombre;
        $cuestionario->Fecha = $request->Fecha;
        $cuestionario->save();
        return redirect('cuestionario');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
		$cuestionario = cuestionario::find($id);
        $cuestionario->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$cuestionario = cuestionario::where('Nombre','like','%'.$request->nombre.'%')->get(); 
		return \View::make('cuestionario/list',compact('cuestionario')); 
	}

}