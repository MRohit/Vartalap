<%@page import="com.vartalap.service.VartalapService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Language" content="hi">
 <jsp:directive.include file="navigation/libs.jsp" /> 
<jsp:directive.include file="navigation/nav.jsp" />
<%-- <spring:url value="/resources/bootstrap.css" var="bootstrapCSS" />
<spring:url value="/resources/jquery.min.js" var="jqueryJS" />

<link href="${bootstrapCSS}" rel="stylesheet" />
<script src="${jqueryJS}"></script> --%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vartalap</title>

</head>
<body>
	<div class="container">
<br/>
	
       <jsp:directive.include file="navigation/subHeader.jsp" />
       <div class="row">
        	<div class="panel panel-primary col-lg-8">
			  <div class="panel-heading panel panel-primary">
			    <h3 class="panel-title">Latest Questions</h3>
			  </div>
			  <div class="panel-body">
			  <% %>
				
				
				<c:choose>
				    <c:when test="${fn:length(list) == 0}">
				       <div class="alert alert-info" role="alert">No Questions Posted</div>
				       
				    </c:when>    
				    <c:otherwise>
				       <c:forEach var="ques" items="${list}">
							<div class="panel-body well well-lg">
								<h4 class="alert alert-info" style="font-color:black;"><a href="viewanswer?question_id=${ques.question_id}"> <font color="#696969">${ques.title}</font></a></h4>
					    			
					    		<h6> Views:${ques.viewCount} &nbsp;&nbsp;&nbsp;&nbsp;Answers:${ques.noOfAnswers}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>Posted by:</i> <strong>${ques.user.firstName}  ${ques.user.lastName }</strong></h6>
					    		<%-- <small><cite title="San Francisco, USA">San Francisco, USA <i class="glyphicon glyphicon-map-marker">
		                        </i></cite></small> --%>
							 </div> 
						</c:forEach>
				    </c:otherwise>
				</c:choose>
				
			  </div>
			  
			 
			</div>
			<div class="panel panel-primary col-lg-3">
				 <div class="panel-heading panel panel-primary">
			    <h3 class="panel-title">Related Tags</h3>
			  </div>
			  <div class="panel-body">
			  <% %>
				<c:forEach var="tag" items="${tagList}">
					
							<h4 class="alert alert-info" style="font-color:black;"><a href="questionbytags?tagName=${tag.tag_name}"> <font color="#696969">${tag.tag_name}</font></a></h4>
					
				</c:forEach>
					
				
				
			  </div>
			</div>
        </div>
    </div>
  

<br/>
<br/>
<footer>
		<jsp:directive.include file="navigation/footer.jsp" />
</footer>
</body>
</html>