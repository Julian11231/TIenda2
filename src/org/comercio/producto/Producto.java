package org.comercio.producto;

public class Producto {

int codigo;
String nombre;
double precio;
String descripcion;
String descripcion_larga;
String imagen;
int categoria;
int cantidad;
int iva;
int unidades;


public Producto() {
	super();
	// TODO Auto-generated constructor stub
}

public Producto(int codigo, String nombre, double precio, String descripcion, String descripcion_larga, String imagen,
		int categoria, int cantidad,int iva, int unidades) {
	super();
	this.codigo = codigo;
	this.nombre = nombre;
	this.precio = precio;
	this.descripcion = descripcion;
	this.descripcion_larga = descripcion_larga;
	this.imagen = imagen;
	this.categoria = categoria;
	this.cantidad = cantidad;
	this.iva=iva;
	this.unidades=unidades;
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

public double getPrecio() {

return precio;

}

public void setPrecio(double precio) {

this.precio = precio;

}

public String getDescripcion() {
	return descripcion;
}

public void setDescripcion(String descripcion) {
	this.descripcion = descripcion;
}

public String getDescripcion_larga() {
	return descripcion_larga;
}

public void setDescripcion_larga(String descripcion_larga) {
	this.descripcion_larga = descripcion_larga;
}

public String getImagen() {
	return imagen;
}

public void setImagen(String imagen) {
	this.imagen = imagen;
}

public int getCantidad() {
	return cantidad;
}

public void setCantidad(int cantidad) {
	this.cantidad = cantidad;
}

public int getCategoria() {
	return categoria;
}

public void setCategoria(int categoria) {
	this.categoria = categoria;
}

public int getIva() {
	return iva;
}

public void setIva(int iva) {
	this.iva = iva;
}

public int getUnidades() {
	return unidades;
}

public void setUnidades(int unidades) {
	this.unidades = unidades;
}

@Override
public String toString() {
	return "Producto [codigo=" + codigo + ", nombre=" + nombre + ", precio=" + precio + ", descripcion=" + descripcion
			+ ", descripcion_larga=" + descripcion_larga + ", imagen=" + imagen + ", categoria=" + categoria
			+ ", cantidad=" + cantidad + ",iva="+iva+",unidades="+unidades+"]";
}

}