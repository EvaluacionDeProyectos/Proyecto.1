<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class dficha extends Model {

	//
	protected $table = 'detalle_fichasM';
	protected $fillable = ['FK_Ficha','FK_Instructor','Titular'];
	protected $guarded = ['id'];

}
