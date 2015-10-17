<?php namespace App\Http\Middleware;
//se usa un servisio de laravel de autenticacion
use Closure;
use Illuminate\Contracts\Auth\Guard;

class Authenticate {

	/**
	 * The Guard implementation.
	 *
	 * @var Guard
	 */
	protected $auth;

	/**
	 * Create a new filter instance.
	 *
	 * @param  Guard  $auth
	 * @return void
	 */
	public function __construct(Guard $auth)
	{
		$this->auth = $auth;
	}

	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */

	//este metodo pregunta al servicio de autenticacion
	public function handle($request, Closure $next)
	{
		//si cumple con la autenticacion.....
		if ($this->auth->guest())
		{
			if ($request->ajax())
			{
				//si no cumple, bote error usuario no autorizado para entrar a dicha pagina
				return response('Unauthorized.', 401);
			}
			else
			{
				//Retorne o ingrese a esta pagina
				return redirect()->guest('auth/login');
			}
		}

		return $next($request);
	}

}
