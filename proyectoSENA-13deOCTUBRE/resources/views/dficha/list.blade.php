@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'dficha/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('dficha.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('dficha.create') }}" class="btn btn-primary">Crear nuevo registro</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Ficha</th>
                  
                  <th>Instructor</th>   

                  <th>Titular</th> 
 
                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($dficha as $dficha)
                <tr>
                    <td>{{ $dficha->FK_Ficha }}</td> 
                    <td>{{ $dficha->FK_Instructor }}</td>    
                    <td>{{ $dficha->Titular }}</td>                  
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('dficha.edit',['id' => $dficha->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('dficha/destroy',['id' => $dficha->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection