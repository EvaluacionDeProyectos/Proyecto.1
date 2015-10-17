<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\coordinacion as coordinacion;
use App\Models\programa as programa;
use App\Models\ficha as ficha;

class fichaController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$ficha = ficha::all();

		//consulta a una vista
    	//$CodinacionCentro = \DB::table('CodinacionCentro')->get();
    	$ficha = ficha::orderBy('created_at','DESC')->paginate(4);
		return \View::make('ficha/list',compact('ficha'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		$coordinacion = ['coordinacion' => coordinacion::lists('Nombre','id')];
		$programa = ['programa' => programa::lists('Nombre','id')];
		return \View::make('ficha/new',$coordinacion,$programa); 
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		$ficha = new ficha;
	    $ficha->create($request->all());
	    return redirect('ficha');
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
		$ficha = ficha::find($id); 
        return \View::make('ficha/update',compact('ficha'));
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
		$ficha = ficha::find($request->id);
        $ficha->FK_Coordinacion = $request->FK_Coordinacion;
        $ficha->FK_Programa = $request->FK_Programa;
        $ficha->save();
        return redirect('ficha');
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
		$ficha = ficha::find($id);
        $ficha->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$ficha = ficha::where('ficha','like','%'.$request->FK_Coordinacion.'%')->get(); 
		return \View::make('ficha/list',compact('ficha')); 
	}

}