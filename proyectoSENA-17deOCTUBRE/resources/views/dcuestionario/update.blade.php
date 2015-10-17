@extends('app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::model($dcuestionario,['route' => 'dcuestionario.update', 'method' => 'put', 'novalidate']) !!}
            
                {!! Form::hidden('id', $dcuestionario->id) !!}
            
                <div class="form-group">
                      {!! Form::label('Cuestionario', 'Cuestionario') !!}
                      {!! Form::text('FK_Cuestionario', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Ficha', 'Ficha') !!}
                      {!! Form::text('FK_Ficha', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Instructor', 'Instructor') !!}
                      {!! Form::text('FK_Instructor', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                </div>                           
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection