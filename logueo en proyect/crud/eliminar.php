<form name="modificar" method="post" action="Eliminar.php">
Id Usuario <input type ="text" name="id"><br>
<input type="submit" name="buscar" value="buscar"><br>

<?php
	error_reporting(0);
	error_reporting(E_ERROR | E_WARNING | E_PARSE );
	$buscar=$_REQUEST['buscar'];
	if(isset($buscar))
	{
		$idusuario=$_REQUEST['id'];
		$conexion=mysql_connect("localhost","root","");
		mysql_select_db("proyecto");
		$sentenciaSQLbuscar="SELECT * FROM instructor WHERE id = ('$idusuario')";
		$consulta=mysql_query($sentenciaSQLbuscar,$conexion);
		$numfilas=mysql_num_rows($consulta);

		if ($numfilas > 0 )
		{
			$resultado=mysql_fetch_array($consulta);
			echo ("Id usuario:");
			echo ("<input type='text' name='id'  value='".$resultado['id']."'><br>");
			echo ("Documento usuario:");
			echo ("<input type='text' name='cedula'  value='".$resultado['cedula']."'><br>");
			echo ("Nombre usuario:");
			echo ("<input type='text' name='nombre' value='".$resultado['nombre']."'><br>");
			echo ("Apellido usuario:");
			echo ("<input type='text' name='apellido'  value='".$resultado['apellido']."'><br>");
			echo ("Telefono usuario:");
			echo ("<input type='text' name='telefono' value='".$resultado['telefono']."'><br>");
			echo ("Direccion usuario:");
			echo ("<input type='text' name='direccion'  value='".$resultado['direccion']."'><br>");
			echo ("Estado usuario:");
			echo ("<input type='text' name='estado'  value='".$resultado['estado']."'><br>");
			echo ("Fecha ingreso:");
			echo ("<input type='text' name='fecha'  value='".$resultado['fecha']."'><br>");
		  	echo ("<br>");
		  	echo ("<input type ='submit' name='eliminar' value='eliminar'>");
		}
		else
		{
			echo ("no se encontro registros con los parametros enviados");
		}
		mysql_close($conexion);
	}

	$eliminar = $_REQUEST['eliminar'];
	if (isset($eliminar))
	{
		$idusuario = $_REQUEST['id'];
		$conexion=mysql_connect("localhost","root","");
		mysql_select_db("prueba");
		$sentenciaSQLeliminar = "DELETE  FROM empleado WHERE id = ('$idusuario')";
		$ejecutarSQL = mysql_query($sentenciaSQLeliminar,$conexion);
		mysql_close($conexion);

		if ($ejecutarSQL == True)
		{
			echo "El registro se ha eliminado correctamente";

		}
		

	}
	
	
?>
</form>