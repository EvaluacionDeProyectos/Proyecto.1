
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="Estilos/principal.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<header>
	<div id="conlogo"><img src="Resources/logo.png" id="logo"/></div>
	<p id="up"> Sistema de gestion de evaluacion de instructores </p>
</header>
<body>
<nav id="lateral">
	<div id="perfil">

	</div>
	<div id="datos">

	</div>
	<div id="ctrl">
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
</body>
<footer>
</footer>


</html>
