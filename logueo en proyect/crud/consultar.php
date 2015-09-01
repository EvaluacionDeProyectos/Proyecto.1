
<?php

	error_reporting(0);
	error_reporting(E_ERROR | E_WARNING | E_PARSE );

	require_once 'Aco_DataGrid.php';

	$conexion=mysql_connect("localhost","root","");
	mysql_select_db("proyecto");
	$sql = "SELECT * FROM instructor";
	$campos = array('id' => id ,'cedula' => cedula, 'nombre' => nombre , 'apellido' => apellido , 'telefono' => telefono , 'direccion' => direccion , 'estado' => estado, 'fecha' => fecha);

	$grid = new Aco_DataGrid;
	$grid->grid_PacingAndPadding(3, 3);
	$colores = array ( '#F0F9FC', '#FFFFFF' );
	$grid->grid_BgColorFC( '#FFFFFF', $colores );
	$grid->iniciar( $sql, '', $campos, 'productosCSS' );
	$grid->gridMostrar();
	











?>