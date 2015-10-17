@extends('app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::model($centro,['route' => 'centro.update', 'method' => 'put', 'novalidate']) !!}
            
                {!! Form::hidden('id', $centro->id) !!}
            
                <div class="form-group">
                      {!! Form::label('Descripcion', 'Descripcion') !!}
                      {!! Form::text('Descripcion', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                      {!! Form::label('Direccion', 'Direccion') !!}
                      {!! Form::text('Direccion', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                      {!! Form::label('full_name', 'Regional') !!}
                      {!! Form::text('FK_Regional', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                </div>                           
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection