<form name="modificar" method="post" action="Modificar.php">
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
			echo ("<input type='text'  name='id' value='".$resultado['id']."' readonly><br>");
			echo ("Documento usuario:");
			echo ("<input type='text' name='cedula'   value='".$resultado['cedula']."'><br>");
			echo ("Nombre usuario:");
			echo ("<input type='text' name='nombre' value='".$resultado['nombre']."'><br>");
			echo ("Apellido usuario:");
			echo ("<input type='text' name='apellido' value='".$resultado['apellido']."'><br>");
			echo ("Telefono usuario:");
			echo ("<input type='text' name='telefono'value='".$resultado['telefono']."'><br>");
			echo ("Direccion usuario:");
			echo ("<input type='text' name='direccion' value='".$resultado['direccion']."'><br>");
			echo ("Estado usuario:");
			echo ("<input type='text' name='estado' value='".$resultado['estado']."'><br>");
		  	echo ("fecha ingreso:");
		  	echo ("<input type='text name='fecha'  value='".$resultado['fecha']."'><br>");
		  	echo ("<br>");
		  	echo ("<input type ='submit' name='modificar' value='modificar'>");
		}
		else
		{
			echo ("no se encontro registros con los parametros enviados");
		}
		mysql_close($conexion);
	}







	$modificar=$_POST['modificar'];
	if (isset($modificar))
	{
		$id=$_REQUEST['id'];
		$documento=$_REQUEST['cedula'];
		$nombre=$_REQUEST['nombre'];
		$apellido=$_REQUEST['apellido'];
		$telefono=$_REQUEST['telefono'];
		$direccion=$_REQUEST['direccion'];
		$estado=$_REQUEST['estado'];

		$conexion=mysql_connect("localhost","root","");
		mysql_select_db("prueba");
		$sentenciaSQLmodificar="UPDATE empleado SET nombre='$nombre',apellido='$apellido',telefono='$telefono',direccion='$direccion',estado='$estado' WHERE id='$id'";

		$ejecutarSQL=mysql_query($sentenciaSQLmodificar,$conexion);
		mysql_close($conexion);

		if($ejecutarSQL==True)
		{
			echo ("los datos del usuario han sido modificados ");
			echo ("<br/>");
		}
	}
?>
</form>