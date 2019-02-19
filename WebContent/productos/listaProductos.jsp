<%@ page import="org.comercio.tienda.Msubcategoria"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.subcategoria.Subcategoria"%>
<%@ page import="org.comercio.tienda.Tiendaa"%>
<%
	String cat = "";
	String cat_nombre="";
	int categoria = 0;
	try {
		cat = request.getParameter("categoria");
		cat_nombre = request.getParameter("cat_nombre");
	} catch (Exception e) {
		System.out.println("Error: " + e.toString());
	}
	if ((cat == null)||(cat_nombre==null)) {
		response.sendRedirect("../");
	}else{
		categoria = Integer.parseInt(cat);
	}
%>
<div class="row">
	<div class="col-2 sidebar">
		<ul class="nav nav-pills flex-column">
			<%			
			Tiendaa tiendaa = new Tiendaa();
			ArrayList<Subcategoria> listaa = new ArrayList<Subcategoria>();
			int size = 0, subcat = 0;
			String subcat_nombre = "";
			listaa = tiendaa.getSubcategoria(categoria);						
			int contador = 1;
			for (Subcategoria subcategoria : listaa) {
				if (contador == 1) {
					subcat = subcategoria.getCodigo();
					subcat_nombre = subcategoria.getNombre();
					size = subcategoria.getCodigo();
			%>
			<li class="nav-item"><a id="c<%=subcategoria.getCodigo()%>"
				href="javascript:getProductos(<%=subcategoria.getCodigo()%>,'<%=subcategoria.getNombre()%>','<%=cat_nombre%>')"
				class="btn btn-primary btn-block" role="button"><%=subcategoria.getNombre()%></a></li>
			<%
				} else {
			%>
			<li class="nav-item"><a id="c<%=subcategoria.getCodigo()%>"
				href="javascript:getProductos(<%=subcategoria.getCodigo()%>,'<%=subcategoria.getNombre()%>','<%=cat_nombre%>')"
				class="btn btn-success btn-block" role="button"><%=subcategoria.getNombre()%></a></li>
			<%
				}
				contador++;
				size = subcategoria.getCodigo();
				}
			%>
		</ul>
		<input type="hidden" name="size" id="size" value="<%=size%>" />
	</div>

	<div id="div_productos" class="col-9">
		<jsp:include page="productos.jsp">
			<jsp:param name="subcategoria" value="<%=subcat%>" />
			<jsp:param name="a" value="<%=subcat_nombre%>"/>
			<jsp:param name="cat_nombre" value="<%=cat_nombre%>" />
		</jsp:include>
	</div>
</div>
