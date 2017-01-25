<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Language" content="hi">
<jsp:directive.include file="../navigation/libs.jsp" />
<jsp:directive.include file="../navigation/nav.jsp" />



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vartalap</title>
<script type="text/javascript">
/* $(document).ready(function() {
    $('#example').DataTable( {
        "ajax": "data/array/s.txt"
    } );
} ); */
</script>


</head>
<body>

	<div class="container">
		<br />
		<div class="row">
			<section>
			<div class="col-lg-3">
				<img alt="Logo" class="img-responsive" src="${logo}" />
			</div>
			<div class="col-rg-3 col-lg-offset-7">

				<ul class="nav nav-pills">
					<li role="presentation"><a href="${home}">Home</a></li>
					<%  if(session.getAttribute("userName") !=null) { %>
			 				<li role="presentation"><a href="profile?userName=${userName}">Profile</a></li>
			 			<% } %>
					<li role="presentation"  class="active"><a href="search">Questions</a></li>
					<li role="presentation"><a href="question">Ask Questions</a></li>
					<li role="presentation"><a href="unanswered">UnAnswered</a></li>
				</ul>
			</div>
			</section>

		</div>
		<%--  <jsp:directive.include file="../navigation/subHeader.jsp" />  --%>
	
			<%-- <%
			if(session.getAttribute("userName") != null)
				out.println(session.getAttribute("userName"));
			%> --%>
		
		<div class="row">
			<form id="defaultForm" method="post" action="postquestion"
				class="form-horizontal">
				<fieldset>
					<legend>View Questions</legend>

					<div class="form-group">
						<label class="col-lg-3 control-label">Question Type</label>
						<div class="col-lg-5">
							<select class="form-control" id="type" name="type">
								<option value="">-- Select question type --</option>
								<option value="technical">Technical</option>
								<option value="hr">HR</option>
								<option value="admin">Admin</option>
							</select>
						</div>
					</div>
					<input type="hidden"
						value="<%out.println(session.getAttribute("userName"));%>"
						name="userName" /> <span id="result"></span>
				</fieldset>
			</form>

			<!--    <div class="col-rg-3">
                    <div class="page-header">
                    	<div class="form-group col-lg-7">
						  <label for="usr">Title</label>
						  <input type="text" class="form-control" id="usr" placeholder="Question Title">
						</div>
                        	 <textarea name="area3" style="width: 650px; height: 150px;">
									What's bothering you..?
							</textarea>
							<br/>
                    </div>
                </div>  -->
		</div>
	</div>
	<br />
	<br />
	<footer> <jsp:directive.include
		file="../navigation/footer.jsp" /> </footer>
</body>
</html>


<script type="text/javascript">
	$("#type").change(function(e) {
		//alert('helo');
		var type=$("#type").val();
		url2="http://localhost:8080/vartalap/rest/resource/search?type="+type;
		$.ajax({
			type : "GET",
			url : "table?type="+type,
			success : function(server_response) {
				// alert("Received");
				$("#result").html(server_response);
			}
		});
	});

	$("#post").click(function(e) {
		e.preventDefault();
		/* var v=$("#mySingleField").val();
		alert(v); */
		alert('helo');
		$.ajax({
			type : "POST",
			url : "postquestion",
			data : $(".form").serialize(),
			success : function(server_response) {
				alert("Received");
				// $("#result").html(server_response);
			}
		});
	});

	$(document)
			.ready(
					function() {
						$('#defaultForm')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												type : {
													validators : {
														notEmpty : {
															message : 'The country is required and can\'t be empty'
														}
													}
												}
											}
										});
					});
</script>