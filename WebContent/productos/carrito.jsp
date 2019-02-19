<%@ page import="java.util.Vector"%>
<%@ page import="org.comercio.producto.Producto"%>
<%@ page import="org.comercio.tienda.Mcategoria"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.categoria.Categoria"%>
<%
	Vector compras = (Vector) session.getAttribute("compras");
	int total = 0;
	int subtotal = 0, cantidad = 1;
	double totalPrecio = 0;
	if (compras == null) {
		total = 0;
	} else {
		for (int i = 0; i < compras.size(); i++) {
			Producto compra = (Producto) compras.elementAt(i);
			total = total + compra.getCantidad();
			totalPrecio = totalPrecio + (compra.getPrecio() * compra.getCantidad());
		}
		subtotal = compras.size();
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

<title>Shop Homepage - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">

<link href="../css/login.css" rel="stylesheet">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

<script src="../js/script2.js"></script>

</head>

<body>
	<div id="div1">
		<!-- Navigation -->
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
								data-toggle="dropdown">Categorias</a>
							<div class="dropdown-menu">
								<%
									Mcategoria mcategoria = new Mcategoria();
									ArrayList<Categoria> lista = mcategoria.getCategoria();
									for (Categoria categoria : lista) {
								%>
								<a id="c<%=categoria.getCodigo()%>"
									href="../productos/index.jsp?cat=<%=categoria.getCodigo()%>"
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
							String usuario = "";
							try {
								usuario = request.getUserPrincipal().getName();
							} catch (Exception e) {
								System.out.println("Error: " + e.toString());
							}
							if (usuario == "") {
						%>
						<li class="nav-item"><a class="nav-link" href="../usuario"><span
								class="glyphicon glyphicon-user"></span>Iniciar Sesion</a></li>
						<%
							} else {
						%>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
								<%=usuario%> <span class="caret"></span></a>
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

		<%
			if (compras == null) {
		%>


		<div class="container">
			<h2>Tu carrito de compras está vacío.</h2>
			<br>
			<p>
				Haz que tu carrito de compras sea útil: llénalo de libros, CD,
				vídeos, DVD, juguetes, productos electrónicos y otros productos. Si
				ya tienes una cuenta, Identifícate para ver su cesta. Continúa
				comprando en<a href="../"> tienda2.com </a>
			</p>
			<p>El precio y la disponibilidad de los productos de amazon.com
				están sujetos a cambio. En el carrito de compras puedes dejar
				temporalmente los productos que quieras. Aparecerá el precio más
				reciente de cada producto.</p>
		</div>
		<%
			} else {
				if (compras.size() == 0) {
					compras.clear();
					session.removeAttribute("compras");
					response.sendRedirect("carrito.jsp");
				} else {
		%>
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="page-header">
						<h2 class="sub-header">Carrito de compras</h2>
					</div>
					<div class="table-responsive">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th></th>
									<th>Producto</th>
									<th>Valor Unidad</th>
									<th>Cantidad</th>
									<th>Valor Total</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < compras.size(); i++) {
												Producto compra = (Producto) compras.elementAt(i);
												cantidad = compra.getCantidad();
								%>
								<tr>
									<td><img src="../<%out.println(compra.getImagen());%>"
										alt="" width="82" height="102"></td>
									<td>
										<%
											out.println(compra.getNombre());
										%> <br> <%
 	out.println(compra.getDescripcion());
 %> <br> <a href="javascript:removeCompra(<%=i%>)"
										id="borrar<%=i%>">
											<button class="btn btn-sm btn-link">Borrar</button> <input
											type="hidden" id="index" name="index" value="<%=i%>">
									</a>
									</td>
									<td>$ <%
										out.println(compra.getPrecio());
									%></td>
									<td>
										<%
											out.println(compra.getCantidad());
										%>
									</td>
									<td>$ <%
										out.println(compra.getPrecio() * compra.getCantidad());
									%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
					<div>
						<input type="hidden" name="size" id="size"
							value="<%=compras.size()%>" />
						<h4 class="text-right">
							<%
								out.println("Subtotal(" + subtotal + " productos)");
							%>
						</h4>
						<h4 class="text-right">
							<%
								out.println("Total(" + total + " items): $" + totalPrecio);
							%>
						</h4>
						<a href="../pedido">
							<button class="btn btn-sm btn-warning">Comprar</button>
						</a>
						<button class="btn btn-sm btn-danger" id="vaciar">
							Vaciar carro <span class="glyphicon glyphicon-shopping-cart"></span>
						</button>
					</div>
				</div>
				<!--  
				<div class="col-lg-3">
					<div class="thumbnail">
						<img src="http://placehold.it/320x150" alt="">
						<div class="caption">
							<h4 class="pull-right">$24.99</h4>
							<h4>
								<a href="productoDetalle.jsp">First Product</a>
							</h4>
							<p>
								See more snippets like this online store item at <a
									target="_blank" href="http://www.bootsnipp.com">Bootsnipp -
									http://bootsnipp.com</a>.
							</p>
						</div>
						<div class="ratings">
							<p class="pull-right">15 reviews</p>
							<p>
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span>
							</p>
						</div>
					</div>
				</div>
				-->
			</div>
		</div>
		<%
			}
			}
		%>

	</div>
	<hr>

	<div class="container">
		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>
						&copy; 2017 Company, Inc. &middot; <a href="#">Privacidad</a>
						&middot; <a href="#">Condiciones</a>&middot; <a href="#">Ayuda</a>
					</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

</body>

</html>