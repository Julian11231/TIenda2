function getProductos(categoria){
	$("#div_admproductos").load("admproductos.jsp?categoria="+categoria);
	$("#div_admproductos").load("index.jsp"+" #div_admproductos?categoria="+categoria);
}