
<%
	/* 	String type = request.getParameter("type");
	 if (type != null) {
	 if (type.equals("admin") || type.equals("hr")) { */
%>
<% if(session.getAttribute("userName") != null) { %>
<div class="col-rg-3">
	<div class="page-header">
		<div class="form-group col-lg-7">
			<label for="usr">Title</label> 
			<input type="text" class="form-control" id="search-box2" name="search-box2" placeholder="Question Title" autocomplete="off" required/>
			<div id="suggesstion-box2"></div>
			<!-- <div class="frmSearch">
							<input type="text" id="search-box2" placeholder="Country Name" />
							<div id="suggesstion-box2"></div>
			          
			         
			        </div> -->
		</div>
		<textarea name="description" style="width: 650px; height: 150px;" placeholder="Enter Description here"></textarea>
		<br>
		<div class="form-group col-lg-7" >
		<ul id="singleFieldTags" ></ul>
			 <input type="hidden" class="form-control" id="mySingleField" name="title"
				placeholder="Enter Tags"> 

			<!-- <ul id="singleFieldTags" class="form-control"></ul>
			<input type="text" class="form-control"  name="tags" id="mySingleField"disabled="disabled"/>

			 -->
			<button type="submit" class="btn btn-primary" id="post" name="post"
				value="post">Post Question</button>
		</div>
	</div>
</div>
	<% }else{ %>
			<div class="alert alert-info" role="alert">please login to post your question</div>
			
			<% } %>
<script>
$("#search-box2").keyup(function() {
	$.ajax({
		type : "POST",
		url : "http://localhost:8080/vartalap/rest/resource/12",
		data : 'keyword=' + $(this).val(),
		beforeSend : function() {
			//$("#search-box2").css("background","#FFF url(LoaderIcon.gif) no-repeat 165px");
		},
		success : function(data) {
			jQuery.removeData("#suggestion-box2");
			$("#suggesstion-box2").show();
			//$("suggesstion-box2").css("height","500px");
			$("#suggesstion-box2").html(data);
			$("#search-box2").css("background", "#FFF");
			//$("#search-box").css("color","white");
		}
	});
});

//To select country name
function selectCountry(val) {
$("#search-box2").val(val);
$("#suggesstion-box2").hide();
}

 $(function() {
	var sampleTags = [ 'c++', 'java', 'php', 'coldfusion', 'javascript',
			'asp', 'ruby', 'python', 'c', 'scala', 'groovy', 'haskell',
			'perl', 'erlang', 'apl', 'cobol', 'go', 'lua' ];

	$('#singleFieldTags').tagit({
		availableTags : sampleTags,
		singleField : true,
		singleFieldNode : $('#mySingleField'),
		placeholderText : 'Enter Tags'
	});
}); 
	$(document).ready(function() {
				$('#defaultForm').bootstrapValidator(
								{
									message : 'This value is not valid',
									feedbackIcons : {
										valid : 'glyphicon glyphicon-ok',
										invalid : 'glyphicon glyphicon-remove',
										validating : 'glyphicon glyphicon-refresh'
									},
									fields : {
										'search-box2' : {
											validators : {
												notEmpty : {
													message : 'The title is required and can\'t be empty'
												}
											}
										}
									}
								});
			});
	
</script>