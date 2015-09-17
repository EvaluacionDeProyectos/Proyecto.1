@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'aprendiz/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('aprendiz.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('aprendiz.create') }}" class="btn btn-primary">Crear nuevo registro</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Documento</th>
                  <th>Tipo documento</th>
                  <th>Nombres</th>
                  <th>Apellidos</th>
                  <th>Fecha de nacimiento</th>
                  <th>Correo</th>
                  <th>Direccion</th>
                  <th>Telefono</th>
                  <th>fecha inicio lectiva</th>
                  <th>fecha fin lectiva</th>
                  <th>fecha inicio productiva</th>
                  <th>fecha fin productiva</th>
                  <th>Usuario</th>
                  <th>Contraseña</th>
                  <th>Ficha</th>
                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($aprendiz as $aprendiz)
                <tr>
                    <td>{{ $aprendiz->Documento }}</td>
                    <td>{{ $aprendiz->Tipo_documento }}</td>
                    <td>{{ $aprendiz->Nombres }}</td> 
                    <td>{{ $aprendiz->Apellidos }}</td>
                    <td>{{ $aprendiz->Fecha_Nacimiento }}</td> 
                    <td>{{ $aprendiz->Correo }}</td> 
                    <td>{{ $aprendiz->Direccion }}</td>
                    <td>{{ $aprendiz->Telefono }}</td>
                    <td>{{ $aprendiz->Fecha_inicioLectiva }}</td>
                    <td>{{ $aprendiz->Fecha_finLectiva }}</td> 
                    <td>{{ $aprendiz->Fecha_inicioProductiva }}</td> 
                    <td>{{ $aprendiz->Fecha_finProductiva }}</td> 
                    <td>{{ $aprendiz->Usuario }}</td>
                    <td>{{ $aprendiz->Contraseña }}</td>
                    <td>{{ $aprendiz->FK_Ficha }}</td>
                     
                                  
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('aprendiz.edit',['id' => $aprendiz->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('aprendiz/destroy',['id' => $aprendiz->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection