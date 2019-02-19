<%@ page import="org.comercio.user.usuarios"%>
<%@ page import="java.util.Vector"%>
<%@ page import="org.comercio.producto.Producto"%>
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
<html>
<title>PERFIL</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif
}
</style>
<body class="w3-light-grey">

	<!-- Page Container -->
	<div class="w3-content w3-margin-top" style="max-width: 1400px;">

		<nav class="navbar navbar-default navbar-static-top">
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
						<%
							String usuario = "";
							try {
								usuario = request.getUserPrincipal().getName();
							} catch (Exception e) {
								System.out.println("Error: " + e.toString());
							}
							if (usuario == "") {
						%>
						<li><a href="../usuario"><span
								class="glyphicon glyphicon-user"></span> Iniciar Sesion</a></li>
						<%
							} else {
						%>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
								<%=usuario%> <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="../usuario"><span
										class="glyphicon glyphicon-user"></span> Perfil</a></li>
								<li><a href="../usuario/ajustes.jsp"><span
										class="glyphicon glyphicon-cog"></span> Ajustes</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="../login/salir.jsp"><span
										class="glyphicon glyphicon-log-out"></span> Cerrar sesion</a></li>
							</ul></li>
						<%
							}
							if (request.isUserInRole("CLIENTE")) {
						%>
						<li><a href="../pedido">Pedidos</a></li>
						<%
							} else if (request.isUserInRole("ADMINISTRADOR")) {
						%>
						<li><a href="../admin">Administración</a></li>
						<%
							}
						%>
						<li><a href="../productos/carrito.jsp"><span
								class="glyphicon glyphicon-shopping-cart"></span><span
								class="badge"><%=total%></span> Carrito</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- The Grid -->
		<div class="w3-row-padding">

			<!-- Left Column -->
			<div class="w3-third">

				<div class="w3-white w3-text-grey w3-card-4">
					<div class="w3-display-container">
						<img
							src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
							style="width: 100%" alt="Avatar">
						<div class="w3-display-bottomleft w3-container w3-text-black">
							<h2><%=usuario%></h2>
						</div>
					</div>
					<br>
					<div class="w3-container">
						<p>
							<i
								class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>
							<%
								if (request.isUserInRole("CLIENTE")) {
							%>
							Cliente
							<%
								} else if (request.isUserInRole("ADMINISTRADOR")) {
							%>
							Administrador
							<%
								}
							%>
						</p>
						<p>
							<i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>London,
							UK
						</p>
						<p>
							<i
								class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>ex@mail.com
						</p>
						<p>
							<i
								class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>1224435534
						</p>
						<hr>

						<p class="w3-large">
							<b><i
								class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Skills</b>
						</p>
						<p>Adobe Photoshop</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-teal"
								style="width: 90%">90%</div>
						</div>
						<p>Photography</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-teal"
								style="width: 80%">
								<div class="w3-center w3-text-white">80%</div>
							</div>
						</div>
						<p>Illustrator</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-teal"
								style="width: 75%">75%</div>
						</div>
						<p>Media</p>
						<div class="w3-light-grey w3-round-xlarge w3-small">
							<div class="w3-container w3-center w3-round-xlarge w3-teal"
								style="width: 50%">50%</div>
						</div>
						<br>

						<p class="w3-large w3-text-theme">
							<b><i class="fa fa-globe fa-fw w3-margin-right w3-text-teal"></i>Languages</b>
						</p>
						<p>English</p>
						<div class="w3-light-grey w3-round-xlarge">
							<div class="w3-round-xlarge w3-teal"
								style="height: 24px; width: 100%"></div>
						</div>
						<p>Spanish</p>
						<div class="w3-light-grey w3-round-xlarge">
							<div class="w3-round-xlarge w3-teal"
								style="height: 24px; width: 55%"></div>
						</div>
						<p>German</p>
						<div class="w3-light-grey w3-round-xlarge">
							<div class="w3-round-xlarge w3-teal"
								style="height: 24px; width: 25%"></div>
						</div>
						<br>
					</div>
				</div>
				<br>

				<!-- End Left Column -->
			</div>

			<!-- Right Column -->
			<div class="w3-twothird">

				<div class="w3-container w3-card-2 w3-white w3-margin-bottom">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Work
						Experience
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>Front End Developer / w3schools.com</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>Jan 2015 - <span
								class="w3-tag w3-teal w3-round">Current</span>
						</h6>
						<p>Lorem ipsum dolor sit amet. Praesentium magnam consectetur
							vel in deserunt aspernatur est reprehenderit sunt hic. Nulla
							tempora soluta ea et odio, unde doloremque repellendus iure,
							iste.</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>Web Developer / something.com</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>Mar 2012 -
							Dec 2014
						</h6>
						<p>Consectetur adipisicing elit. Praesentium magnam
							consectetur vel in deserunt aspernatur est reprehenderit sunt
							hic. Nulla tempora soluta ea et odio, unde doloremque repellendus
							iure, iste.</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>Graphic Designer / designsomething.com</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>Jun 2010 -
							Mar 2012
						</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						<br>
					</div>
				</div>

				<div class="w3-container w3-card-2 w3-white">
					<h2 class="w3-text-grey w3-padding-16">
						<i
							class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Education
					</h2>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>W3Schools.com</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>Forever
						</h6>
						<p>Web Development! All I need to know in one place</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>London Business School</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>2013 - 2015
						</h6>
						<p>Master Degree</p>
						<hr>
					</div>
					<div class="w3-container">
						<h5 class="w3-opacity">
							<b>School of Coding</b>
						</h5>
						<h6 class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"></i>2010 - 2013
						</h6>
						<p>Bachelor Degree</p>
						<br>
					</div>
				</div>

				<!-- End Right Column -->
			</div>

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>

	<footer class="w3-container w3-teal w3-center w3-margin-top">
		<p>Find me on social media.</p>
		<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
			class="fa fa-instagram w3-hover-opacity"></i> <i
			class="fa fa-snapchat w3-hover-opacity"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity"></i> <i
			class="fa fa-twitter w3-hover-opacity"></i> <i
			class="fa fa-linkedin w3-hover-opacity"></i>
		<p>
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				target="_blank">w3.css</a>
		</p>
	</footer>

</body>
</html>
