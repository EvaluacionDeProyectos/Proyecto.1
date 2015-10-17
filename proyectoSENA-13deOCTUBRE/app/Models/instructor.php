<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class instructor extends Model {

	protected $table = 'instructorM';
	protected $fillable = ['Documento','Tipo_documento','Nombres','Apellidos','Correo','tipoInstructor'];
	protected $guarded = ['id'];


}
