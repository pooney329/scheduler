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

<script>





</script>

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
    .form-container{
    	position:relative;
    }
    .form1{
    	
	    margin-left:auto;
	    margin-right:auto;
	    width:100%;	
    
    }
    
</style>

</head>
<body>
<%@ include file="../include/navbar.jsp" %>
<div class="limiter">
		<div class="container-login100">
			 
			<div class="wrap-login100" style="padding-top:100px;">
				<div class="container">
					<h2 style="text-align:center; padding-bottom:50px;">일반회원 가입</h2>
				</div>	
				
				
		<!-- validate-form -->
				<form class="login100-form  form1 " action="${path}/user/joinaction" method="post">
				
					<div class="profile_img" style="text-align:center">
						<img src="${path}/resources/image/default_img.jpg" width="300px"
							height="300px" style="border-radius:50%;">
					</div>
				
					<span>이름</span>
					<div class="wrap-input100 validate-input" data-validate = "name is required">
						<input class="input100" type="text" name="name" placeholder="Name" onkeyup="validate(this)" data-attr="name">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div>
						<span>아이디</span>				
						<div class="wrap-input100 validate-input" data-validate = "Valid id is required: ex@abc.xyz">
							<input class="input100" type="text" name="uid" placeholder="id" style="display:inline-block; width:80%;" onkeyup="validate(this)" maxlength="15" data-attr="uid">
							<span class="focus-input100"></span>
								<span class="symbol-input100">
									<i class="fa fa-envelope" aria-hidden="true"></i>
							</span>
							<button type="button" class="btn btn-primary" onclick="checkid()">중복확인</button>
						</div>
						<span id="checkidmsg"></span>
					</div>
					<span>비밀번호</span>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100 pwd" type="password" name="pwd" placeholder="Password" onkeyup="validate(this)" data-attr="pwd">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<span>비밀번호 확인</span>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100 pwd" type="password" placeholder="Password" onkeyup="validate(this)" data-attr="pwd">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
						<span id="checkpwdmsg"></span>
					</div>
					<div>
						<span style="display:block;">휴대폰 번호</span>
						<select class="input100"  name="phone1" style="display:inline-block; width:30%;">
							<option>010</option>
							<option>011</option>
							<option>016</option>
						</select>
						<input class="input100 pwd" type="text"  name="phone2" placeholder="phone" style="display:inline-block; width:30%;" data-attr="phone" onkeyup="validate(this)" maxlength="4">
						<input class="input100 pwd" type="text"  name="phone3" placeholder="phone" style="display:inline-block; width:30%;"data-attr="phone" onkeyup="validate(this)" maxlength="4">
					</div>
					<div>
						<span style="display:block;">이메일</span>
						<input class="input100 pwd" type="text"  name ="email1"style="display:inline-block; width:30%;" data-attr="email" onkeyup="validate(this)">
						@
						<input class="input100 pwd" type="text"  name="email2" style="display:inline-block; width:30%;" data-attr="email" onkeyup="validate(this)">
						<select class="input100" style="display:inline-block; width:30%;" onchange="checkemail(this)">
							<option value>직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
						</select>
						<button id="emailauth">이메일 인증</button>
					</div>
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
	scale: 1.1
})
var check_id =false; 
var check_pwd =false;
var check_name =false;
var check_email1 =false;
var check_email2 =false;
var check_phone2 =false;
var check_phone3 =false;

function checkid(){
	var id = $("input[name=uid]").val();
	
	$.ajax({
		url:"${path}/user/checkid",
		type:"POST",
		dataType:"json",
		contentType: "application/json; charset=utf-8;",
		data : JSON.stringify({'uid': id}),
		success: function(body,result){
			var $checkidmsg = $("#checkidmsg");
			$checkidmsg.text("");
			if(body!=true){
				check_id=true;
			}
			else{
				check_id =false; 
				$checkidmsg.text("중복된 아이디입니다.");
				$checkidmsg.css("color", "red");
			}
		}
	});
	
};

function checkpwd(){
	
	var pwds = $(".pwd");
	var pwd1 = pwds[0];
	var pwd2 = pwds[1];
	var $checkpwdmsg = $("#checkpwdmsg");
	$checkpwdmsg.text("");
	if(pwd1.value != pwd2.value){
		$checkpwdmsg.text("비밀번호가 일치 하지 않습니다.");
		$checkpwdmsg.css("color", "red");
		check_pwd = false;
		
	}
	else{
		$checkpwdmsg.text("");
		check_pwd = true;
	}
};

