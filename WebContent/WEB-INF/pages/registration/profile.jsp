<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#profTable {
 border-collapse: collapse;
  border-spacing: 1000px;
}
</style>
<meta http-equiv="Content-Language" content="hi">
 <jsp:directive.include file="../navigation/libs.jsp" /> 
<jsp:directive.include file="../navigation/nav.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vartalap</title>
</head>
<body>
<div class="container">
 <br>	
  <%-- <jsp:directive.include file="../navigation/subHeader.jsp" /> --%>
  <section>
			<div class="col-lg-3">
				<img alt="Logo" class="img-responsive" src="${logo}" />
			</div>
			<div class="col-rg-3 col-lg-offset-7">

				<ul class="nav nav-pills">
					<li role="presentation"><a href="${home}">Home</a></li>
					<%  if(session.getAttribute("userName") !=null) { %>
			 				<li role="presentation" class="active"><a href="profile?userName=${userName}">Profile</a></li>
			 			<% } %>
					<%-- <li role="presentation"><a href="profile?userName=${userName}">Profile</a></li> --%>
					<li role="presentation" ><a href="search">Questions</a></li>
					<li role="presentation"><a href="question">Ask Questions</a></li>
					<li role="presentation"><a href="unanswered">UnAnswered</a></li>
				</ul>
			</div>
			</section>
 
 </div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title"><strong>${user.firstName} ${user.lastName}</strong></h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="${userPic}" class="img-circle img-responsive"> </div>
                
                <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Category:</td>
                        <td>${user.skills}</td>
                      </tr>
                      
                      <tr>
                        <td>Date of Birth</td>
                        <td>${user.DOB}</td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>Gender</td>
                        <td>${user.gender}</td>
                      </tr>
                       
                      <tr>
                        <td>Email</td>
                        <td><a href="${user.email}">${user.email}</a></td>
                      </tr>
                      <tr>
                        <td>Phone Number</td>
                        <td>${user.contact_no }(Mobile)
                        </td>
                           
                      </tr>
                     <tr>
                     	<td><h5 class="alert alert-info" style="width:160px;">Questions Posted:${countquestion}</h5></td>
                     	<td> <h5 class="alert alert-info"  style="width:160px;">Answers Posted:${countanswer}</h5></td>
                     </tr>
                    </tbody>
                  </table>
                  
                  <!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
					  	View Posted Questions
					</button>
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title" id="myModalLabel">Quesions</h4>
					      </div>
					      <div class="modal-body">
					      	<c:forEach var="ques" items="${questionsasked}">
					      		<h4>${ques.title}</h4>
					        	 <p><b>Description:</b>${ques.description}</p>
								<a href="viewanswer?question_id=${ques.question_id}">View Answer</a>
						    					 
								 
							</c:forEach>
					      	
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Save changes</button>
					      </div>
					    </div>
					  </div>
					</div>
                  
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                        <jsp:directive.include file="../navigation/footer.jsp" />
                    </div>
            
          </div>
        </div>
 <footer>
		
</footer>
 
<style>
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}

</style>
</body>
</html>