@extends('app')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::open(['route' => 'ficha.store', 'method' => 'post', 'novalidate']) !!}
                <div class="form-group">
                      {!! Form::label('Coordinacion', 'Coordinacion') !!}
                      {!! Form::select('FK_Coordinacion', $coordinacion, null ,['class' => 'form-control']) !!}
                      {!! Form::label('Programa', 'Programa') !!}
                      {!! Form::select('FK_Programa', $programa, null ,['class' => 'form-control']) !!}
                  </div>                  
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection		