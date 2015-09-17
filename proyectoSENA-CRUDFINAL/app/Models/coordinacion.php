<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class coordinacion extends Model {

	//
	protected $table = 'coordinacionM';
	protected $fillable = ['Nombre','FK_Centro'];
	protected $guarded = ['id'];

}
