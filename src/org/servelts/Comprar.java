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
import org.comercio.tienda.UnProducto;

/**
 * Servlet implementation class Comprar
 */
@WebServlet("/Comprar")
public class Comprar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comprar() {
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
		Vector<Producto> compras = (Vector<Producto>)session.getAttribute("compras");
		//Vector compras = new Vector();
		
		if(compras == null){
			compras=new Vector<Producto>();
		}
		String nombre="",descripcion="",descripcion_larga="",imagen="",cantidad="";
		int pCodigo=0,pcategoria=0,pCantidad=0;
		double pPrecio=0;
		
		String code = request.getParameter("codigo");
		int pro_codigo = Integer.parseInt(code);
		UnProducto tienda = new UnProducto();
		ArrayList<Producto> lista = tienda.getProducto(pro_codigo);
		
		for (Producto kkk : lista) {
		pCodigo = kkk.getCodigo();
		nombre = kkk.getNombre();
		descripcion = kkk.getDescripcion();
		descripcion_larga = kkk.getDescripcion_larga();
		imagen = kkk.getImagen();
		pcategoria = kkk.getCategoria();
		pPrecio = kkk.getPrecio();
		cantidad = request.getParameter("cantidad");		
		pCantidad = Integer.parseInt(cantidad);
		}
		if(compras.size()==0){
				
		Producto compra = new Producto(pCodigo,nombre,pPrecio,descripcion,descripcion_larga,imagen,pcategoria,pCantidad);
		compras.add(compra);
		
		}else if(compras.size()>=1){
			
			int nuevo = 0,i=0;
			
		while(i<compras.size()){	
		Producto compra = (Producto)compras.elementAt(i);
		int algo = compra.getCodigo();
		if(pCodigo==algo){
			pCantidad = pCantidad+compra.getCantidad();
			compra.setCantidad(pCantidad);
			nuevo = nuevo+1;
		}
		i++;
		}
		if(nuevo==0){
			Producto compra = new Producto(pCodigo,nombre,pPrecio,descripcion,descripcion_larga,imagen,pcategoria,pCantidad);
			compras.add(compra);
		}
		}
		
		session.setAttribute("compras", compras);
		response.sendRedirect("productos/productoDetalle.jsp?codigo="+pCodigo);
		
	}

}
