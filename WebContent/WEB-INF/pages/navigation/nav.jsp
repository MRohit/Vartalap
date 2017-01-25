<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>


<nav class="navbar navbar-inverse">
<div class="container-fluid">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"><img alt="logo" src="${capture}" /></a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li ><a href="home">Home <span class="sr-only">(current)</span></a></li>
			<li><a href="search">Questions</a></li>
			
			 <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Analysis <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="typechart">Question Distribution</a></li>
			            <li><a href="questionans">Question/Answer</a></li>
		
			          </ul>
			 </li> 
		</ul>
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<div class="frmSearch">
					<input type="text" id="search-box" placeholder="Question" /> 
					<!-- <!-- <input list="search-box" placeholder="Question"/> -->
					<datalist id="search-box">
						 
					</datalist> -->
					<div id="suggesstion-box"></div>


				</div>
			</div>
			<button type="submit" id="searchbtn" class="btn btn-default">Submit</button>

		</form>
		<ul class="nav navbar-nav navbar-right">
		<%  if(session.getAttribute("userName") ==null) { %>
			 <li><a href="register">Register</a></li> 
			 <%} %>
			<li><a href="aboutus">Synchrons</a></li>
			<%  if(session.getAttribute("userName") ==null) { %>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
				<ul id="login-dp" class="dropdown-menu">
					<li>
						<div class="row">
							<div class="col-md-12">
								
								<sf:form class="form" role="form" method="post"
									modelAttribute="loginBean" action="loginServlet"
									accept-charset="UTF-8" id="login-nav">
									<div class="form-group">
										<label class="sr-only" for="exampleInputEmail2">Email
											address</label> <input type="text" class="form-control"
											name="userName" id="userName" placeholder="Username"
											required>
									</div>
									<div class="form-group">
										<label class="sr-only" for="exampleInputPassword2">Password</label>
										<input type="password" class="form-control" name="password"
											id="password" placeholder="Password" required>
										<div class="help-block text-right">
											<a href="">Forget the password ?</a>
										</div>
									</div>
									<div class="form-group">
										<input type="submit" id="sub" value="login" />
										<!--  <button type="submit" id="submit"name="submit"class="btn btn-primary btn-block">Sign in</button> -->
									</div>
									<div class="checkbox">
										<label> <input type="checkbox"> keep me
											logged-in
										</label>
									</div>
								</sf:form>
							</div>
							<div class="bottom text-center">
								New here ? <a href="register"><b>Join Us</b></a>
							</div>
						</div>
					</li>
				</ul>
				</li>
				<% }else{ %>
				<li><a  href="profile?userName=${userName}"><b><%out.println(session.getAttribute("userName")); %></b></a>
				<li><a href="logout">Logout</a>
				
				<% } %>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid --> </nav>
<script>
	//AJAX call for autocomplete 
	$(document)
			.ready(
					function() {
						$("#search-box")
								.keyup(
										function() {
											$
													.ajax({
														type : "POST",
														url : "http://localhost:8080/vartalap/rest/resource/12",
														data : 'keyword='
																+ $(this).val(),
														beforeSend : function() {
															$("#search-box")
																	.css(
																			"background",
																			"#FFF url(LoaderIcon.gif) no-repeat 165px");
														},
														success : function(data) {
															//alert(data);
															$(
																	"#suggesstion-box")
																	.show();
															$(
																	"#suggesstion-box")
																	.html(data);
															$("#search-box")
																	.css(
																			"background",
																			"#FFF");
															//$("#search-box").css("color","white"); 
															/* for(var i=0;i<data.length;i++)
												            {
												                $("#search-box").append("<option value='" + 
												                data[i] + "'></option>");
												            } */
														}
													});
										});
					});
	//To select country name
	function selectCountry(val) {
		$("#search-box").val(val);
		$("#suggesstion-box").hide();
		
	}
</script>
<style>
</style>
<script>
	/* $("#search").keyup(function(e){
	e.preventDefault();
	
	var search=$("#search").val();
	//var password=$("#password").val();
	 
	alert('In key up:'+search);
	$.ajax({
		type: "GET",
		  url: "http://localhost:8080/vartalap/rest/resource/10",
		  success: function(success){
			  alert(success.tag_id);
		  }
	});
	});  */

	/* $('#autocomplete-ajax').autocomplete({
	    lookup: function (query, done) {
	    	var suggestions;
	    	
	    	var suggestions2={};
	        // Do ajax call or lookup locally, when done,
	        // call the callback and pass your results:
	        	var temp={"value": "Hellodata", 
	        		"data": "H"
	        	};
	        $.ajax({
		type: "GET",
		  url: "http://localhost:8080/vartalap/rest/resource/12",
		  success: function(success){
			 // suggestions=success;
			 //alert(success[0].value);
			  //suggestions2 = success;
			  temp=JSON.parse(success);
			 alert('Temp:'+temp.value);
		  }
	});
	        var result = {
	            //suggestions: JSON.parse(temp)
	            suggestions: temp
	        };

	        done(result);
	    },
	    onSelect: function (suggestion) {
	        alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
	    }
	}); */
</script>
