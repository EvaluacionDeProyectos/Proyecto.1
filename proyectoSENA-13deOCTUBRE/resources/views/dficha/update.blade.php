@extends('app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::model($dficha,['route' => 'dficha.update', 'method' => 'put', 'novalidate']) !!}
            
                {!! Form::hidden('id', $dficha->id) !!}
            
                <div class="form-group">
                      {!! Form::label('Ficha', 'Ficha') !!}
                      {!! Form::text('FK_Ficha', null, ['class' => 'form-control' , 'required' => 'required']) !!}

                      {!! Form::label('Instructor', 'Instructor') !!}
                      {!! Form::text('FK_Instructor', null, ['class' => 'form-control' , 'required' => 'required']) !!}

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