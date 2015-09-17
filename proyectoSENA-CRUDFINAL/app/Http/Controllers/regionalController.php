<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\regional as regional;

class regionalController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$regional = regional::all();

		//consulta a una vista
    	//$cargos = \DB::table('ver_cargos')->get();
    	
		return \View::make('regional/list',compact('regional'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		return \View::make('regional/new');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		$regional = new regional;
	    $regional->create($request->all());
	    return redirect('regional');
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
		$regional = regional::find($id); 
        return \View::make('regional/update',compact('regional'));
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
		$regional = regional::find($request->id);
        $regional->Nombre = $request->Nombre;
        $regional->Descripcion = $request->Descripcion;
        $regional->save();
        return redirect('regional');
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
		$regional = regional::find($id);
        $regional->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$regional = regional::where('nombre','like','%'.$request->nombre.'%')->get(); 
		return \View::make('regional/list',compact('regional')); 
	}

}