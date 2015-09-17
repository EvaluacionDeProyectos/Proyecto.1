@extends('app')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::open(['route' => 'dcuestionario.store', 'method' => 'post', 'novalidate']) !!}
                <div class="form-group">
                      {!! Form::label('Cuestionario', 'Cuestionario') !!}
                      {!! Form::select('FK_Cuestionario', $cuestionario, null ,['class' => 'form-control']) !!}

                      {!! Form::label('Ficha', 'Ficha') !!}
                      {!! Form::select('FK_Ficha', $ficha, null ,['class' => 'form-control']) !!}
                      
                      {!! Form::label('Instructor', 'Instructor') !!}
                      {!! Form::select('FK_Instructor', $instructor, null ,['class' => 'form-control']) !!}
                  </div>                  
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection		