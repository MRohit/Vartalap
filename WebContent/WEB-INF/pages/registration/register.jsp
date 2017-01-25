<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:directive.include file="../navigation/libs.jsp" />

<title>Vartalap</title>
</head>
<body>
<header>
<jsp:directive.include file="../navigation/nav.jsp" />
</header>
	 <div class="container">
	 	<jsp:directive.include file="../navigation/subHeader.jsp" />
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>Sign up</h2>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal"action="submitForm">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Full name</label>
                            <div class="col-lg-3">
                                <input type="text" class="form-control" name="firstName" placeholder="First name" />
                            </div>
                            <div class="col-lg-3">
                                <input type="text" class="form-control" name="middleName" placeholder="Middle name" />
                            </div>
                            <div class="col-lg-3">
                                <input type="text" class="form-control" name="lastName" placeholder="Last name" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Username</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="userName" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Email address</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="email" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Password</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="password" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Retype password</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="confirmPassword" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Gender</label>
                            <div class="col-lg-5">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" value="male" /> Male
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" value="female" /> Female
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" value="other" /> Other
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Birthday</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="birthday" /> (YYYY/MM/DD)
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Skills</label>
                            <div class="col-lg-5">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="skills" value="technical" /> Technical
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="skills" value="hr" /> HR
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="skills" value="admin" /> Administration
                                    </label>
                                </div>
                                
                            </div>
                        </div>

                        

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="captchaOperation"></label>
                            <div class="col-lg-2">
                                <input type="text" class="form-control" name="captcha" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button id="xxx" type="submit" class="btn btn-primary" name="signup" value="Register">Register</button>
                                
                                <button type="button" class="btn btn-info" id="resetBtn">Reset form</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>
   <!--  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("#xxx").click(function(e){
		alert("Registration Successful...");
	});
	
	
	
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    $('#defaultForm').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            firstName: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                        message: 'The first name is required and cannot be empty'
                    }
                }
            },
            middlelName: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                        message: 'The last name is required and cannot be empty'
                    }
                }
            },
            lastName: {
                group: '.col-lg-4',
                validators: {
                    notEmpty: {
                        message: 'The last name is required and cannot be empty'
                    }
                }
            },
            userName: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    },
                    remote: {
                        type: 'POST',
                        url: 'remote',
                        message: 'The username is not available'
                    },
                    different: {
                        field: 'password,confirmPassword',
                        message: 'The username and password cannot be the same as each other'
                    }
                }
            },
            email: {
                validators: {
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    },
                    notEmpty: {
                        message: 'The email is required and cannot be empty'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'username',
                        message: 'The password cannot be the same as username'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and cannot be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'username',
                        message: 'The password cannot be the same as username'
                    }
                }
            },
            birthday: {
                validators: {
                    date: {
                        format: 'YYYY/MM/DD',
                        message: 'The birth date is not valid'
                    }
                }
            },
            gender: {
                validators: {
                    notEmpty: {
                        message: 'The gender is required'
                    }
                }
            },
            skills: {
                validators: {
                    notEmpty: {
                    	
                        message: 'Please specify at least one skill'
                    }
                    
                }
            },
            captcha: {
                validators: {
                    callback: {
                        message: 'Wrong answer',
                        callback: function(value, validator) {
                            var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                            return value == sum;
                        }
                    }
                }
            }
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#defaultForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#defaultForm').data('bootstrapValidator').resetForm(true);
    });
});
</script>
	
<footer>
<jsp:directive.include file="../navigation/footer.jsp" />
</footer>
</body>
</html>