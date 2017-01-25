<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="hi">
<jsp:directive.include file="../navigation/libs.jsp" />
<jsp:directive.include file="../navigation/nav.jsp" />



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vartalap</title>


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
					<li role="presentation" class="active"><a href="${home}">Home</a></li>
			
					
					
					  <%  if(session.getAttribute("userName") !=null) { %>
			 				<li role="presentation"><a href="profile?userName=${userName}">Profile</a></li>
			 			<% } %>
					<li role="presentation"><a href="search">Questions</a></li>
					<li role="presentation"><a href="question">Ask Questions</a></li>
					<li role="presentation"><a href="unanswered">UnAnswered</a></li>
				</ul>


			</div>
			</section>

		</div>
		<%--  <jsp:directive.include file="../navigation/subHeader.jsp" /> --%>
		<%-- <h1><%out.println(session.getAttribute("userName")); %></h1> --%>
		<div class="row">
			
			<div class="panel panel-primary col-lg-8">
			  <div class="panel-heading panel panel-primary">
			    <h3 class="panel-title">Question : ${question.title}</h3>
			  </div>
			  <div class="panel-body">
			  <% %>
			  <fieldset>
				<h5>
					<strong>Description :</strong> ${question.description}
				</h5>
				<i>Posted by:</i> <strong>${user.firstName}</strong>
			</fieldset>
				<c:forEach var="ques" items="${answerList}">
					<div class="panel-body well well-lg">
						<h5 class="alert alert-info" style="font-color:black;">${ques.answer} </h5>
						<label for="rate${ques.answer_id}">Rate Answer:</label>
						<select class="select" name=${ques.answer_id} id="rate" >
							<option value="">Rate</option>
							
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
						Current Rating: ${ques.rating}
						<i>Posted by </i>:<b> ${ques.user.firstName} ${ques.user.lastName}</b> 
					 </div> 
				</c:forEach>
				
			  </div>
			  
			 
			</div>
		</div>
		<div class="row">
			<%-- <legend>Question : ${question.title} Posted
				on-${question.date}</legend>
			<fieldset>
				<h5>
					<strong>Description :</strong> ${question.description}
				</h5>
				posted by:${user.firstName}
			</fieldset>
			
			
			<c:forEach var="ques" items="${answerList}">
				<div class="well well-lg">
					<h5>${ques.answer} </h5>
					<label for="rate${ques.answer_id}">Rate Answer:</label>
					<select class="select" name=${ques.answer_id} id="rate" >
						<option value="">Rate</option>
						
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					${answer.rating}
				</div>
			</c:forEach> --%>
			
			<% if(session.getAttribute("userName") != null) { %>
			<sf:form id="defaultForm" method="post" modelAttribute="model"
				action="saveanswer" class="form-horizontal">
				<fieldset>
					<div class="col-rg-3">
						<div class="page-header">
							<div class="form-group col-lg-7"></div>
							<textarea placeholder="Post Answer" name="answer" id="answer"
								style="width: 650px; height: 150px;">
									
							</textarea>
							<br /> <input type="hidden" value="${question.question_id}"
								name="question" /> <input type="hidden" value="${user.user_id}"
								name="user" />
							<button type="submit" class="btn btn-primary" id="post"
								name="post" value="post">Post Answer</button>
						</div>


					</div>
				</fieldset>
			</sf:form>
			<% }else{ %>
			<div class="alert alert-info" role="alert">please login to post your answer</div>
			
			<% } %>
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
	$("#answer").click(function() {
		$("#answer").val("");
	});
	/* $("#type").change(function(e){
	 //alert('helo');
	 $.ajax({
	 type: "GET",
	 url: "questiontype",
	 data:$(".form").serialize(),
	 success: function(server_response){
	 // alert("Received");
	 $("#result").html(server_response);
	 }
	 });
	 }); */
	 $(".select").change(function(e) {
			//e.preventDefault();
			var value=$(this).val();
			var answer_id=$(this).attr('name');
			
			var url2="rateanswer?rating="+value+"&answer_id="+answer_id;
			//alert(url2);
			$.ajax({
				type : "GET",
				url : url2,
				success : function(server_response) {
					alert("Rated Successfully");
					//$("#result").html(server_response);
				}
			}); 
		});
	/* $("#post").click(function(e) {
		e.preventDefault();
		//alert('helo');
		$.ajax({
			type : "POST",
			url : "saveanswer",
			data : $("#defaultForm").serialize(),
			success : function(server_response) {
				//$("#ans").fadeOut(slow);
				//$("#result").html(server_response);
			}
		});
	}); */

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