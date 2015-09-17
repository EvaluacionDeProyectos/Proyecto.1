@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'dcuestionario/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('dcuestionario.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('dcuestionario.create') }}" class="btn btn-primary">Crear nuevo registro</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Cuestionario</th>
                  
                  <th>Ficha</th>   

                  <th>Instructor</th> 

                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($dcuestionario as $dcuestionario)
                <tr>
                    <td>{{ $dcuestionario->FK_Cuestionario }}</td>
                    <td>{{ $dcuestionario->FK_Ficha }}</td> 
                    <td>{{ $dcuestionario->FK_Instructor}}</td>                    
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('dcuestionario.edit',['id' => $dcuestionario->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('dcuestionario/destroy',['id' => $dcuestionario->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection