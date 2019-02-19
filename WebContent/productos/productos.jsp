<%@ page import="org.comercio.tienda.Tienda"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.producto.Producto"%>
<%
	String subcat_id = "";
	String subcat_nombre = "";
	String cat_nombre = "";
	try {
		subcat_id = request.getParameter("subcategoria");
		subcat_nombre = request.getParameter("a");
		cat_nombre = request.getParameter("cat_nombre");
	} catch (Exception e) {
		System.out.println("Error: " + e.toString());
	}
	Tienda tienda = new Tienda();
	ArrayList<Producto> lista = new ArrayList<Producto>();
	if ((subcat_id == null)||(cat_nombre==null)||(subcat_nombre==null)) {
		response.sendRedirect("../");
	}else{
		int pro_categoria = Integer.parseInt(subcat_id);
		lista = tienda.getProductos(pro_categoria);
	}
%>
<div class="page-header">
	<h2><%=cat_nombre%>/<%=subcat_nombre%></h2>
</div>
<div class="row">
	<%
		int iva = 0;
		double precio=0,precioTotal=0,ivaa=0;
		for (Producto producto : lista) {
			iva= producto.getIva();
			ivaa = iva*0.01;
			precio = producto.getPrecio();
			precioTotal = precio+precio*ivaa;
	%>
	<div class="col-3">
		<div class="container">
			<a href="productoDetalle.jsp?codigo=<%=producto.getCodigo()%>"><img
				src="../<%=producto.getImagen()%>" alt="" class="proimg"></a>
			<p><%=producto.getNombre()%><br> <b>$<%=precioTotal%></b>
			</p>
		</div>
	</div>
	<% } %>
</div>
