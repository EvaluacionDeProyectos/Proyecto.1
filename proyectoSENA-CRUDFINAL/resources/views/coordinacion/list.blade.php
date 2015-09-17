@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'coordinacion/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('coordinacion.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('coordinacion.create') }}" class="btn btn-primary">Crear nuevo registro</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Nombre</th>
                  
                  <th>Centro</th>   
 
                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($coordinacion as $coordinacion)
                <tr>
                    <td>{{ $coordinacion->Nombre }}</td> 
                    <td>{{ $coordinacion->FK_Centro }}</td>                    
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('coordinacion.edit',['id' => $coordinacion->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('coordinacion/destroy',['id' => $coordinacion->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection