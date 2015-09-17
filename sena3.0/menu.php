<!DOCTYPE html>
<html>
<head>
	<title> Menu </title>
	<link rel="stylesheet" href="Estilos/menu.css">
</head>


<body>
<nav><!
<?php
	session_start();


	if(isset($_SESSION['u_usuario'])){
		
		echo "<a href=\"includes/cerrar.php\" id=\"cerrar\"> cerrar sesion</a>";
	} else {
		header("Location: index.php");
	}
?>
>
<br>
<a href="crud/registro.php" target="cont"> <input type="button" name="boton" value="Registar" /></a><br>
<a href="crud/modificar.php" target="cont"> <input type="button" name="boton" value="Modificar" /></a><br>
<a href="crud/eliminar.php" target="cont"> <input type="button" name="boton" value="Eliminar" /></a><br>
<a href="crud/consultar.php" target="cont"> <input type="button" name="boton" value="Consultar" /></a><br>
</nav>
<iframe src="crud/registro.php" id="fram" name="cont">
</iframe>


</body>
</html>