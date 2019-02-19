package org.comercio.tienda;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.comercio.categoria.Categoria;
import org.comercio.subcategoria.Subcategoria;
import org.comercio.utilidad.BaseDato;

public class Msubcategoria {

	public ArrayList<Subcategoria> getSubcategoria() {

		ArrayList<Subcategoria> lista = new ArrayList<Subcategoria>();

		BaseDato basedato = new BaseDato();
		Connection conexion1 = null;
		Statement sentencia1 = null;
		ResultSet rs1 = null;
		String sql = "";

		try{

		conexion1 = basedato.getConexion();
		sentencia1 = conexion1.createStatement();

		sql = "SELECT * FROM subcategoria";
		sql = sql + " WHERE sub_estado=TRUE AND EXISTS (select * from producto WHERE pro_categoria = subcat_id)";
		sql = sql + " ORDER BY subcat_id";			
		rs1 = sentencia1.executeQuery(sql);

		while(rs1.next()){

		int codigo = rs1.getInt("subcat_id");
		String nombre = rs1.getString("subcat_nombre");
		int categoria = rs1.getInt("subcat_categoria");
		boolean estado = rs1.getBoolean("sub_estado");
		
		Subcategoria subcategoria = new Subcategoria();

		subcategoria.setCodigo(codigo);
		subcategoria.setNombre(nombre);
		subcategoria.setCategoria(categoria);
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
