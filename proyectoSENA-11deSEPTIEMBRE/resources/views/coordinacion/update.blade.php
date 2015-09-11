@extends('app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::model($coordinacion,['route' => 'coordinacion.update', 'method' => 'put', 'novalidate']) !!}
            
                {!! Form::hidden('id', $coordinacion->id) !!}
            
                <div class="form-group">
                      {!! Form::label('Nombre', 'Nombre') !!}
                      {!! Form::text('Nombre', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                      {!! Form::label('full_name', 'Centro') !!}
                      {!! Form::text('FK_Centro', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                </div>                           
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection