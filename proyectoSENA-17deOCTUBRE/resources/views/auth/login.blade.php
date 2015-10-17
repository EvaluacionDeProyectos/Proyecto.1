<!DOCTYPE html>
<html>
    <head>
          <link rel="stylesheet" href={{asset("css/estilo.css")}}>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
              <script>
                $(document).ready(function(){
                $('.log-btn').click(function(){
                $('.log-status').addClass('wrong-entry');
                $('.alert').fadeIn(500);
                setTimeout( "$('.alert').fadeOut(1500);",3000 );
                  });
                  $('.form-control').keypress(function(){
                  $('.log-status').removeClass('wrong-entry');
                    });
                  });
              </script>
    </head>
    <body>
        <header>
            <img src={{asset("image/centrogsm.PNG")}} alt="centro" id="img">
        </header>
@if (count($errors) > 0)
            <div class="alert alert-danger">
              <strong>Whoops!</strong> There were some problems with your input.<br><br>
              <ul>
                @foreach ($errors->all() as $error)
                  <li>{{ $error }}</li>
                @endforeach
              </ul>
            </div>
          @endif
        <form method="POST" action="{{ url('/auth/login') }}">
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
              <div class="login-form">
                   <h1>Iniciar Sesion</h1>
                  <div class="form-group ">
                     <input type="email" class="form-control" placeholder="Email " id="email" name="email" required title="Digite su email" value="{{ old('email') }}">
                     <i class="fa fa-user"></i>
                   </div>
                   <div class="form-group log-status">
                     <input type="password" class="form-control" placeholder="Contraseña" id="passwod" name="password" required title="Digite su contraseña">
                     <i class="fa fa-lock"></i>
                   </div>
                    <span class="alert">Invalid Credentials</span>
      
                   <button type="submit" class="log-btn" >Ingresar</button>
     
        </form>
              </div> 
    </body>
<footer>
  <span id="bajo">.
    :: Servicio Nacional de Aprendizaje SENA – Dirección General Calle 57 No. 8-69, Bogotá D.C - PBX (57 1) 5461500 <br>
Línea gratuita de atención al ciudadano Bogotá 5925555 – Resto del país 018000 910270<br>
Horario de atención: lunes a viernes de 8:00 am a 5:30 pm<br>
Correo electrónico para notificaciones judiciales: notificacionesjudiciales@sena.edu.co<br>
Todos los derechos reservados © 2015 ::.</span>
</footer>
</html>

