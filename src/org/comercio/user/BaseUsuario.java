package org.comercio.user;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ws.rs.PathParam;
import org.comercio.utilidad.BaseDato;
public class BaseUsuario {

	public ArrayList<Usuarios> getusuarios(int cedula,String contra){
		ArrayList<Usuarios> lista = new ArrayList<Usuarios>();
		BaseDato basedato = new BaseDato();
		Connection conexion1 = null;
		Statement sentencia1 = null;

		ResultSet rs1 = null;
		String sql = "";
		try{
			
			conexion1 = basedato.getConexion();
			sentencia1 = conexion1.createStatement();
			sql = "select * from cliente WHERE cliente_cedula ="+"'"+cedula+"' AND cliente_contra="+"'"+contra+"'";
			
			rs1 = sentencia1.executeQuery(sql);

			while(rs1.next()){

			String nombre = rs1.getString("cliente_nombre");
			String apellido = rs1.getString("cliente_apellido");
			int cedulaa=rs1.getInt("cliente_cedula");
			String correo = rs1.getString("cliente_correo");
			String contraa = rs1.getString("cliente_contra");
			String genero = rs1.getString("cliente_genero");
			String fecha = rs1.getString("cliente_fecha");
			
			
			;
			
		  Usuarios nuevo = new Usuarios();

			
			nuevo.setUsuario_nombre(nombre);
			nuevo.setUsuario_apellido(apellido);
			nuevo.setUsuario_cedula(cedulaa);
			nuevo.setUsuario_correo(correo);
			nuevo.setUsuario_contra(contraa);
			nuevo.setUsuario_genero(genero);
			nuevo.setUsuario_fecha(fecha);
			lista.add(nuevo);

			}

			}

			catch(Exception e){

			System.out.println("Error: " + e.toString());

			}

			return new ArrayList<Usuarios>(lista);

			}
	
				
	
}
