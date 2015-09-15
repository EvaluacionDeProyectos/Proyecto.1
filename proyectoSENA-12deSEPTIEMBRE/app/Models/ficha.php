<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ficha extends Model {

	protected $table = 'fichaM';
	protected $fillable = ['FK_Coordinacion','FK_Programa'];
	protected $guarded = ['id'];

}
