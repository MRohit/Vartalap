<%@page import="com.vartalap.service.VartalapService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE HTML>
<html>

<head>

<meta http-equiv="Content-Language" content="mr">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <jsp:directive.include file="../navigation/libs.jsp" /> 
<jsp:directive.include file="../navigation/nav.jsp" />
<%-- <spring:url value="/resources/bootstrap.css" var="bootstrapCSS" />
<spring:url value="/resources/jquery.min.js" var="jqueryJS" />

<link href="${bootstrapCSS}" rel="stylesheet" />
<script src="${jqueryJS}"></script> --%>

<title>Vartalap</title>

</head>
<body>
	<div class="container">
<br/>
	
       <jsp:directive.include file="../navigation/subHeader.jsp" />
       <div class="row">
      
        	<div class="panel panel-primary col-lg-11">
			  <div class="panel-heading panel panel-primary" >
			    <h2 class="panel-title">About Us</h2>
			  </div>
			  <div class="panel panel-default">
			  <div class="col-md-6" align="justify">We are Synchron, the team behind Vartalap product. Our team comprises of 6 engineers, namely- Dipali, Rohit, Gokul, Akshay, Pratap and Shyam (L to R) at Persistent Systems Limited (PSL), Pune.  
			We are currently competing at the Technothon 2015 event organized by PSL, Pune.
			We have the strength of achieving the milestones through progressive work in synchronization, and we work as a unit, though on separate modules but with the same intent of achieving our targets.
			Vartalap will facilitate the PSL employees in discussing the technical, administration and HR related issues in a forum where one meets all at a central place.
			We hope it brings the discussion from table to the portal, and lets speak and listen as,
			 <img class="media-object img-responsive" align="right" src="${clogo}" >
			 
			 </div>
			  <div class="media" align="right">
       <div class="media-right">
   
          <img class="media-object img-responsive" align="right" src="${slogo}" " alt="Synchron logo">
    
            </div>
          </div> 
			
			</div>
			 
			  <div class="panel-body">
			 
				<c:forEach var="ques" items="${list}">
					<div class="panel-body">
			    					 
					 </div> 
				</c:forEach>
				
			  </div>
			  
			 
			</div>
        </div>
    </div>

<br/>
<br/>
<footer>
		<jsp:directive.include file="../navigation/footer.jsp" />
</footer>
</body>
</html>