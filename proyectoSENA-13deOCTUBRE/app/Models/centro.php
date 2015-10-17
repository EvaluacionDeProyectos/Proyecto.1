<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class centro extends Model {

	//
	protected $table = 'centroM';
	protected $fillable = ['Descripcion','Direccion','FK_Regional'];
	protected $guarded = ['id'];
}
