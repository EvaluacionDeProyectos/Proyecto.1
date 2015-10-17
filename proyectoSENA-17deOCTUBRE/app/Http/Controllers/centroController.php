<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\centro as centro;
use App\Models\regional as regional;

class centroController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$centro = centro::all();

		//consulta a una vista
    	//$cargos = \DB::table('ver_cargos')->get();
    	$centro = centro::orderBy('created_at','DESC')->paginate(4);
		return \View::make('centro/list',compact('centro'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		$regional = ['regional' => regional::lists('Nombre','id')];
		return \View::make('centro/new',$regional);
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		$centro = new centro;
	    $centro->create($request->all());
	    return redirect('centro');
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
		$centro = centro::find($id); 
        return \View::make('centro/update',compact('centro'));
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
		$centro = centro::find($request->id);
        $centro->Descripcion = $request->Descripcion;
        $centro->Direccion = $request->Direccion;
        $centro->FK_regional = $request->FK_Regional;
        $centro->save();
        return redirect('centro');
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
		$centro = centro::find($id);
        $centro->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$centro = centro::where('Descripcion','like','%'.$request->Descripcion.'%')->get(); 
		return \View::make('centro/list',compact('centro')); 
	}

}