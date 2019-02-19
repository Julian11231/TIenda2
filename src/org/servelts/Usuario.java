package org.servelts;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.comercio.producto.Producto;
import org.comercio.user.BaseUsuario;
import org.comercio.user.Usuarios;


/**
 * Servlet implementation class Usuario
 */
@WebServlet("/Usuario")
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Usuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Usuarios usuario = (Usuarios)session.getAttribute("usuario");
		
		if(usuario == null){
			usuario=new Usuarios();
		}
		String nombre="",apellido="",correo="",contra="",fecha="",genero="";
		int cedula=0;
		
		String cedulaa = request.getParameter("cedula");
		String contraa = request.getParameter("contra");
		cedula = Integer.parseInt(cedulaa);
		BaseUsuario usuarios = new BaseUsuario();
		ArrayList<Usuarios> lista = usuarios.getusuarios(cedula,contraa);
		
		for (Usuarios kkk : lista) {
			nombre = kkk.getUsuario_nombre();
			apellido=kkk.getUsuario_apellido();
			correo=kkk.getUsuario_correo();
			contra=kkk.getUsuario_contra();
			cedula=kkk.getUsuario_cedula();
			fecha=kkk.getUsuario_fecha();
			genero=kkk.getUsuario_genero();
			
		}
		if(lista.isEmpty()) {
			response.sendRedirect("/tienda2/sesion/error.jsp");
		}
		else{
			usuario = new Usuarios(nombre,apellido,cedula,correo,contra,genero,fecha);
			session.setAttribute("usuario", usuario);
			response.sendRedirect("/tienda2/");
		}
	}

}
