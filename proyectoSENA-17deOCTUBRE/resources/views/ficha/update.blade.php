@extends('app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::model($ficha,['route' => 'ficha.update', 'method' => 'put', 'novalidate']) !!}
            
                {!! Form::hidden('id', $ficha->id) !!}
            
                <div class="form-group">
                      {!! Form::label('Coordinacion', 'Coordinacion') !!}
                      {!! Form::text('FK_Coordinacion', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                      {!! Form::label('full_name', 'Centro') !!}
                      {!! Form::text('FK_Programa', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                </div>                           
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection