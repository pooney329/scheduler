<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<c:set var="loginform" value="${path}/resources/login" />


<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${loginform}/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<%-- <link rel="stylesheet" type="text/css" href="${loginform}/vendor/bootstrap/css/bootstrap.min.css"> --%>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${loginform}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${loginform}/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${loginform}/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${loginform}/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${loginform}/css/util.css">
	<link rel="stylesheet" type="text/css" href="${loginform}/css/main.css">
<!--===============================================================================================-->
    <style>
        #loginbtn{
            background-color: blueviolet;
        }
        #googlebtn{
            background-color: crimson;
        }
        
    </style>


</head>
<body>
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="${loginform}/images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form">
					<span class="login100-form-title">
						Member Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn m-1" id="loginbtn">
							Login
						</button>
                        <button class="login100-form-btn m-1" id="googlebtn">
							Google+
						</button>
                        <button class="login100-form-btn m-1" id="naverbtn">
							Naver
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="#">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

<!--===============================================================================================-->	
	<%-- <script src="${loginform}/vendor/jquery/jquery-3.2.1.min.js"></script> --%>
<!--===============================================================================================-->
	<%-- <script src="${loginform}/vendor/bootstrap/js/popper.js"></script> --%>
	<%-- <script src="${loginform}/vendor/bootstrap/js/bootstrap.min.js"></script> --%>
<!--===============================================================================================-->
	<script src="${loginform}/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${loginform}/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="${loginform}/js/main.js"></script>

</body>
</html>