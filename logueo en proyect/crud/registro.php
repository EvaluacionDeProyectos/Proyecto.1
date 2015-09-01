
<form name = "registro" method = "POST" action = "">


<script type="text/javascript" >
function soloNumeros(e)
        {
        var keynum = window.event ? window.event.keyCode : e.which;
        if ((keynum == 8) || (keynum == 46))
        return true;
         
        return /\d/.test(String.fromCharCode(keynum));
        }
</script>

<script type="text/javascript"  >
function soloLetras(e)
 {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true;
    patron =/[A-Za-z]/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
 }
</script>

<script type="text/javascript" >
function Mayuscula(field)
 {
    field.value = field.value.toUpperCase()
 }
</script>

<center>
	<fieldset> 
		<legend>Ingresar Datos Instructor</legend>
		<table>
			<tr>
				<td> Id : </td>
				<td> <input type = "text" name ="id" onkeypress="return soloNumeros(event); "  > </td>
			</tr>
			<tr>
				<td> Documento : </td>
				<td> <input type = "text" name ="cedula" onkeypress="return soloNumeros(event);" ></td>
			</tr>
			<tr>
				<td> Nombre : </td>
				<td> <input type = "text" name ="nombre" onkeypress="return soloLetras(event);" onchange="return Mayuscula(this);" ></td>
			</tr>
			<tr>
				<td> Apellido : </td>
				<td> <input type = "text" name ="apellido" onkeypress="return soloLetras(event)" onchange="return Mayuscula(this);" > </td>
			</tr>
			<tr>
				<td> Telefono : </td>
				<td> <input type = "text" name ="telefono" onkeypress="return soloNumeros(event);" ></td>
			</tr>
			<tr>
				<td> Direccion : </td>
				<td> <input type = "text" name ="direccion" onchange="return Mayuscula(this);"></td>
			</tr>
			<tr>
				<td> Estado : </td>
				<td> <input type ="text" name ="estado" onkeypress="return soloLetras(event)" onchange="return Mayuscula(this);"></td>
			</tr>
			<tr>
				<td> Fecha : </td>
				<td> <input type ='date' name ="fecha" ></td>
			</tr>
		</table>
	
	</fieldset>

	<input type = "submit" name ="submit"  >
	<input type = "reset" name ="limpiar">
	<br><a href="./moduloempleados.html">Volver</a>
	<br>


	
	

</form>


<?php 
	error_reporting(0);
	error_reporting(E_ERROR | E_WARNING | E_PARSE );

	if(isset($_POST["submit"]))
	{	
		$id = trim(htmlentities(mysql_real_escape_string($_POST["id"]))); 
		$cedula = trim(htmlentities(mysql_real_escape_string($_POST["cedula"]))); 
		$nombre = trim(htmlentities(mysql_real_escape_string($_POST["nombre"]))); 
		$apellido = trim(htmlentities(mysql_real_escape_string($_POST["apellido"]))); 
		$telefono = trim(htmlentities(mysql_real_escape_string($_POST["telefono"]))); 
		$direccion= trim(htmlentities(mysql_real_escape_string($_POST["direccion"]))); 
		$estado = trim(htmlentities(mysql_real_escape_string($_POST["estado"]))); 
		$fecha = trim(htmlentities(mysql_real_escape_string($_POST["fecha"])));
		$response = array();

		if($id == "" or $cedula == "" or $nombre == "" or $apellido == "" or $telefono =="" or $direccion == "" or $estado == "" or $fecha == "")
		{ 
		$response[] = "Debes completar todos los campos"; 
		} 

		if(empty($response))
		{ 
		echo "Los datos son validos <br>"; 
			if($_POST['submit'])
			{
			$id=$_REQUEST['id'];
			$cedula=$_REQUEST['cedula'];
			$nombre=$_REQUEST['nombre'];
			$apellido=$_REQUEST['apellido'];
			$telefono=$_REQUEST['telefono'];
			$direccion=$_REQUEST['direccion'];
			$estado=$_REQUEST['estado'];
			$fecha=$_REQUEST['fecha'];

			$link=mysql_connect("localhost","root","");
			mysql_select_db("proyecto");
			$INFORMATION = ("INSERT INTO instructor(id,cedula,nombre,apellido,telefono,direccion,estado,fecha)values('$id','$cedula','$nombre','$apellido','$telefono','$direccion','$estado','$fecha')");
			$result=mysql_query($INFORMATION,$link);
				if (mysql_errno()!=0)
				{
					echo"error".$INFORMATION;
					echo"error al interior los datos".mysql_errno()."-".mysql_error();
					mysql_close($link);
				}
				else
				{
					mysql_close($link);
					echo "enviado";
				}
			}

		}		
		else
		{ 
			foreach($response as $r)
			{ 
			echo "Errores: ".$r."<br>"; 
			} 
		} 

	}

?> 



