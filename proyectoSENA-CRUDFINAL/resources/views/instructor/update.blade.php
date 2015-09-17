@extends('app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::model($instructor,['route' => 'instructor.update', 'method' => 'put', 'novalidate']) !!}
            
                {!! Form::hidden('id', $instructor->id) !!}
            
                <div class="form-group">
                      {!! Form::label('Documento', 'Documento') !!}
                      {!! Form::text('Documento', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Tipo_documento', 'Tipo_documento') !!}
                      {!! Form::text('Tipo_documento', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Nombres', 'Nombres') !!}
                      {!! Form::text('Nombres', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Apellidos', 'Apellidos') !!}
                      {!! Form::text('Apellidos', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Correo', 'Correo') !!}
                      {!! Form::text('Correo', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('tipoInstructor', 'tipoInstructor') !!}
                      {!! Form::text('tipoInstructor', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                </div>                           
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection