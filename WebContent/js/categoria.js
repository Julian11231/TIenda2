$(function() {
var dialog, form;
var table = $('#example').DataTable({
"ajax" : "../servicios/categoria/listar",
"columns" : [ 
{"data" : "codigo"},
{"data" : "nombre"},
{"data" : "estado"}
]
});
$('#example tbody').on('click', 'tr', function() {
if ($(this).hasClass('selected')) {
$(this).removeClass('selected');
} else {
table.$('tr.selected').removeClass('selected');
$(this).addClass('selected');
}
});
function editar(accion) {
var codigo = "0";
var nombre = "";
if (accion != "Adicionar") {
codigo = table.row('.selected').data().codigo;
nombre = table.row('.selected').data().nombre;
}
document.getElementById("accion").value = accion;
document.getElementById("codigo").value = codigo;
document.getElementById("name").value = nombre;
dialog.dialog("open");
}
function ejecutar() {
var accion = document.getElementById("accion").value;
$("#boton").html('<span class="ui-button-text">' + accion + '</span>');
if (accion == "Adicionar") {
adicionarProducto();
}
if (accion == "Modificar") {
modificarProducto();
}
if (accion == "Eliminar") {
eliminarProducto();
}
if (accion == "Activar") {
activarProducto();
}
}
function adicionarProducto() {
// Collect input from html page
var nombre = document.getElementById("name").value;
var r = new REST.Request();
r.setURI(REST.apiURL + "/categoria/adicionar");
r.setMethod("POST");
r.setContentType("application/json");
r.setEntity({
nombre : nombre
});
r.execute(function(status, request, entity) {
mostrarRespuesta(entity);
});
}
function modificarProducto() {
// Collect input from html page
var codigo = document.getElementById("codigo").value;
var nombre = document.getElementById("name").value;
var r = new REST.Request();
r.setURI(REST.apiURL + "/categoria/modificar/" + codigo);
r.setMethod("PUT");
r.setContentType("application/json");
r.setEntity({
nombre : nombre
});
r.execute(function(status, request, entity) {
mostrarRespuesta(entity);
});
}
function eliminarProducto() {
// Collect input from html page
var codigo = document.getElementById("codigo").value;
var r = new REST.Request();
r.setURI(REST.apiURL + "/categoria/desactivar/" + codigo);
r.setMethod("DELETE");
r.execute(function(status, request, entity) {
mostrarRespuesta(entity);
});
}
function activarProducto() {
	// Collect input from html page
var codigo = document.getElementById("codigo").value;
var r = new REST.Request();
r.setURI(REST.apiURL + "/categoria/activar/" + codigo);
r.setMethod("DELETE");
r.execute(function(status, request, entity) {
mostrarRespuesta(entity);
});
}
function mostrarRespuesta(entity){
table.ajax.reload();
dialog.dialog("close");
document.getElementById("dialogo-mensaje").innerHTML = "<p>"
+ entity.mensaje + "</p>";
$("#dialogo-mensaje").dialog({
modal : true,
buttons : {
Ok : function() {
$(this).dialog("close");
}
}
});
}
dialog = $("#dialog-form").dialog({
autoOpen : false,
width : 660,
modal : true,
buttons : {
"Ejecutar": {
id: 'boton',
text: 'Ejecutar',
click: function () {
ejecutar();
}
},
Cancel : function() {
dialog.dialog("close");
}
},
close : function() {
form[0].reset();
}
});
form = dialog.find("form").on("submit", function(event) {
	event.preventDefault();
	ejecutar();
	});
	$("#adicionar").button().on("click", function() {
	editar('Adicionar');
	});
	$("#modificar").button().on("click", function() {
	editar('Modificar');
	});
	$("#eliminar").button().on("click", function() {
	editar('Eliminar');
	});
	$("#activar").button().on("click", function() {
		editar('Activar');
		});
});