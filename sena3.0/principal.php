
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="Estilos/principal.css" >
	<link rel="stylesheet" href="Estilos/iconos/css/font-awesome.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<header>
	<div id="conlogo">
		<!--	<img src="Resources/banner.png" id="logo"/>-->
	</div>
	<div id="navbar">
		<p id="up"> Sistema de gestion de evaluacion de instructores </p>
		<!--<li><a class="list-group-item" href="#"><i class="fa fa-cog fa-fw"></i>&nbsp; </a></li>
			<ul>
				<li>Cerrar Sesion</li>
				<li>Opciones </li>
				<li>Perfil</li>
			</ul>-->
	</div>
	<div id="lin">
		<img src="Resources/linea2.png" id="linea"/>
	</div>
</header>
<body>
	<nav id="lateral">
		<div id="perfil">
			<img src="Resources/user.png" id="imagen">	
			<p> &nbspBienvenido Aprendiz&nbsp</p>

			<hr>
		</div>
		<div id="datos">
			<strong> Andres Mauricio Quintero Correal</strong><br>
			<!---<span><p>Ficha: </p> <input value="912296" readonly>
			</span>
			<span><p>Correo: </p> <input value="and.quintero32@gmail.com" readonly>
			</span>
			<span><p>Ficha: </p> <input value="912296" readonly>
			</span>
			<span><p>Ficha: </p> <input value="912296" readonly>
			</span>-->

				<li> Documento: TI-971210706
				<li> Ficha: 912296
				<li> Correo: amquintero12@misena.edu.co
				<li> Regional: Distrito Capital
				<li> Centro: Gestion de mercados,logistica y tecnologias de la informacion</li>

					<br><br>
					<hr>
			<ul>		
				<li><Strong> Etapa Lectiva </strong>
				<li>Inicia el: 18/02/2015
				<li>Termina el: 11/12/2015</li>
				<br><br>	
				<li><Strong> Etapa Productiva </strong>
				<li>Inicia el: 14/12/2015
				<li>Termina el: 14/06/2016</li>
			</ul>
			

		</div>
		<div id="ctrl">
			<br>
<?php
	session_start();


	if(isset($_SESSION['u_usuario'])){
		
		echo "<a href=\"includes/cerrar.php\" id=\"cerrar\"> cerrar sesion</a>";
	} else {
		header("Location: index.php");
	}
?>
		</div>
	</nav>
	<section id="central">
		<iframe src="instructores.php" id="iframe" scrolling="yes">
		</iframe>
	</section>
</body>
<footer>
</footer>


</html>
