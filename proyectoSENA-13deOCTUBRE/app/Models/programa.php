<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class programa extends Model {

	//
	protected $table = 'programaM';
	protected $fillable = ['Nombre','Descripcion'];
	protected $guarded = ['id'];

}
