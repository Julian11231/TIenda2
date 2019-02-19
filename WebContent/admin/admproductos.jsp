<%@ page import="org.comercio.categoria.ListaCategoria"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.categoria.Categoria"%>

<%
	String categoria = "";
	categoria = request.getParameter("categoria");
	if (categoria == null) {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Administacion</title>
<!-- This will include the whole javascript file including ajax handling -->
<script lang="javascript" src="../rest-api.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">
<script src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/script3.js"></script>
<link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
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
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span
							class="glyphicon glyphicon-envelope"></span> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">
									<div>
										<strong>John Smith</strong> <span
											class="pull-right text-muted"> <em>Yesterday</em>
										</span>
									</div>
									<div>Lorem ipsum dolor sit amet, consectetur adipiscing
										elit. Pellentesque eleifend...</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a class="text-center" href="#"> <strong>Read
										All Messages</strong> <i class="fa fa-angle-right"></i>
							</a></li>
							<li role="separator" class="divider"></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="glyphicon glyphicon-tasks"></span>
							<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">
									<div>
										<p>
											<strong>Task 1</strong> <span>40% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="40" aria-valuemin="0"
												aria-valuemax="100" style="width: 40%">
												<span class="sr-only">40% Complete (success)</span>
											</div>
										</div>
									</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">
									<div>
										<p>
											<strong>Task 2</strong> <span> 20% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-info"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 20%">
												<span class="sr-only">20% Complete</span>
											</div>
										</div>
									</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">
									<div>
										<p>
											<strong>Task 3</strong> <span> 60% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-warning"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 60%">
												<span class="sr-only">60% Complete (warning)</span>
											</div>
										</div>
									</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">
									<div>
										<p>
											<strong>Task 4</strong> <span> 80% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-danger"
												role="progressbar" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100" style="width: 80%">
												<span class="sr-only">80% Complete (danger)</span>
											</div>
										</div>
									</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a class="text-center" href="#"> <strong>See
										All Tasks</strong> <i class="fa fa-angle-right"></i>
							</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="glyphicon glyphicon-bell"></span>
							<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">
									<div>
										<i class="fa fa-comment fa-fw"></i> New Comment <span>4
											minutes ago</span>
									</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">
									<div>
										<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span>12
											minutes ago</span>
									</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">
									<div>
										<i class="fa fa-envelope fa-fw"></i> Message Sent <span>4
											minutes ago</span>
									</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">
									<div>
										<i class="fa fa-tasks fa-fw"></i> New Task <span>4
											minutes ago</span>
									</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">
									<div>
										<i class="fa fa-upload fa-fw"></i> Server Rebooted <span>4
											minutes ago</span>
									</div>
							</a></li>
							<li role="separator" class="divider"></li>
							<li><a class="text-center" href="#"> <strong>See
										All Alerts</strong> <i class="fa fa-angle-right"></i>
							</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
							User <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="../usuario"><span
									class="glyphicon glyphicon-user"></span> Perfil</a></li>
							<li><a href="../usuario/ajustes.jsp"><span
									class="glyphicon glyphicon-cog"></span> Ajustes</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="../login/salir.jsp"><span
									class="glyphicon glyphicon-log-out"></span> Cerrar sesion</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 text-center">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="index.jsp">Overview <span
							class="sr-only">(current)</span></a></li>
				</ul>
				<br>
				<ul class="nav nav-pills nav-stacked">
					<%
						ListaCategoria listcategoria = new ListaCategoria();
						ArrayList<Categoria> lista = listcategoria.getCategoria();
						for (Categoria categorias : lista) {
					%>
					<li><a id="c<%=categorias.getCodigo()%>"
						href="admproductos.jsp?categoria=<%=categorias.getCodigo()%>"><%=categorias.getNombre()%></a></li>
					<%
						}
					%>
				</ul>
			</div>

			<script type="text/javascript" src="../js/producto.js"></script>
			<input type="hidden" name="categoria" id="categoria"
				value="<%=categoria%>" />
			<div class="col-sm-9 admdiv">
				<div class="container-fluid text-center">
					<h2>Gestion de productos</h2>
				</div>
				<br>
				<div class="container-fluid text-right">
					<input type="button" class="btn btn-default" value="Adicionar"
						id="adicionar" /> <input type="button" class="btn btn-default"
						value="Modificar" id="modificar" /> <input type="button"
						class="btn btn-success" value="Activar" id="activar" /> <input
						type="button" class="btn btn-danger" value="Eliminar"
						id="eliminar" />
				</div>
				<hr>
				<table id="eexample" class="table">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Precio</th>
							<th>descripcion</th>
							<th>descripcion Larga</th>
							<th>imagen</th>
							<th>categoria</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Precio</th>
							<th>descripcion</th>
							<th>descripcion Larga</th>
							<th>imagen</th>
							<th>categoria</th>
						</tr>
					</tfoot>
				</table>
				<div id="dialogo-mensaje" title="Gestión de Productos"></div>
				<div id="dialog-form" title="Forma Producto">
					<p class="validateTips">Todos los campos son requeridos.</p>
					<form>
						<fieldset>
							<input type="hidden" name="accion" id="accion" value="" /> <input
								type="hidden" name="codigo" id="codigo" value="" /> <label
								for="nombre">Nombre</label> <input type="text" name="nombre"
								id="nombre" value=""
								class="text ui-widget-content ui-corner-all" /> <label
								for="precio">Precio</label> <input type="text" name="precio"
								id="precio" value=""
								class="text ui-widget-content ui-corner-all" /> <label
								for="descripcion">Descripcion</label> <input type="text"
								name="descripcion" id="descripcion" value=""
								class="text ui-widget-content ui-corner-all" /> <label
								for="descripcion_larga">Descripcion larga</label> <input
								type="text" name="descripcion_larga" id="descripcion_larga"
								value="" class="text ui-widget-content ui-corner-all" /> <label
								for="imagen">Imagen</label> <input type="text" name="imagen"
								id="imagen" value=""
								class="text ui-widget-content ui-corner-all" /> <label
								for="categoriaa">Categoria</label> <input type="text"
								name="categoriaa" id="categoriaa" value="<%=categoria%>"
								class="text ui-widget-content ui-corner-all" /> <input
								type="submit" tabindex="-1"
								style="position: absolute; top: -1000px">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="container">
		<footer>
			<p>
				&copy; 2017 Company, Inc. &middot; <a href="#">Privacidad</a>
				&middot; <a href="#">Condiciones</a>&middot; <a href="#">Ayuda</a>
			</p>
		</footer>
	</div>

</body>
</html>
