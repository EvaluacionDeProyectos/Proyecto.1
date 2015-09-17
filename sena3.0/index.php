<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Estilos/estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js">
</script>
<script type="text/javascript">
  $(document).ready(function(){
        $('.log-btn').click(function(){
            $('.log-status').addClass('wrong-entry');
           $('.alert').fadeIn(500);
           setTimeout( "$('.alert').fadeOut(500);",3000 );
        });
        $('.form-control').keypress(function(){
            $('.log-status').removeClass('wrong-entry');
        });

    });
</script>


<body>
</head>

<header>
<img src="Resources/centrogsm.PNG" alt="centro" id="img">
</header>
<form method="POST" action="includes/process.php">
<div class="login-form">
     <h1>Iniciar Sesion</h1>
     <div class="form-group ">
       <input type="text" class="form-control" placeholder="Usuario " id="UserName" name="usuario" >
       <i class="fa fa-user"></i>
     </div>
     <div class="form-group log-status">
       <input type="password" class="form-control" placeholder="Contraseña" id="Passwod" name="contrasena" >
       <i class="fa fa-lock"></i>
     </div>
      <span class="alert">Contraseña incorrectas</span>
      
     <button type="submit" class="log-btn" >Ingresar</button>
     
    </form>
   </div> 

  </body>
<footer>
  <span id="bajo">.
     Servicio Nacion de Aprendizaje SENA – Dirección General Calle 57 No. 8-69, Bogotá D.C - PBX (57 1) 5461500 <br>
Línea gratuita de atención al ciudadano Bogotá 5925555 – Resto del país 018000 910270<br>
Horario de atención: lunes a viernes de 8:00 am a 5:30 pm<br>
.::&nbspTodos los derechos reservados © 2015 ::.</span>
</footer>
</html>

<!--
required title="Digite su contraseña" required title="Digite su nombre de usuario"-->