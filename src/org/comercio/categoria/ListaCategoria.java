package org.comercio.categoria;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.comercio.categoria.Categoria;
import org.comercio.utilidad.BaseDato;

public class ListaCategoria {
	
	public ArrayList<Categoria> getCategoria() {

		ArrayList<Categoria> lista = new ArrayList<Categoria>();

		BaseDato basedato = new BaseDato();
		Connection conexion1 = null;
		Statement sentencia1 = null;
		ResultSet rs1 = null;
		String sql = "";

		try{

		conexion1 = basedato.getConexion();
		sentencia1 = conexion1.createStatement();

		sql = "SELECT * FROM categoriaa ORDER BY cat_nombre";		
		rs1 = sentencia1.executeQuery(sql);

		while(rs1.next()){

		int codigo = rs1.getInt("cat_codigo");
		String nombre = rs1.getString("cat_nombre");
		boolean estado = rs1.getBoolean("cat_estado");
		
		Categoria categoria = new Categoria();

		categoria.setCodigo(codigo);
		categoria.setNombre(nombre);
		categoria.setEstado(estado);
		
		lista.add(categoria);

		}

		}

		catch(Exception e){

		System.out.println("Error: " + e.toString());

		}

		return new ArrayList<Categoria>(lista);

		}
}
