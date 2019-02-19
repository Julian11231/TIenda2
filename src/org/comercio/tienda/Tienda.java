package org.comercio.tienda;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ws.rs.PathParam;

import org.comercio.producto.Producto;
import org.comercio.utilidad.BaseDato;

public class Tienda {
	
	public ArrayList<Producto> getProductos(@PathParam(value = "subcategoria")int subcategoria) {

		ArrayList<Producto> lista = new ArrayList<Producto>();
		BaseDato basedato = new BaseDato();
		Connection conexion1 = null;
		Statement sentencia1 = null;

		ResultSet rs1 = null;
		String sql = "";

		try{
			
		conexion1 = basedato.getConexion();
		sentencia1 = conexion1.createStatement();

		sql = "select * from producto, subcategoria WHERE pro_categoria = subcat_id AND subcat_id="+"'"+subcategoria+"'";
		sql = sql + "AND pro_unidades > 0 ORDER BY pro_codigo";

		rs1 = sentencia1.executeQuery(sql);

		while(rs1.next()){

		int codigo = rs1.getInt("pro_codigo");
		String nombre = rs1.getString("pro_nombre");
		double precio = rs1.getDouble("pro_precio");
		String imagen = rs1.getString("pro_imagen");
		String descripcion = rs1.getString("pro_descripcion");
		String descripcion_larga = rs1.getString("pro_descripcion_larga");
		int categoriaa = rs1.getInt("pro_categoria");
		int iva=rs1.getInt("pro_iva");
		int unidades=rs1.getInt("pro_unidades");
		
		Producto producto = new Producto();

		producto.setCodigo(codigo);
		producto.setNombre(nombre);
		producto.setPrecio(precio);
		producto.setImagen(imagen);
		producto.setDescripcion(descripcion);
		producto.setDescripcion_larga(descripcion_larga);
		producto.setCategoria(categoriaa);
		producto.setIva(iva);
		producto.setUnidades(unidades);



		lista.add(producto);

		}

		}

		catch(Exception e){

		System.out.println("Error: " + e.toString());

		}

		return new ArrayList<Producto>(lista);

		}
}
