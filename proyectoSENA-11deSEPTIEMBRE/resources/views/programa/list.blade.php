@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'programa/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('programa.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('programa.create') }}" class="btn btn-primary">Crear nuevo registro</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Nombre</th>
                  
                  <th>Descripcion</th>   

                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($programa as $programa)
                <tr>
                    <td>{{ $programa->Nombre }}</td>
                    <td>{{ $programa->Descripcion }}</td>                    
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('programa.edit',['id' => $programa->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('programa/destroy',['id' => $programa->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection