@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'regional/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('regional.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('regional.create') }}" class="btn btn-primary">Crear nuevo registro</a>
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
                @foreach($regional as $regional)
                <tr>
                    <td>{{ $regional->Nombre }}</td>
                    <td>{{ $regional->Descripcion }}</td>                    
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('regional.edit',['id' => $regional->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('regional/destroy',['id' => $regional->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection