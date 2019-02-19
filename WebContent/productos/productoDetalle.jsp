<%@ page import="java.util.Vector"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.tienda.UnProducto"%>
<%@ page import="org.comercio.producto.Producto"%>
<%
	String code = "";
	String title = "";
	code = request.getParameter("codigo");
	ArrayList<Producto> lista = new ArrayList<Producto>();
	if (code == null) {
		response.sendRedirect("../");
	} else {
		int pro_codigo = Integer.parseInt(code);
		UnProducto tienda = new UnProducto();
		lista = tienda.getProducto(pro_codigo);
		for (Producto kkk : lista) {
			title = kkk.getNombre();
		}
	}
%>
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

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title><%=title%> - Tienda2</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-item.css" rel="stylesheet">

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet">
<link href="../css/estilo.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet">
<!-- jQuery -->
<script src="../js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>
<script src="../js/script4.js"></script>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../">Tienda2</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="../">Inicio</a></li>
					<li><a href="../productos">Productos</a></li>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" data-toggle="modal" data-target="#login-modal"><span
							class="glyphicon glyphicon-user"></span> Iniciar Sesion</a></li>
					<li><a href="../pedido">Pedidos</a></li>
					<li><a href="carrito.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span><span
							class="badge"><%=total%></span> Carrito</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->

	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-7">
			<div class="page-header">
				<h1>Listado de productos</h1>
			</div>
			<div class="card">
				<div class="container-fliud">
					<div class="wrapper row">
						<%
						int iva = 0;
					    double precio=0,precioTotal=0,ivaa=0;
							for (Producto kkk : lista) {
								
						%>
						<div class="preview col-md-6">
							<div class="preview-pic tab-content">
								<div class="tab-pane active" id="pic-1">
									<img src="../<%=kkk.getImagen()%>" />
								</div>
							</div>
						</div>
						<div class="details col-md-6">
							<h3 class="product-title"><%=kkk.getNombre()%></h3>
							<div class="rating">
								<div class="stars">
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
								<span class="review-no">41 reviews</span>
							</div>
							<p class="product-description"><%=kkk.getDescripcion_larga()%></p>
							<h4 class="price">
							<% 
							   
									iva= kkk.getIva();
									ivaa = iva*0.01;
									precio = kkk.getPrecio();
									precioTotal = precio+precio*ivaa;%>
							
								current price: <span>$<%=precioTotal%></span>
							</h4>
							
							<h4>Unidades disponibles: <%=kkk.getUnidades() %></h4>
							
							<p class="vote">
								<strong>91%</strong> of buyers enjoyed this product! <strong>(87
									votes)</strong>
							</p>
							<form id="add" action="../Comprar" method="post">
								<p>
									<input type="hidden" name="codigo" id="codigo"
										value="<%=kkk.getCodigo()%>" /> cantidad <input type="number"
										name="cantidad" min="1" max="500" value="1">
								</p>
								<div class="action">
									<input id="cart" type="button"
										class="add-to-cart btn btn-default" onclick="myFunction()"
										value="Add">
								</div>
							</form>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>

			<div class="well">

				<div class="text-right">
					<a class="btn btn-success">Leave a Review</a>
				</div>

				<hr>

				<div class="row">
					<div class="col-md-12">
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span> Anonymous <span
							class="pull-right">10 days ago</span>
						<p>This product was great in terms of quality. I would
							definitely buy another!</p>
					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col-md-12">
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span> Anonymous <span
							class="pull-right">12 days ago</span>
						<p>I've alredy ordered another one!</p>
					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col-md-12">
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span> Anonymous <span
							class="pull-right">15 days ago</span>
						<p>I've seen some better than this, but not at this price. I
							definitely recommend this item.</p>
					</div>
				</div>

			</div>

		</div>
		<div class="col-lg-3">
			<div class="text-center">
				<h3>Relacionado</h3>
			</div>
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
	</div>
	<!-- /.container -->

	<div class="container">
		<footer>
			<p class="pull-right">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2017 Company, Inc. &middot; <a href="#">Privacidad</a>
				&middot; <a href="#">Condiciones</a>&middot; <a href="#">Ayuda</a>
			</p>
		</footer>
	</div>

</body>

</html>