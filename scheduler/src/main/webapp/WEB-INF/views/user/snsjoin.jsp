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
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="loginform" value="${path}/resources/login" />


<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${loginform}/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${loginform}/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${loginform}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${loginform}/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${loginform}/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${loginform}/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${loginform}/css/util.css">
<link rel="stylesheet" type="text/css" href="${loginform}/css/main.css">
<!--===============================================================================================-->

<script>
	
</script>

<style>
#loginbtn {
	background-color: blueviolet;
}

#googlebtn {
	background-color: crimson;
}

#normaljoinbtn {
	background-color: #4158d0;
}

.form-container {
	position: relative;
}

.form1 {
	margin-left: auto;
	margin-right: auto;
	width: 100%;
}
</style>

</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	<div class="limiter">
		<div class="container-login100">

			<div class="wrap-login100" style="padding-top: 100px;">
				<div class="container">
					<h2 style="text-align: center; padding-bottom: 50px;">일반회원 가입</h2>
				</div>


				<!-- validate-form -->
				<form class="login100-form  form1 " action="${path}/user/joinaction" method="post">
				<!-- $(".profile_img").on("dragover",profileDragover).on("drop",profileDrop); -->
					<div class="profile_img" style="text-align:center">
						<img src="${path}/resources/image/default_img.jpg" width="300px"
							height="300px" style="border-radius:50%;">
					</div>
					<span>이름</span>
					<div class="wrap-input100 validate-input"
						data-validate="name is required">
						<input class="input100" type="text" name="name" placeholder="Name"
							onkeyup="validate(this)" data-attr="name"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div>
						<span style="display: block;">휴대폰 번호</span> <select
							class="input100" name="phone1"
							style="display: inline-block; width: 30%;">
							<option>010</option>
							<option>011</option>
							<option>016</option>
						</select> <input class="input100 pwd" type="text" name="phone2"
							placeholder="phone" style="display: inline-block; width: 30%;"
							data-attr="phone" onkeyup="validate(this)" maxlength="4">
						<input class="input100 pwd" type="text" name="phone3"
							placeholder="phone" style="display: inline-block; width: 30%;"
							data-attr="phone" onkeyup="validate(this)" maxlength="4">
					</div>
					<div>
						<span style="display: block;">이메일</span> <input
							class="input100 pwd" type="text" 
							style="display: inline-block; width: 100%;" data-attr="email"
							onkeyup="validate(this)" value="${sessionScope.snsemail}" readonly>
						<button type="submit" class="btn btn-primary" id="submit">가입하기</button>
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
	<script>
		$('.js-tilt').tilt({
			scale : 1.1
		})
		
		
		var check_name = false;
		var check_phone2 = false;
		var check_phone3 = false;
		
		var $form = $(".form1");
	

		$form.on("submit", function() {
			if (check_name == false) {
				$("input[name=name]").focus();
				console.log("aaa");
				return false;
			} else if (check_phone2 == false) {
				console.log("폰2")
				$("input[name=phone2]").focus();
				return false;
			} else if (check_phone3 == false) {
				console.log("폰3")
				$("input[name=phone3]").focus();
				return false;
			}

			else {
				//form태그에 snsemail 추가하기
				addSnsEmail();
				return true;

			}

		})
		
		
		//sns 회원등록에 필요한 sns이메일 과 이메일 추가를 위한 input태그를 추가
		function addSnsEmail(){
			var snsemail = "${sessionScope.snsemail}";
			var  email1 = snsemail.substring(0,snsemail.lastIndexOf("@"));
			var  email2 = snsemail.substring(snsemail.lastIndexOf("@")+1);
			var snscheck = RegExp(/@naver.com/);
			var snsId = snscheck.test(snsemail)? "naverid" : "googleid"; 
			var input_snsEmail = $("<input type='hidden' name='"+snsId+"' value='"+snsemail+"'>")
			var input_email1 = $("<input type='hidden' name ='email1' value='"+email1+"'>");
			var input_email2 = $("<input type='hidden' name ='email2' value='"+email2+"'>");
			var input_emailauthentication = $("<input type='hidden' name ='emailauthentication' value='Y'>");
			
			$form.append(input_snsEmail);
			$form.append(input_email1);
			$form.append(input_email2);
			$form.append(input_emailauthentication);
		}

		

		//정규식검사
		function validate(target) {

			var $target = $(target);
			var $attr = $target.data("attr");
			if ($attr == "name") {
				var userName = RegExp(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+/);
				if (userName.test($target.val())) {
					$target.val($target.val().replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/, ''));
					check_name = true;

				} else {
					$target.val($target.val().replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/, ''));
				}
			}else if ($attr == "phone") {
				var userPhone = RegExp(/^[\d]{4,}$/);
				if (userPhone.test($target.val())) {

					if ($target.attr("name") == "phone2") {
						check_phone2 = true;

					}
					if ($target.attr("name") == "phone3") {
						check_phone3 = true;
					}

				} else {
					$target.val($target.val().replace(/[^\d]/g, ''));
					if ($target.attr("name") == "phone2") {
						check_phone2 = false;
					}
					if ($target.attr("name") == "phone3") {
						check_phone3 = false;
					}
				}
			}
			

		}
		
		
		
		
		
		function profileDragover(event){
			event.preventDefault();
			event.stopPropagation();
			console.log("dragover");
		}
		
		function profileDrop(event){
			event.preventDefault();
			event.stopPropagation();
			
			console.log(event.originalEvent.dataTransfer.files[0])
			var data = event.originalEvent.dataTransfer.files;
			var formData = new FormData();
			console.log(data);
			formData.append("profileImg",data[0]);
			$.ajax({
				url:"${path}/upload/insertProfileImg",
				processData : false,
				contentType : false,
				type:"POST",
				data:formData,
				dataType:"json",
				success:function(result){
					profileImgDisplay(result);
				},
				error:function(result){
					console.log("실패");
				}
				
			})
			
			
			
		}
		
		$(".profile_img").on("dragover",event,profileDragover).on("drop",event,profileDrop);
		
		
		function profileImgDisplay(result){
			 var check = RegExp(/\\/g);
			 
			 var path= result[0].path+'/s_'+result[0].uuid+'_'+result[0].filename;
			 console.log(path);
			 if(check.test(path)){
			 	path = encodeURIComponent(path.replace(/\\/g,"/"));
				 
			 }
			 console.log(path);
				 
			$(".profile_img img").attr("src",'${path}/upload/display?filename='+path);
			
		}
	</script>
	<!--===============================================================================================-->
	<script src="${loginform}/js/main.js"></script>
	
	
</body>
</html>
