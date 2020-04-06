<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@  include file ="../include/header.jsp" %>

  
</head>
<body>

${authemail}

<form id="form">
	<input type="text" name="email1">
	<input type="text" name="email2">
	<select>
		<option value="naver">naver.com</option>
	</select>
	<div>	
		<span id="checkemail"></span>
	</div>
	<button class="submit">클릭</button>
</form>







<script>


var $email1check = false;
var $email2check = false;
var $email1 = $("input[name='email1']");
var $email2 = $("input[name='email2']");

$("input[name='email2']").on("focusout" ,function(){
	
	
	
	
	console.log("실행");
	
	
	
	
	var userEmail1= RegExp(/^[\w]+$/);
	var userEmail2 = RegExp(/^[a-zA-Z]+\.[a-zA-Z]+$/);
	if(userEmail1.test($email1.val())){
		$email1check=true;
	}else{
		$email1check=false;
	}
	if(userEmail2.test($email2.val())){
		$email2check=true;
	}
		
	else{
		$email2check=false;
	}
	
	if($email1check ==false || $email2check == false){
		return false;
	}else{
		/* ${temporaryuser.uid}  */
		$.ajax({
			url:"${path}/user/emailAuthDuplicate",
			type:"get",
			dataType:"text",
			contentType: "application/json; charset=utf-8;",
			data :  $("#form").serialize(),
			success: function(result){
				
				
				if(result =="true"){
					$("#checkemail").html("중복된 이메일입니다.");
					$("#checkemail").css("color", "red");
				}
				else{
					$("#checkemail").html("");
				}
		
			}
		})
		
	}
	
})



<c:if test="${temporaryuser == null}">

/* 		alert("잘못된 접근입니다.");
		location.href="${path}"; */
</c:if>

$(".submit").on("click", function(e){
	e.preventDefault();
	console.log("${temporaryuser.uid}");
	var $form  = $("#form");
	$form.attr("action","${path}/user/emailAuthIdUpdate");
	$form.attr("method","post");
	$form.append("<input type='hidden' name ='uid' value='${temporaryuser.uid}'>	");
	
	$("#form").submit();
	
});

</script>
</body>
</html>

