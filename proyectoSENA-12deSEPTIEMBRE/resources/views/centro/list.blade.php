@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'centro/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('centro.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('centro.create') }}" class="btn btn-primary">Crear nuevo registro</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Descripcion</th>
                  
                  <th>Direccion</th>   

                  <th>Regional</th> 

                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($centro as $centro)
                <tr>
                    <td>{{ $centro->Descripcion }}</td>
                    <td>{{ $centro->Direccion }}</td> 
                    <td>{{ $centro->FK_Regional }}</td>                    
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('centro.edit',['id' => $centro->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('centro/destroy',['id' => $centro->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection