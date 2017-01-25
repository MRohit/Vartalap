<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- <link rel="stylesheet" href="../../bootstrap/bootstrap.css"/>

    <link rel="stylesheet" href="../bootstrap/bootstrapValidator.js "/> -->
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<spring:url value="../../resources/bootstrap.css" var="bootstrapCSS" />
	<spring:url value="../../resources/jquery.min.js" var="jqueryJS" />
    <!-- <script type="text/javascript" src="../bootstrap/jquery.min.js"></script>
    <script type="text/javascript" src="../../bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../bootstrap/bootstrapValidator.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-MfvZlkHCEqatNoGiOXveE8FIwMzZg4W85qfrfIFBfYc= sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
// -->
	<link href="${bootstrapCSS}" rel="stylesheet" />
	<script src="${jqueryJS}"></script>
    <style type="text/css">

.social:hover {
     -webkit-transform: scale(1.1);
     -moz-transform: scale(1.1);
     -o-transform: scale(1.1);
 }
 .social {
     -webkit-transform: scale(0.8);
     /* Browser Variations: */
     
     -moz-transform: scale(0.8);
     -o-transform: scale(0.8);
     -webkit-transition-duration: 0.5s;
     -moz-transition-duration: 0.5s;
     -o-transition-duration: 0.5s;
 }

/*
    Multicoloured Hover Variations
*/
 
 #social-fb:hover {
     color: #3B5998;
 }
 #social-tw:hover {
     color: #4099FF;
 }
 #social-gp:hover {
     color: #d34836;
 }
 #social-em:hover {
     color: #f39c12;
 }
</style>
 <script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script> <script type="text/javascript">
//<![CDATA[
bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
//]]>
</script>