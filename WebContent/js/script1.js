function getProductos(subcategoria,a,cat_nombre){
	$("#div_productos").load("productos.jsp?subcategoria="+subcategoria+"&a="+a+"&cat_nombre="+cat_nombre);
	
	var size = document.getElementById("size").value;;
	for(var i=1;i<=size;i++){
	$("#c"+i).removeClass("btn btn-primary btn-block").addClass("btn btn-success btn-block");
	}
	$("#c"+subcategoria).removeClass("btn btn-success btn-block").addClass("btn btn-primary btn-block");
}