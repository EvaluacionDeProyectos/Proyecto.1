@extends('app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::model($cuestionario,['route' => 'cuestionario.update', 'method' => 'put', 'novalidate']) !!}
            
                {!! Form::hidden('id', $cuestionario->id) !!}
            
                <div class="form-group">
                      {!! Form::label('Nombre', 'Nombre') !!}
                      {!! Form::text('Nombre', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                      {!! Form::label('Fecha', 'Fecha') !!}
                      {!! Form::date('Fecha', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                </div>                           
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection