<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\programa as programa;

class programaController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$programa = programa::all();

		//consulta a una vista
    	//$cargos = \DB::table('ver_cargos')->get();
    	
		return \View::make('programa/list',compact('programa'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		return \View::make('programa/new');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		$programa = new programa;
	    $programa->create($request->all());
	    return redirect('programa');
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
		$programa = programa::find($id); 
        return \View::make('programa/update',compact('programa'));
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
		$programa = programa::find($request->id);
        $programa->Nombre = $request->Nombre;
        $programa->Descripcion = $request->Descripcion;
        $programa->save();
        return redirect('programa');
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
		$programa = programa::find($id);
        $programa->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$programa = programa::where('nombre','like','%'.$request->nombre.'%')->get(); 
		return \View::make('programa/list',compact('programa')); 
	}

}