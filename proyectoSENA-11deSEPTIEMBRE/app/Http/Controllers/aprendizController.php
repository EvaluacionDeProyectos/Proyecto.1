<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\aprendiz as aprendiz;
use App\Models\ficha as ficha;

class aprendizController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$aprendiz = aprendiz::all();

		//consulta a una vista
    	//$cargos = \DB::table('ver_cargos')->get();
    	
		return \View::make('aprendiz/list',compact('aprendiz'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		$ficha =  ficha::lists('FK_Coordinacion','id');
		return \View::make('aprendiz/new',compact('ficha'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		$aprendiz = new aprendiz;
	    $aprendiz->create($request->all());
	    return redirect('aprendiz');
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
		$aprendiz = aprendiz::find($id); 
		$ficha = ficha::lists('FK_Coordinacion','id');
        return \View::make('aprendiz/update',compact('aprendiz','ficha'));
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
		$aprendiz = aprendiz::find($request->id);
        $aprendiz->Documento = $request->Documento;
        $aprendiz->Tipo_documento = $request->Tipo_documento;
        $aprendiz->Nombres = $request->Nombres;
        $aprendiz->Apellidos = $request->Apellidos;
        $aprendiz->Fecha_nacimiento = $request->Fecha_nacimiento;
        $aprendiz->Correo = $request->Correo;
        $aprendiz->Direccion = $request->Direccion;
        $aprendiz->Telefono = $request->Telefono;
        $aprendiz->Fecha_inicioLectiva = $request->Fecha_inicioLectiva;
        $aprendiz->Fecha_finLectiva = $request->Fecha_finLectiva;
        $aprendiz->Fecha_inicioProductiva = $request->Fecha_inicioProductiva;
        $aprendiz->Fecha_finProductiva = $request->Fecha_finProductiva;
        $aprendiz->Usuario = $request->Usuario;
        $aprendiz->Contraseña = $request->Contraseña;
        $aprendiz->FK_Ficha = $request->FK_Ficha;

        $aprendiz->save();
        return redirect('aprendiz');
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
		$aprendiz = aprendiz::find($id);
        $aprendiz->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$aprendiz = aprendiz::where('nombre','like','%'.$request->nombre.'%')->get(); 
		return \View::make('aprendiz/list',compact('aprendiz')); 
	}

}