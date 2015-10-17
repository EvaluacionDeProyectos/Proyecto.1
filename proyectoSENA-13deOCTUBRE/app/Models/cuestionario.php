<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class cuestionario extends Model {

	//
	protected $table = 'cuestionarioM';
	protected $fillable = ['Nombre','Fecha'];
	protected $guarded = ['id'];
}
