<?php

use Illuminate\Database\Seeder;

//llamamos el Seeder de laravel
class UserTableSeeder extends Seeder {

	//CMD ejecutar "composer dump-autoload" si no funciona el siguiente codigo
	//CMD metodo para cargar registro con el codigo "php artisan db:seed" 
	public function run ()
	{

		//datos que se van a insertar en la tabla "users" con un array
		//registrar una cantidad 'X' de users a la ves
$faker = Faker\Factory::create('es_ES');

		for($i=0; $i<100 ;$i++){
		$id =\DB::table('users')->insertGetId(array (
			'name'     => $faker->firstName,
			'email'    => $faker->email,
			'password' => bcrypt('secret')



/*

\DB::table('users')->insert(array (
			'name'     => 'andres',
			'email'    => 'andres@git.com',

			//contraseña encriptada
			'password' => bcrypt('extreme')
*/
		));


		}
	}
}


