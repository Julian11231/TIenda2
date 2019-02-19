var myVar;
function myFunction() {
	$("#cart").removeClass("add-to-cart btn btn-default").addClass("btn btn-lg btn-success");
	document.getElementById("cart").value = "added";
	myVar = setTimeout(alertFunc, 1000);
	function alertFunc() {
		document.getElementById("add").submit();
		}
}