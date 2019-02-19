<%@ page import="org.comercio.tienda.Msubcategoria"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.comercio.subcategoria.Subcategoria"%>
<%@ page import="org.comercio.tienda.Tiendaa"%>
<%
	String cat = "";
	String cat_nombre="";
	String indice="";
	int indicee=0;
	int categoria = 0;
	try {
		cat = request.getParameter("categoria");
		cat_nombre = request.getParameter("cat_nombre");
		indice=request.getParameter("indice");
		indicee=Integer.parseInt(indice);
	} catch (Exception e) {
		System.out.println("Error: " + e.toString());
	}
	if ((cat == null)||(cat_nombre==null)) {
		response.sendRedirect("../");
	}else{
		categoria = Integer.parseInt(cat);
	}
%>
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
            <h1 class="text-center login-title">Sign in to continue to Bootsnipp</h1>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       
       <%
       String url = "";
       if (indicee==1){
    	   url = "../Usuario";
       }else{
    	   url = "/tienda2/Usuario";
       }
       %>
      
        <form action="<%=url %>" method="post" class="form-signin">
                <input type="text" class="form-control" name="cedula" placeholder="Username" required autofocus>
                <input type="password" class="form-control" name="contra" placeholder="Password" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit" name="login" value="Ingresar al Sistema">Sign in</button>
                   <a href="#" class="pull-right need-help">Forgot Password </a><span class="clearfix"></span>
        </form>
        </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <a href="formulario.jsp" class="text-center new-account">Create an account </a>
      </div>

    </div>
  </div>
</div>
