<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\dficha as dficha;
use App\Models\ficha as ficha;
use App\Models\instructor as instructor;

class dfichaController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$dficha = dficha::all();

		//consulta a una vista
    	//$CodinacionCentro = \DB::table('CodinacionCentro')->get();
    	$dficha = dficha::orderBy('created_at','DESC')->paginate(4);
    	$instructor = instructor::lists('Nombres','id');
		return \View::make('dficha/list',compact('dficha'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		$ficha = ['ficha' => ficha::lists('FK_Coordinacion','id')];
		$instructor = ['instructor' => instructor::lists('Nombres','id')];
		return \View::make('dficha/new',$ficha,$instructor); 
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		$dficha = new dficha;
	    $dficha->create($request->all());
	    return redirect('dficha');
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
		$dficha = dficha::find($id);
		$instructor = instructor::lists('Nombres','id');
        return \View::make('dficha/update',compact('dficha'));
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
		$dficha = dficha::find($request->id);
        $dficha->FK_Ficha = $request->FK_Ficha;
        $dficha->FK_Instructor = $request->FK_Instructor;
        $dficha->Titular = $request->Titular;
        $dficha->save();
        return redirect('dficha');
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
		$dficha = dficha::find($id);
        $dficha->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$dficha = dficha::where('dficha','like','%'.$request->FK_Ficha.'%')->get(); 
		return \View::make('dficha/list',compact('dficha')); 
	}

}