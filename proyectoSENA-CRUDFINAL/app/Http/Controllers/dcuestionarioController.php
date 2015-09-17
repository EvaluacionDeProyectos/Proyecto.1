<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\dcuestionario as dcuestionario;
use App\Models\cuestionario as cuestionario;
use App\Models\ficha as ficha;
use App\Models\instructor as instructor;


class dcuestionarioController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$dcuestionario = dcuestionario::all();

		//consulta a una vista
    	//$cargos = \DB::table('ver_cargos')->get();
    	$dcuestionario = dcuestionario::orderBy('created_at','DESC')->paginate(4);
		return \View::make('dcuestionario/list',compact('dcuestionario'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		$cuestionario = ['cuestionario' => cuestionario::lists('Nombre','id')];
		$ficha = ['ficha' => ficha::lists('FK_Coordinacion','id')];
		$instructor = ['instructor' => instructor::lists('Nombres','id')];
		return \View::make('dcuestionario/new')->with('cuestionario')->with('ficha')->with('instructor');
		//return \View::make('dcuestionario/new',$cuestionario,$ficha,$instructor);
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//
		$dcuestionario = new dcuestionario;
	    $dcuestionario->create($request->all());
	    return redirect('dcuestionario');
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
		$dcuestionario = dcuestionario::find($id); 
        return \View::make('dcuestionario/update',compact('dcuestionario'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
		$dcuestionario = dcuestionario::find($request->id);
        $dcuestionario->FK_Cuestionario = $request->FK_Cuestionario;
		$dcuestionario->FK_Ficha = $request->FK_Ficha;
        $dcuestionario->FK_Instructor = $request->FK_Instructor;
        $dcuestionario->save();
        return redirect('dcuestionario');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$dcuestionario = dcuestionario::find($id);
        $dcuestionario->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$dcuestionario = dcuestionario::where('FK_Cuestionario','like','%'.$request->FK_Cuestionario.'%')->get(); 
		return \View::make('dcuestionario/list',compact('dcuestionario')); 
	}

}