$(".form1").on("submit", function(){
	
	
	/* var input = $(".input100");
	for(var i=0; i<input.length; i++){
		if($(input[i]).val()==""){
			$(input[i]).focus();
			return false;
		
		}
	} */
	
	
	
	/* $(".input100").each(function(index, item){ 
		if($(item).val()==""){
			$(item).focus();
			return false;
		}
	}); */
	
	
	console.log("이름", check_name);
	console.log("비번", check_pwd);
	console.log("이메일1", check_email1);
	console.log("이메일2", check_email2);
	console.log("폰2", check_phone2);
	console.log("폰3", check_phone3);
 
	if(check_name == false){
		$("input[name=name]").focus();
		console.log("aaa");
		return false;
	}
	else if(check_id == false){
		console.log("아이디 폴스")
		$("input[name=uid]").focus();
		return false;
	}
	
	
	else if(check_pwd == false){
		$("input[name=pwd]").focus();
		return false;	
	}
	else if(check_phone2 == false){
		console.log("폰2")
		$("input[name=phone2]").focus();
		return false;	
	}
	else if(check_phone3 == false){
		console.log("폰3")
		$("input[name=phone3]").focus();
		return false;	
	}
	
	
	else if(check_email1 == false){
		console.log("이메일1")
		$("input[name=email1]").focus();
		return false;	
	}
	else if(check_email2 == false){
		console.log("이메이2")
		$("input[name=email2]").focus();
		return false;	
	}
	
	else{
		
		
		addProfileImg();
		return true;
		
		
	}
	
	
	
	
	
	
	
})


$("#emailauth").on("click", function(e){
		e.preventDefault();
		
})

function checkemail(target){
	var $target = $(target);
	var $email2 = $("input[name=email2]");
	if($target.val() != ''){
		$email2.val($target.val());
		validate($email2);
	}
	else{
		$email2.val("");
	}
};


//정규식검사
function validate(target){
	
	var $target = $(target);
	var $attr = $target.data("attr");
	if($attr=="name"){
		var userName = RegExp(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+/);
	    if(userName.test($target.val())){
	    	$target.val($target.val().replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/,''));
	    	check_name= true;
	    	
	  	}else{
	  		$target.val($target.val().replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/,''));
	  	}	
	}
	else if($attr=="uid"){
		var userId = RegExp(/[\w]{8,15}/);
	    if(userId.test($target.val())){
	    	$target.val($target.val().replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/,''));
	  	}else{
	  		$target.val($target.val().replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/,''));
	  		check_id = false;
	  		
	  	}
	    
	}
	
	else if($attr=="pwd"){
		
		var userPwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/);
		var $checkpwdmsg = $("#checkpwdmsg");
  		$checkpwdmsg.text("");
	    if(userPwd.test($target.val())){
	    	
	    	checkpwd();
	  	}else{
	  		$checkpwdmsg.text("6글자 이상,특수문자,영문,숫자 를 포함하여 구성해주세요");
	  		$checkpwdmsg.css("color","red");
	  		
	  		
	  		
	  	}
	
	
  
	}
	else if($attr=="phone"){
		var userPhone = RegExp(/^[\d]{4,}$/);
		if(userPhone.test($target.val())){
			
			if($target.attr("name")=="phone2"){
				check_phone2 =true;
			
			}
			if($target.attr("name")=="phone3"){
				check_phone3 =true;
			}
	    	
	  	}else{
	  		$target.val($target.val().replace(/[^\d]/g,''));
	  		if($target.attr("name")=="phone2"){
				check_phone2 =false;
			}
			if($target.attr("name")=="phone3"){
				check_phone3 =false;
			}
	  		
	  		
	  	}
	
	
	}
	
	else if($attr=="email"){
		var userEmail1= RegExp(/^[\w]+$/);
		var userEmail2 = RegExp(/^[a-zA-Z]+\.[a-zA-Z]+$/);
		if($target.attr("name") == "email1"){
			if(userEmail1.test($target.val())){
				check_email1 = true;
				
			}
			else{
				check_email1 = false;
			}	
			
			
		}
		else{
			if(userEmail2.test($target.val())){
				check_email2 = true;
				
			}
			else{
				check_email2 = false;
			}
			
		}
		
		
		
		/* if(userPhone.test($target.val())){
			
			if($target.attr("name")=="phone2"){
				var check_phone2 =true;
			}
			if($target.attr("name")=="phone3"){
				var check_phone3 =true;
			}
	    	
	  	}else{
	  		$target.val($target.val().replace(/[^\d]/g,''));
	  		if($target.attr("name")=="phone2"){
				var check_phone2 =false;
			}
			if($target.attr("name")=="phone3"){
				var check_phone3 =false;
			}
	  		
	  		
	  	} */
	
	
	}

	
}
/* 프로필 사진 등록 */
 
//컨트로럴에 보낼 이미지경로를 hidden으로 form 에 붙여서 컨트롤러에 보내는 작업 수행 
function addProfileImg(){
	var path = $(".profile_img img").data("path");
	var uuid = $(".profile_img img").data("uuid");
	var filename = $(".profile_img img").data("filename");
	$("<input type='hidden' name='ProFileImg.path' value='"+path+"'>");
	$("<input type='hidden' name='ProFileImg.uuid' value='"+uuid+"'>");
	$("<input type='hidden' name='ProFileImg.filename' value='"+filename+"'>");
	
	
	$("form").append($("<input type='hidden' name='profileimg.path' value='"+path+"'>"));
	$("form").append($("<input type='hidden' name='profileimg.uuid' value='"+uuid+"'>"));
	$("form").append($("<input type='hidden' name='profileimg.filename' value='"+filename+"'>"));
	
	
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
	$(".profile_img img").data("path", result[0].path);
	$(".profile_img img").data("uuid", result[0].uuid);
	$(".profile_img img").data("filename", result[0].filename);
	
	
	
}



	</script>
<!--===============================================================================================-->
	<script src="${loginform}/js/main.js"></script>

</body>
</html>