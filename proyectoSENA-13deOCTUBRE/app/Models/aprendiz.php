<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class aprendiz extends Model {

	//
	protected $table = 'aprendizM';
	protected $fillable = ['Documento','Tipo_documento','Nombres','Apellidos','Fecha_nacimiento','Correo','Direccion','Telefono','Fecha_inicioLectiva','Fecha_finLectiva','Fecha_inicioProductiva','Fecha_finProductiva','Usuario','Contraseña','FK_Ficha'];
	protected $guarded = ['id'];

}
