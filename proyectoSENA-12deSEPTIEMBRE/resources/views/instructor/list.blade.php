@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'instructor/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('instructor.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('instructor.create') }}" class="btn btn-primary">Crear nuevo registro</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Documento</th>
                  <th>Tipo documento</th>
                  <th>Nombres</th>
                  <th>Apellidos</th>
                  <th>Correo</th>
                  <th>Tipo instructor</th>
                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($instructor as $instructor)
                <tr>
                    <td>{{ $instructor->Documento }}</td>
                    <td>{{ $instructor->Tipo_documento }}</td>
                    <td>{{ $instructor->Nombres }}</td> 
                    <td>{{ $instructor->Apellidos }}</td> 
                    <td>{{ $instructor->Correo }}</td> 
                    <td>{{ $instructor->tipoInstructor }}</td>                  
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('instructor.edit',['id' => $instructor->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('instructor/destroy',['id' => $instructor->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection