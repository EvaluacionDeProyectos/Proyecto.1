@extends('app')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::open(['route' => 'dficha.store', 'method' => 'post', 'novalidate']) !!}
                <div class="form-group">
                      {!! Form::label('Ficha', 'Ficha') !!}
                      {!! Form::select('FK_Ficha', $ficha, null ,['class' => 'form-control']) !!}

                      {!! Form::label('Instructor', 'Instructor') !!}
                      {!! Form::select('FK_Instructor', $instructor, null ,['class' => 'form-control']) !!}

                      {!! Form::label('Titular', 'Titular') !!}
                      {!! Form::text('Titular', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                  </div>                  
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection		