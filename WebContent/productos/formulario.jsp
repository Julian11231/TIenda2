<html>
<head>
<title>Crear cuenta</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="imagenes/logo.jpg">

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
   
</head>

<body>
      <div class="container text-center">
		<h1>WEBPRO</h1>
      </div>
<div class="container">
      
<div class="page-header">
  <h1>Crear una cuenta</h1>
  <p>One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
  </div>
  
  
<div class="row">
	<div class="col-sm-2">
	</div>
	
	<div class="col-sm-7">
  <form action="pagina4.jsp" method="post">
  
    <div class="col-xs-6">
      <label for="usr">Nombre</label>
      <input type="text" class="form-control" name="nombre" id="nombre" required autofocus>
    </div>
    
    <div class="col-xs-6">
      <label for="usr">Apellidos</label>
      <input type="text" class="form-control" name="apellido" id="apellido">
    </div>
    
    <div class="form-group">
      <label for="pwd">Clave</label>
      <input type="password" class="form-control" name="clave" id="pwd">
      <h6>8 caracteres como mínimo, distingue mayúsculas de minúsculas</h6>
    </div>
    
    <div class="form-group">
      <label for="pwd">Vuelve a escribir la clave</label>
      <input type="password" class="form-control" name="rclave" id="rpwd">
    </div>

<label for="sel1">Genero</label>
<select class="form-control" name="genero" id="sel1">
<option value="M">Masculino</option>
<option value="F">Femenino</option>
<option value="O">Otro</option>
</select>

<br>
<div class="form-group">
<label for= "correo">Correo:</label>
<input type="email" id="inputEmail" name="correo" class="form-control">
</div>


<div class="form-group">
<label for="fecha">Fecha de nacimiento</label>
<input type="date" name="fecha" class="form-control">
</div>


<input class="btn btn-lg btn-default" type="submit" value="Siguiente">

</form>
</div>

	<div class="col-sm-3">
	</div>

</div>
</div>
<div class="container">
<footer>
 <p>&copy; 2017 Company, Inc. &middot; <a href="#">Privacidad</a> &middot; <a href="#">Condiciones</a>&middot; <a href="#">Ayuda</a></p>
</footer>
</div>

</body>
</html>














