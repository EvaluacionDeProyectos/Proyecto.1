@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'ficha/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('ficha.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('ficha.create') }}" class="btn btn-primary">Crear nuevo registro</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Coordinacion</th>
                  
                  <th>Programa</th>   
 
                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($ficha as $ficha)
                <tr>
                    <td>{{ $ficha->FK_Coordinacion }}</td> 
                    <td>{{ $ficha->FK_Programa }}</td>                    
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('ficha.edit',['id' => $ficha->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('ficha/destroy',['id' => $ficha->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection