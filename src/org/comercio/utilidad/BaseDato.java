package org.comercio.utilidad;

import java.sql.Connection;

import java.sql.DriverManager;

public class BaseDato {

public Connection getConexion(){

Connection conexion1 = null;

String driver = "org.postgresql.Driver";

String url = "jdbc:postgresql://localhost:5432/web201";

String user = "web201";

String password = "web201";

try{

Class.forName(driver);

conexion1 = DriverManager.getConnection(url, user, password);

}

catch(Exception e){

System.out.println("Error: " + e.toString());

}

return conexion1;

}

}