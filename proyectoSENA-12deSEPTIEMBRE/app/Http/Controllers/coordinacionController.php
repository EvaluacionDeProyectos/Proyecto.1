<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\coordinacion as coordinacion;
use App\Models\centro as centro;

class coordinacionController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$coordinacion = coordinacion::all();

		//consulta a una vista
    	//$CodinacionCentro = \DB::table('CodinacionCentro')->get();
    	$coordinacion = coordinacion::orderBy('created_at','DESC')->paginate(4);
		return \View::make('coordinacion/list',compact('coordinacion'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		$centro = ['centro' => centro::lists('Descripcion','id')];
		return \View::make('coordinacion/new',$centro); 
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		$coordinacion = new coordinacion;
	    $coordinacion->create($request->all());
	    return redirect('coordinacion');
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
		$coordinacion = coordinacion::find($id); 
        return \View::make('coordinacion/update',compact('coordinacion'));
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
		$coordinacion = coordinacion::find($request->id);
        $coordinacion->Nombre = $request->Nombre;
        $coordinacion->FK_Centro = $request->FK_Centro;
        $coordinacion->save();
        return redirect('coordinacion');
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
		$coordinacion = coordinacion::find($id);
        $coordinacion->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$coordinacion = coordinacion::where('Nombre','like','%'.$request->Nombre.'%')->get(); 
		return \View::make('coordinacion/list',compact('coordinacion')); 
	}

}