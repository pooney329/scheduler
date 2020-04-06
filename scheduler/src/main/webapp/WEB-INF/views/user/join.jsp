<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <%@ include file="../include/header.jsp" %> --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="loginform" value="${path}/resources/login" />


<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${loginform}/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${loginform}/vendor/bootstrap/css/bootstrap.min.css">
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
    #normaljoinbtn{
    	background-color:#4158d0;
    }
    
</style>

</head>
<body>
<%@ include file="../include/navbar.jsp" %>
<div class="limiter">
		<div class="container-login100">
			 
			<div class="wrap-login100" style="padding-top:100px">
				<div class="container">
					<h2 style="text-align:center; padding-bottom:50px;">회원가입</h2>
				</div>	
				
				<!--
				<div class="login100-pic" style="text-align:center; vertical-align:middle; position:relative">
					<div style="position: absolute;top: 30%; left: 50%;  transform: translate(-50%, -50%) ;width:80%;">
						<h2 style="text-align:left; margin-bottom:10px;" >일반회원</h3>
						<p style="text-align:left; margin-bottom:10px;" >만 14이상 회원가입</p>
						<button type="button" class="login100-form-btn m-1" id="nomaljoinbtn"style="width:100%">일반 회원가입</button>
					</div>
					
				</div>
				  -->
				
				<div class="container-login100-form-btn" style="width:50%">
				<h2 style="text-align:left; margin-bottom:10px; width:100%;" >일반회원</h3>
						<p style="text-align:left; margin-bottom:10px; width:100%" >만 14이상 회원가입</p>
						<button type="button" class="login100-form-btn m-1" id="normaljoinbtn" onclick="location.href='${path}/user/normaljoin'">일반 회원가입</button>
					
				
				</div>

				<form class="login100-form validate-form" action="#" method="post">
					<div class="container-login100-form-btn">
						<h2 style="text-align:left; margin-bottom:10px; width:100%;" >sns계정 회원</h3>	
						<p style="text-align:left; margin-bottom:10px; width:100%" >SNS아이디를 이용해서 회원으로 가입</p>
						<button type ="button" class="login100-form-btn m-1" id="googlebtn" onclick="location.href='${google}'">
							Google+
						</button>
                        <button type ="button" class="login100-form-btn m-1" id="naverbtn" onclick="location.href='${naver}'">
							Naver
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="${loginform}/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${loginform}/vendor/bootstrap/js/popper.js"></script>
	<script src="${loginform}/vendor/bootstrap/js/bootstrap.min.js"></script>
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