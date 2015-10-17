<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\instructor as instructor;

class instructorController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$instructor = instructor::all();

		//consulta a una vista
    	//$cargos = \DB::table('ver_cargos')->get();
    	
		return \View::make('instructor/list',compact('instructor'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		return \View::make('instructor/new');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		$instructor = new instructor;
	    $instructor->create($request->all());
	    return redirect('instructor');
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
		$instructor = instructor::find($id); 
        return \View::make('instructor/update',compact('instructor'));
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
		$instructor = instructor::find($request->id);
        $instructor->Documento = $request->Documento;
        $instructor->Tipo_documento = $request->Tipo_documento;
        $instructor->Nombres = $request->Nombres;
        $instructor->Apellidos = $request->Apellidos;
        $instructor->Correo = $request->Correo;
        $instructor->tipoInstructor = $request->tipoInstructor;

        $instructor->save();
        return redirect('instructor');
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
		$instructor = instructor::find($id);
        $instructor->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$instructor = instructor::where('nombre','like','%'.$request->nombre.'%')->get(); 
		return \View::make('instructor/list',compact('instructor')); 
	}

}