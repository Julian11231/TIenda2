package org.comercio.user;

public class Usuarios {
    String usuario_nombre;
    String usuario_apellido;
    int usuario_cedula;
    String usuario_correo;
    String usuario_contra;
    String usuario_genero;
    String usuario_fecha;
    
    
	public Usuarios() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Usuarios(String usuario_nombre, String usuario_apellido, int usuario_cedula, String usuario_correo,
			String usuario_contra, String usuario_genero, String usuario_fecha) {
		super();
		this.usuario_nombre = usuario_nombre;
		this.usuario_apellido = usuario_apellido;
		this.usuario_cedula = usuario_cedula;
		this.usuario_correo = usuario_correo;
		this.usuario_contra = usuario_contra;
		this.usuario_genero = usuario_genero;
		this.usuario_fecha = usuario_fecha;
	}


	public String getUsuario_nombre() {
		return usuario_nombre;
	}
	public void setUsuario_nombre(String usuario_nombre) {
		this.usuario_nombre = usuario_nombre;
	}
	public String getUsuario_apellido() {
		return usuario_apellido;
	}
	public void setUsuario_apellido(String usuario_apellido) {
		this.usuario_apellido = usuario_apellido;
	}
	public int getUsuario_cedula() {
		return usuario_cedula;
	}
	public void setUsuario_cedula(int usuario_cedula) {
		this.usuario_cedula = usuario_cedula;
	}
	public String getUsuario_correo() {
		return usuario_correo;
	}
	public void setUsuario_correo(String usuario_correo) {
		this.usuario_correo = usuario_correo;
	}
	public String getUsuario_contra() {
		return usuario_contra;
	}
	public void setUsuario_contra(String usuario_contra) {
		this.usuario_contra = usuario_contra;
	}
	public String getUsuario_genero() {
		return usuario_genero;
	}
	public void setUsuario_genero(String usuario_genero) {
		this.usuario_genero = usuario_genero;
	}
	public String getUsuario_fecha() {
		return usuario_fecha;
	}
	public void setUsuario_fecha(String usuario_fecha) {
		this.usuario_fecha = usuario_fecha;
	}
    


	}