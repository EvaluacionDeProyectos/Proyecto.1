@extends('app')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::open(['route' => 'centro.store', 'method' => 'post', 'novalidate']) !!}
                <div class="form-group">
                      {!! Form::label('Descripcion', 'Descripcion') !!}
                      {!! Form::text('Descripcion', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                      {!! Form::label('Direccion', 'Direccion') !!}
                      {!! Form::text('Direccion', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                      {!! Form::label('Regional', 'Regional') !!}

                    {!! Form::select('FK_Regional', $regional, null ,['class' => 'form-control']) !!}
                  </div>                  
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection		