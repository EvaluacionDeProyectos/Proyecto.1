<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Evaluacion</title>

	<link href="{{ asset('/css/app.css') }}" rel="stylesheet">
	<link href="{{ asset('/css/admin.css') }}" rel="stylesheet">

	<!-- Fonts -->
	<link href='//fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="{{ url('/') }}">Evaluacion de instructores</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<!--<li><a href="{{ url('regional') }}">Regional</a></li>-->
					<li><a href="{{ url('centro') }}">Centro</a></li>
					<li><a href="{{ url('coordinacion') }}">Coordinacion</a></li>
					<li><a href="{{ url('programa') }}">Programa</a></li>
					<li><a href="{{ url('ficha') }}">Ficha</a></li>
					<li><a href="{{ url('instructor') }}">Instructor</a></li>
					<li><a href="{{ url('aprendiz') }}">Aprendiz</a></li>
					<li><a href="{{ url('cuestionario') }}">Cuestionario</a></li>
					<li><a href="{{ url('dcuestionario') }}">D. Cuestionario</a></li>
					<li><a href="{{ url('dficha') }}">D. Ficha</a></li>
					<li><a href="{{ url('coordinador') }}">Instructor coordinacion</a></li>
					
					
				</ul>

				<ul class="nav navbar-nav navbar-right">
					

				
				<ul class="nav navbar-nav navbar-right">
					@if (Auth::guest())
						<li><a href="{{ url('/auth/login') }}">Iniciar sesion</a></li>
						<li><a href="{{ url('/auth/register') }}">Registrarse</a></li>
					@else
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">{{ Auth::user()->name }} <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="{{ url('/auth/logout') }}">Salir</a></li>
							</ul>
						</li>
					@endif
				</ul>
			</div>

			<div>

			</div>
		
	</nav>
	@yield('content')
	<div class="textadmin" >
	<p>Bienvenido administrador</p>
	<div id="slider">
<figure>
<img class="imagenes" src={{asset("image/Primera.JPG")}} alt="">
<img class="imagenes" src={{asset("image/segundo.JPG")}} alt="">
<img class="imagenes" src={{asset("image/logo.JPG")}} alt="">
<img class="imagenes" src={{asset("image/centro.JPG")}} alt="">


</figure>
</div>
	</div></p>
	

	<!-- Scripts -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>
