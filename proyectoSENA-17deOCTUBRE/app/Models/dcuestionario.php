<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class dcuestionario extends Model {

	//
	protected $table = 'detalle_cuestionarioM';
	protected $fillable = ['FK_Cuestionario','FK_Ficha','FK_Instructor'];
	protected $guarded = ['id'];

}
