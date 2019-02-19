<%@ page import="java.util.Vector"%>
<%@ page import="org.comercio.producto.Producto"%>
<%@ page import="org.comercio.user.Usuarios"%>
<%@ page import="org.comercio.tienda.Mcategoria"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.categoria.Categoria"%>
<%
	Vector compras = (Vector) session.getAttribute("compras");
	int total = 0;
	if (compras == null) {
		total = 0;
	} else {
		for (int i = 0; i < compras.size(); i++) {
			Producto compra = (Producto) compras.elementAt(i);
			total = total + compra.getCantidad();
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Tienda2</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand navbar-dark bg-dark">
			<a class="navbar-brand" href="#">Tienda2</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExample02" aria-controls="navbarsExample02"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarsExample02">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Inicio
							<span class="sr-only">(current)</span>
					</a></li>
					<li>
						<div class="dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
								data-toggle="dropdown">Categorias</a>
							<div class="dropdown-menu">
								<%
									Mcategoria mcategoria = new Mcategoria();
									ArrayList<Categoria> lista = mcategoria.getCategoria();
									for (Categoria categoria : lista) {
								%>
								<a id="c<%=categoria.getCodigo()%>"
									href="productos/index.jsp?categoria=<%=categoria.getCodigo()%>&cat_nombre=<%=categoria.getNombre()%>"
									class="dropdown-item"><%=categoria.getNombre()%></a>
								<%
									}
								%>
							</div>
						</div>
					</li>
				</ul>
				<form class="form-inline">
					<input class="form-control" type="text" placeholder="Search">
				</form>
				<ul class="navbar-nav">
					<%
					Usuarios usuario = (Usuarios)session.getAttribute("usuario");
					if(usuario == null){
												
					%>
					<li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#myModal" ><span
							class="glyphicon glyphicon-user"></span>Iniciar Sesion</a></li>
					<%
						} else {
					%>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
							<%=usuario.getUsuario_nombre()%> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="usuario"><span
									class="glyphicon glyphicon-user"></span> Perfil</a></li>
							<li><a href="usuario/ajustes.jsp"><span
									class="glyphicon glyphicon-cog"></span> Ajustes</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="login/salir.jsp"><span
									class="glyphicon glyphicon-log-out"></span> Cerrar sesion</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="pedido">Pedidos</a>
					</li>
					<%
						}
					%>
					<li class="nav-item"><a class="nav-link"
						href="productos/carrito.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span><span
							class="badge"><%=total%></span> Carrito</a></li>
				</ul>
			</div>
		</nav>
	</header>
	
		<jsp:include page="sesion/Login.jsp">
			<jsp:param name="indice" value="0" />
		</jsp:include>

	<div id="demo" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="imagenes/watch-1.jpg" alt="Los Angeles" width="100%"
					height="200">
			</div>
			<div class="carousel-item">
				<img src="imagenes/images.jpg" alt="Chicago" width="100%"
					height="200">
			</div>
			<div class="carousel-item">
				<img src="imagenes/mercurial.jpg" alt="New York" width="100%"
					height="200">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
</body>
</html>