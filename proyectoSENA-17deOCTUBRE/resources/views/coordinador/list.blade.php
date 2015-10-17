@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'coordinador/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('coordinador.index') }}" class="btn btn-primary">Todos los datos</a>

        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Nombre</th>
                  
                  <th>Descripcion</th> 

                  <th>Valor Respuesta</th> 

                        
                  
                </tr>
            </thead>
            <tbody>
                @foreach($coordinador as $coordinador)
                <tr>
                    <td>{{ $coordinador->Nombre }}</td>
                    <td>{{ $coordinador->Descripcion }}</td> 
                    <td>{{ $coordinador->Valor_Respuesta }}</td> 
                    
                    </td>
                </tr>
                @endforeach
                
            </tbody>
        </table>
  </div>
</div>
@endsection