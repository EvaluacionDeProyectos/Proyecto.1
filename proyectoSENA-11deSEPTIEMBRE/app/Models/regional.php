<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class regional extends Model {

	protected $table = 'regionalM';
	protected $fillable = ['Nombre','Descripcion'];
	protected $guarded = ['id'];

}
