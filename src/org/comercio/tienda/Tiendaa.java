package org.comercio.tienda;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ws.rs.PathParam;

import org.comercio.subcategoria.Subcategoria;
import org.comercio.utilidad.BaseDato;


public class Tiendaa {
	
	public ArrayList<Subcategoria> getSubcategoria(@PathParam(value = "categoria")int categoria) {

		ArrayList<Subcategoria> lista = new ArrayList<Subcategoria>();
		BaseDato basedato = new BaseDato();
		Connection conexion1 = null;
		Statement sentencia1 = null;

		ResultSet rs1 = null;
		String sql = "";

		try{
			
		conexion1 = basedato.getConexion();
		sentencia1 = conexion1.createStatement();

		sql = "select * from subcategoria WHERE sub_estado=TRUE AND subcat_categoria="+"'"+categoria+"'";
		sql = sql + " ORDER BY subcat_id";
		rs1 = sentencia1.executeQuery(sql);

		while(rs1.next()){

		int codigo = rs1.getInt("subcat_id");
		String nombre = rs1.getString("subcat_nombre");
		int categoriaa = rs1.getInt("subcat_categoria");
		boolean estado= rs1.getBoolean("sub_estado");

		
		Subcategoria subcategoria = new Subcategoria();

		subcategoria.setCodigo(codigo);
		subcategoria.setNombre(nombre);
		subcategoria.setCategoria(categoriaa);
		subcategoria.setEstado(estado);



		lista.add(subcategoria);

		}

		}

		catch(Exception e){

		System.out.println("Error: " + e.toString());

		}

		return new ArrayList<Subcategoria>(lista);

		}
}
