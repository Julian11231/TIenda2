package org.servelts;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.comercio.producto.Producto;

/**
 * Servlet implementation class GestionCarro
 */
@WebServlet("/GestionCarro")
public class GestionCarro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionCarro() {
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
		Vector compras = (Vector)session.getAttribute("compras");
		String accion = request.getParameter("accion");
		int cAccion = Integer.parseInt(accion);
		if(cAccion==1){
			String b = request.getParameter("i");
			int i = Integer.parseInt(b);
				compras.removeElementAt(i);			
		}else if(cAccion==2){
			compras.clear();
			session.removeAttribute("compras");
		}else if(cAccion==3){
			String b = request.getParameter("i");
			int i = Integer.parseInt(b);
			String ncantidad = request.getParameter("cantidad");
			int nuevaCantidad = Integer.parseInt(ncantidad);
			Producto compra = (Producto)compras.elementAt(i);
			compra.setCantidad(nuevaCantidad);
		}
	}

}




