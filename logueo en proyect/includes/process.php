<?php 
	session_start();
	$usuario=$_POST['usuario'];
	$contrasena=$_POST['contrasena'];

	include("/conexion.php");
	#$proceso = $conexion->query("SELECT * FROM usuario WHERE Usuario='$usuario' AND Contrasena='$contrasena'");
	$proceso = $conexion->query("call SESION(

		'$usuario','$contrasena')");

	if($resultado= mysqli_fetch_array($proceso)){
		$_SESSION['u_usuario'] = $usuario;
		header("Location: ../principal.php");
		echo 'sesion exitosa'; 
	}else{
		header("Location: ../index.php");
		
	}
?>s