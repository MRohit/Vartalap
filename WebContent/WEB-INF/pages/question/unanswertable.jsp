<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Vartalap</title>

<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable( {
        dom: 'T<"clear">lfrtip',
        tableTools: {
           /*  "aButtons": [
                "copy",
                "csv",
                "xls",
                {
                    "sExtends": "pdf",
                    "sPdfOrientation": "landscape",
                    "sPdfMessage": "Your custom message would go here."
                },
                "print"
            ]
       */ } 
    } );
} );
</script>
</head>
<body>
<table id="example" class="display" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Question Title</th>
            
           <!--  <th>Posted By</th> -->
            <th>Posted On</th>
           <!--  <th>No of Answers</th> -->
            <th>Post Answer</th>
            <th>Views</th>
        </tr>
    </thead>
 
    <tfoot>
        <tr>
             <th>Question Title</th>
            
           <!--  <th>Posted By</th> -->
            <th>Posted On</th>
           <!--  <th>No of Answers</th> -->
            <th>Post Answer</th>
            <th>Views</th>
        </tr>
    </tfoot>
 
    <tbody>
    
    <c:forEach var="ques" items="${unanswerquestion}">
	
	<tr>
			<%-- <a href="viewanswer?question_id=${ques.question_id}">${ques.title}</a>	 --%>	 
			<td>${ques.title}</td>
           <%--  <td>${ques.user.firstName} ${ques.user.middleName} ${ques.user.lastName} </td> --%>
            <td>${ques.date}</td>
          <%--   <td>${ques.noOfAnswers}</td> --%>
            <td><a href="viewanswer?question_id=${ques.question_id}">Post Answer</a></td>
            <td>${ques.viewCount}</td>
	  </tr>
</c:forEach>
    
      
    </tbody>
</table>
</body>
</html>