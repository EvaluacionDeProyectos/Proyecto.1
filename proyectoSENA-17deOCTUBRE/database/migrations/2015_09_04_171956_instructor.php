<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Instructor extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('instructorM', function(Blueprint $table)
        {
            $table->increments('id');
            $table->bigInteger('Documento');
            $table->enum('Tipo_documento', ['T.I','C.C','CE','PASS','NIT']);
            $table->string('Nombres');
            $table->string('Apellidos');
 			$table->string('Correo');
 		 	$table->enum('tipoInstructor', ['TRANSVERSAL','TECNICO']);
 		 	$table->binary('foto');
            $table->timestamps();
        });
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('instrctorM');
	}


}
