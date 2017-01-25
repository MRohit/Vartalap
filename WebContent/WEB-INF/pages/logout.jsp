<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="hi">
 <jsp:directive.include file="navigation/libs.jsp" /> 
<jsp:directive.include file="navigation/nav.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vartalap</title>

 
     
</head>
<body>
 <%
 session.setAttribute("userName", null);
 session.invalidate();%>>
 <center><h1>Your have successfully logged out..!
 
 </h1></center></br>

 <meta http-equiv="refresh" content="0; url=home"/>
 <footer>
		<jsp:directive.include file="navigation/footer.jsp" />
</footer>
 

</body>
</html>