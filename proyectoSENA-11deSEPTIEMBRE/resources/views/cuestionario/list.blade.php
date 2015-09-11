@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'cuestionario/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('cuestionario.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('cuestionario.create') }}" class="btn btn-primary">Crear nuevo dato</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Nombre</th>
                  
                  <th>Fecha</th>   

                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($cuestionario as $cuestionario)
                <tr>
                    <td>{{ $cuestionario->Nombre }}</td>
                    <td>{{ $cuestionario->Fecha }}</td>                    
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('cuestionario.edit',['id' => $cuestionario->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('cuestionario/destroy',['id' => $cuestionario->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection