package org.comercio.subcategoria;

public class Subcategoria {
	int codigo; 
	String nombre;
	int categoria;
	boolean estado;

	public Subcategoria() {
		// TODO Auto-generated constructor stub
	}
	public Subcategoria(int codigo, String nombre,int categoria, boolean estado) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.categoria = categoria;
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
	public int getCategoria() {
		return categoria;
	}
	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	@Override
	public String toString() {
		return "Subcategoria [codigo=" + codigo + ", nombre=" + nombre + ",categoria=" +categoria+", estado=" + estado + "]";
	}

}
