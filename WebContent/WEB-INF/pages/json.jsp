
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vartalap
</title>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#btnSearch").click(function(){
		var name=$("#search").val();
		var url="http://localhost:8082/varaap/rest/resource/11";
		//var url2="http://localhost:8082/Web_Services/webservices/product/all";
		//alert(url);
		 $.getJSON(url, function(result){
		        $.each(result, function(i, field){
		            $("#result").append(field.id + " ");
		        }); 
		        $("#result").text(result.id);
		 });
	});
	$("#btnAdd").click(function(){
		
		var arr={
				id:$("#id").val(),
				name:$("#productName").val(),
				price:$("#price").val(),
				quantity:$("#quantity").val()
		};
		var jsonFormat=JSON.stringify(arr);
		 $.ajax({
			url:"http://localhost:8082/Web_Services/webservices/product/add",
			type:'POST',
			data:jsonFormat,
			contentType:"application/json",
			success:function(data){
				alert(data);
			}
		 });
	});
});

</script>
</head>
<body>
	<input type="search" name="search" id="search"/>
	<button id="btnSearch">Search</button>
	<span id="result"></span>
	<fieldset>
		<form id="form" method="post">
			<input type="text" name="id" id="id" placeholder="ID"/>
			<input type="text" name="productName" id="productName" placeholder="Product Name"/>
			<input type="text" name="price" id="price" placeholder="Price"/>
			<input type="text" name="quantity" id="quantity"placeholder="Quantity"/>
			<input type="button" id="btnAdd" value="Add"/>
		</form>
		
	</fieldset>
</body>
</html>