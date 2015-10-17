@extends('app')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'instructorescoordinacion/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('instructorescoordinacion.index') }}" class="btn btn-primary">Todos los datos</a>

        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Nombre coordinacion</th>
                  
                  <th>Nombres Instructor</th> 

                  <th>Ficha</th> 

                  <th>Titular</th> 

                        
                  
                </tr>
            </thead>
            <tbody>
                @foreach($instructorescoordinacion as $instructorescoordinacion)
                <tr>
                    <td>{{ $instructorescoordinacion->Nombre }}</td>
                    <td>{{ $instructorescoordinacion->Nombres }}</td> 
                    <td>{{ $instructorescoordinacion->FK_Ficha }}</td> 
                    <td>{{ $instructorescoordinacion->Titular }}</td>                
                    
                    </td>
                </tr>
                @endforeach
                
            </tbody>
        </table>
  </div>
</div>
@endsection