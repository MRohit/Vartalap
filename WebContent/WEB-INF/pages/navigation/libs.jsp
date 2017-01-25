<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
     <spring:url value="/resources/bootstrap.css" var="bootstrapCSS" />
     <spring:url value="/resources/bootstrapValidator.css" var="bootstrapValidatorCSS" />
	<spring:url value="/resources/jquery.min.js" var="jqueryJS" />
	<spring:url value="/resources/bootstrapValidator.js" var="validatorJS" />
	
	<spring:url value="/resources/bootstrap.min.js" var="bootstrapMin" />
	<spring:url value="/resources/font-awesome.min.css" var="fontMin" />
	<spring:url value="/resources/bootstrap.min.css" var="bootstrapMinCss" />
	<spring:url value="/resources/capture.gif" var="capture" />
	<spring:url value="/resources/logo.JPG" var="logo" />
	<spring:url value="/resources/mlogo.jpg" var="mlogo" />
	<spring:url value="/resources/nicEdit-latest.js" var="niceedit" />
	<spring:url value="home" var="home" />
	<spring:url value="/resources/css/jquery.tagit.css" var="tagit" />
	<spring:url value="/resources/css/tagit.ui-zendesk.css" var="tagitui" />
	<spring:url value="/resources/js/jquery-ui.min.js" var="tagituimin" />
	<%-- <spring:url value="/resources/js/jquery.min.js" var="jmin" /> --%>
	<spring:url value="/resources/js/tag-it.js" var="tagitjs" />
	<spring:url value="/resources/js/tag-it.min.js" var="tagitjsmin" />
	
	
	<spring:url value="https://datatables.net/release-datatables/media/js/jquery.dataTables.js" var="dataTables1" />
	<spring:url value="https://datatables.net/release-datatables/extensions/TableTools/js/dataTables.tableTools.js" var="tableTools" />
	<%-- <spring:url value="/resources/js/jquery.min.js" var="jmin" /> --%>
	<spring:url value="https://datatables.net/release-datatables/media/css/jquery.dataTables.css" var="dataTables2" />
	<spring:url value="https://datatables.net/release-datatables/extensions/TableTools/css/dataTables.tableTools.css" var="dataTables3" />
	
	
	<!-- For Amcharts -->
	<spring:url value="/resources/amcharts.js" var="amcharts" />
	<spring:url value="/resources/serial.js" var="serial" />
	<spring:url value="/resources/style.css" var="style" />
	<spring:url value="/resources/pie.js" var="pie" />
	<!--  For Autosuggest-->
	<%-- <spring:url value="/resources/jquery.mockjax.js" var="mockjax" />
		<spring:url value="/resources/jquery.autocomplete.js" var="autocomplete" />
	<spring:url value="/resources/countries.js" var="countries" />
	<spring:url value="/resources/demo.js" var="demo" /><spring:url value="/resources/styles.css" var="styles" />--%>
	 <spring:url value="/resources/blank-user-medium.png" var="userPic" />
<spring:url value="/resources/twitter.png" var="twitter" />
<spring:url value="/resources/facebook.png" var="facebook" />
<spring:url value="/resources/google.png" var="google" />
<spring:url value="/resources/charcha.jpg" var="clogo" />
<spring:url value="/resources/synchron.jpg" var="slogo" />

	
<link href="${bootstrapCSS}" rel="stylesheet" />
<link href="${fontMin}" rel="stylesheet" />
<link href="${bootstrapMinCss}" rel="stylesheet" />
<link href="${bootstrapValidatorCSS}" rel="stylesheet" />
<link href="${tagit}" rel="stylesheet">
<link href="${tagitui}" rel="stylesheet">
<link href="${dataTables2}" rel="stylesheet">
<link href="${dataTables3}" rel="stylesheet">
<link href="${style}" rel="stylesheet">
<%-- <link href="${dataTables}" rel="stylesheet" /> --%>


<%-- <link href="${styles}" rel="stylesheet" /> --%>

	<script src="${jqueryJS}"></script>
	
	<script src="${bootstrapMin}"></script>
	<script src="${validatorJS}"></script>
	<script src="${niceedit}"></script>
		<script src="${dataTables1}"></script>
	<script src="${tableTools}"></script>
<%-- 	<script src="${dataTables2}"></script> --%>
	
	<script src="${tagituimin}"></script>
	<%-- <script src="${jmin}"></script> --%>
	<script src="${tagitjs}"></script>
	<script src="${tagitjsmin}"></script>
	
	<script src="${amcharts}"></script>
	<script src="${serial}"></script>
	<script src="${pie}"></script>
	
	
	<%-- <script src="${mockjax}"></script>
	<script src="${autocomplete}"></script>
	<script src="${countries}"></script>
	<script src="${demo}"></script> --%>
	<style>

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
 body{
   
}

#login-dp{
    min-width: 250px;
    padding: 14px 14px 0;
    overflow:hidden;
    background-color:rgba(255,255,255,.8);
}
#login-dp .help-block{
    font-size:12px    
}
#login-dp .bottom{
    background-color:rgba(255,255,255,.8);
    border-top:1px solid #ddd;
    clear:both;
    padding:14px;
}
#login-dp .social-buttons{
    margin:12px 0    
}
#login-dp .social-buttons a{
    width: 49%;
}
#login-dp .form-group {
    margin-bottom: 10px;
}
.btn-fb{
    color: #fff;
    background-color:#3b5998;
}
.btn-fb:hover{
    color: #fff;
    background-color:#496ebc 
}
.btn-tw{
    color: #fff;
    background-color:#55acee;
}
.btn-tw:hover{
    color: #fff;
    background-color:#59b5fa;
}
@media(max-width:768px){
    #login-dp{
        background-color: inherit;
        color: #fff;
    }
    #login-dp .bottom{
        background-color: inherit;
        border-top:0 none;
    }
}
</style>
 <!-- <script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script> --> <script type="text/javascript">
//<![CDATA[
bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
//]]>
</script>