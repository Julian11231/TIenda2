<%@ page import="java.util.Vector"%>
<%@ page import="org.comercio.producto.Producto"%>
<%@ page import="org.comercio.tienda.Mcategoria"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.user.Usuarios"%>
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
	String cat = "", cat_nombre = "";
	int categoriaa = 0;
	cat = request.getParameter("categoria");
	cat_nombre = request.getParameter("cat_nombre");
	if ((cat == null) || (cat_nombre == null)) {
		response.sendRedirect("../");
	} else {
		categoriaa = Integer.parseInt(cat);
	}	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Productos</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/estilo1.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet">

<!-- Bootstrap Core JavaScript -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/script1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand navbar-dark bg-dark">
			<a class="navbar-brand" href="../">Tienda2</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExample02" aria-controls="navbarsExample02"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarsExample02">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="../">Inicio
							<span class="sr-only">(current)</span>
					</a></li>
					<li>
						<div class="dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
								data-toggle="dropdown"><%=cat_nombre%></a>
							<div class="dropdown-menu">
								<%
									Mcategoria mcategoria = new Mcategoria();
									ArrayList<Categoria> lista = mcategoria.getCategoria();
									for (Categoria categoria : lista) {
								%>
								<a id="c<%=categoria.getCodigo()%>"
									href="../productos/index.jsp?categoria=<%=categoria.getCodigo()%>&cat_nombre=<%=categoria.getNombre()%>"
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
					<li class="nav-item"><a class="nav-link" href="../pedido">Pedidos</a>
					</li>
					<%
						}
					%>
					<li class="nav-item"><a class="nav-link" href="carrito.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span><span
							class="badge"><%=total%></span> Carrito</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<jsp:include page="../sesion/Login.jsp">
		<jsp:param name="subcategoria" value="<%=cat_nombre%>" />
		<jsp:param name="indice" value="1" />
	</jsp:include>

	<jsp:include page="listaProductos.jsp">
		<jsp:param name="subcategoria" value="<%=cat_nombre%>" />
	</jsp:include>
	

	<div class="w3-black w3-center w3-padding-24">
		<p>
			&copy; 2017 Company, Inc. &middot; <a href="#">Privacidad</a>
			&middot; <a href="#">Condiciones</a>&middot; <a href="#">Ayuda</a>
		</p>
	</div>
</body>
</html>