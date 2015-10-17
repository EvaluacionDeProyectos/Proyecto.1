@extends('app')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::open(['route' => 'aprendiz.store', 'method' => 'post', 'novalidate']) !!}
                <div class="form-group">
                      {!! Form::label('Documento', 'Documento') !!}
                      {!! Form::text('Documento', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Tipo_documento', 'Tipo documento') !!}
                      {!! Form::text('Tipo_documento', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Nombres', 'Nombres') !!}
                      {!! Form::text('Nombres', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Apellidos', 'Apellidos') !!}
                      {!! Form::text('Apellidos', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Fecha_Nacimiento', 'Fecha Nacimiento') !!}
                      {!! Form::date('Fecha_Nacimiento', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Correo', 'Correo') !!}
                      {!! Form::text('Correo', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Direccion', 'Direccion') !!}
                      {!! Form::text('Direccion', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Telefono', 'Telefono') !!}
                      {!! Form::text('Telefono', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                  
                      {!! Form::label('Fecha_inicioLectiva', 'Fecha inicio lectiva') !!}
                      {!! Form::date('Fecha_inicioLectiva', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                  
                      {!! Form::label('Fecha_finLectiva', 'Fecha fin lectiva') !!}
                      {!! Form::date('Fecha_finLectiva', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Fecha_inicioProductiva', 'Fecha inicio productiva') !!}
                      {!! Form::date('Fecha_inicioProductiva', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Fecha_finProductiva', 'Fecha fin productiva') !!}
                      {!! Form::date('Fecha_finProductiva', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Usuario', 'Usuario') !!}
                      {!! Form::text('Usuario', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Contraseña', 'Contraseña ') !!}
                      {!! Form::text('Contraseña', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Ficha', 'Ficha') !!}
                      {!! Form::select('FK_Ficha', $ficha, null ,['class' => 'form-control']) !!}
                  </div>                  
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection		