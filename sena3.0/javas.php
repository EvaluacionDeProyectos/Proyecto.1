<script type="text/javascript">
function ocultar()
{
 /*if(combo.options[0].selectedIndex == 0)
 	
 	document.getElementById("caja").disabled = true;

else if(combo.options[1].selectedIndex == 1)
	document.getElementById("caja").disabled = false;*/

if(document.getElementById("combo").selectedIndex == "0")
	{
	document.getElementById("text").hidden = false;
	document.getElementById("caja").hidden = false;
}
else if(document.getElementById("combo").selectedIndex == "1")
	{

	document.getElementById("text").hidden = true;
	document.getElementById("caja").hidden = true;

}

}


</script>
<label for="nombre" value="nombre"> Opcion </label>
<select onChange="ocultar()" name="combo" id="combo">
	<option id="ver" selected> ver 
	<option id="ocultar"> ocultar
</select><br>
<label for="nombre" value="nombre" id="text"> nombre </label>
<input name="caja" id="caja">