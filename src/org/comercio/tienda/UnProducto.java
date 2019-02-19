package org.comercio.tienda;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ws.rs.PathParam;

import org.comercio.producto.Producto;
import org.comercio.utilidad.BaseDato;

public class UnProducto {
	public ArrayList<Producto> getProducto(@PathParam(value = "pro_codigo") int pro_codigo) {

		ArrayList<Producto> lista = new ArrayList<Producto>();
		BaseDato basedato = new BaseDato();
		Connection conexion1 = null;
		Statement sentencia1 = null;

		ResultSet rs1 = null;
		String sql = "";

		try {

			conexion1 = basedato.getConexion();
			sentencia1 = conexion1.createStatement();

			sql = "select * from producto WHERE pro_codigo=" + "'" + pro_codigo + "'";

			rs1 = sentencia1.executeQuery(sql);

			while (rs1.next()) {

				int codigo = rs1.getInt("pro_codigo");
				String nombre = rs1.getString("pro_nombre");
				double precio = rs1.getDouble("pro_precio");
				String imagen = rs1.getString("pro_imagen");
				String descripcion = rs1.getString("pro_descripcion");
				String descripcion_larga = rs1.getString("pro_descripcion_larga");
				int categoria = rs1.getInt("pro_categoria");
				int iva=rs1.getInt("pro_iva");
				int unidades=rs1.getInt("pro_unidades");

				Producto unproducto = new Producto();

				unproducto.setCodigo(codigo);
				unproducto.setNombre(nombre);
				unproducto.setPrecio(precio);
				unproducto.setImagen(imagen);
				unproducto.setDescripcion(descripcion);
				unproducto.setDescripcion_larga(descripcion_larga);
				unproducto.setCategoria(categoria);
				unproducto.setIva(iva);
				unproducto.setUnidades(unidades);

				lista.add(unproducto);

			}

		}

		catch (Exception e) {

			System.out.println("Error: " + e.toString());

		}

		return new ArrayList<Producto>(lista);

	}
}
