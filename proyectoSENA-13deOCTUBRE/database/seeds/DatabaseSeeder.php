<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class DatabaseSeeder extends Seeder {

	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	//Funcion publica que va a llamar a los Seeder
	public function run()
	{
		Model::unguard();

		$this->call('UserTableSeeder');
	}

}
