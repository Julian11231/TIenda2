package org.comercio.categoria;

public class Categoria {
	int codigo; 
	String nombre;
	boolean estado;
	public Categoria() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Categoria(int codigo, String nombre, boolean estado) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.estado = estado;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	@Override
	public String toString() {
		return "Categoria [codigo=" + codigo + ", nombre=" + nombre + ", estado=" + estado + "]";
	}
	
}
