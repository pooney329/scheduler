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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

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

.thumbnail:hover , .thumbnailbackground:hover {
	cursor: pointer;
}

input[type="file"] {
	display: none; 
}

.thumbnail i , .thumbnailbackground i{
	position: absolute;
	right: 0px;
	top: 0px;
}


/* 레디오 버튼 디자인 */




.checks {
  position: relative;
  margin: 10px; 
  font-size: 20px
}
.checks input[type="radio"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}
.checks input[type="radio"] + label {
  display: inline-block;
  position: relative;
  padding-left: 45px;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
label[for='ex_rd2']{
  margin-left:30px;
}
.checks input[type="radio"] + label:before {
  content: '';
  position: absolute;
  left: 0;
  top: -4px;
  width: 30px;
  height: 30px;
  
  text-align: center;
  background: #fafafa;
  border: 1px solid #cacece;
  border-radius: 100%;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="radio"] + label:active:before,
.checks input[type="radio"]:checked + label:active:before  {
  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}
.checks input[type="radio"]:checked + label:before {
  background: #E9ECEE;
  border-color: #adb8c0;
}
.checks input[type="radio"]:checked + label:after {
  content: '';
  position: absolute;
  top: 1px;
  left: 5px;
  width: 20px;
  height: 20px;
  background: #29b6f6;
  border-radius: 100%;
  box-shadow: inset 0px 0px 10px rgba(0,0,0,0.3);
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
				<form class="login100-form  form1 " action="${path}/team/register" method="post">
					
					<div class="wrap-input100 validate-input container"
						
						data-validate="teamName is required">
						<span>팀이름 </span>
						<input class="input100" type="text" name="teamName" placeholder="teamName"
							onkeyup="validate(this)" data-attr="teamName"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="container">
						<span style="display: block;">카테고리</span> 
						<select
							class="input100" name="category"
							style="display: inline-block; width: 30%;">
							<option>대학교</option>
							<option>대학교</option>
							<option>대학교</option>
						</select>
					</div> 
					<div class="container">
						<span style="display: block;">한줄 소개</span> <input
							class="input100" type="text" 
							style="display: inline-block; width: 100%;" data-attr="teamIntroduce"
							onkeyup="validate(this)" name="teamIntroduce">
						
					</div>
					
					<div class="container">
						<span style="display: block;">상세 설명</span>
						<textarea class="form-control" cols="40" name="teamContent"></textarea>
					</div>
					
					<div class="container">
						<span style="display: block;">해쉬태그</span> <input
							class="input100" type="text" 
							style="display: inline-block; width: 100%;" data-attr="teamHashTag"
							onkeyup="validate(this)" name="teamHashTag">
					</div>
					
					
					<div class="container">
						<span style="display: block;">대표 썸네일</span>
						<div style="height:300px; background-color:gray; position:relative;"class="thumbnail">
							<img src="${path}/resources/image/addicon.png" style="width:100%;height:100%;">
							<input type='file'>
						</div>  
					</div>
					
					<div class="container">
						<span style="display: block;">썸네일 배경</span>
						<div style="height:300px; background-color:gray; position:relative;" class="thumbnailbackground">
							<img src="${path}/resources/image/addicon.png" style="width:100%;height:100%;">
							<input type='file'>
						</div>  
					</div>
					<div class="container">
						<span>참여인원 </span>
						<input class="input100" type="number" name="participants" placeholder="Participants"
							onkeyup="validate(this)" data-attr="participants"> 
							
						</span>
					</div>
					<div class="container">
						<span>검색 노출 설정 </span>
						<div class="checks">
							<input type="radio" id="ex_rd" name="allowSearch" value='y'> 
								<label for="ex_rd">허용</label> 
							<input type="radio" id="ex_rd2" name="allowSearch" value='n'> 
								<label for="ex_rd2">거부</label>
						</div>
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
			scale : 1.1
		})
		
		
		$(".form1").on("submit", function(event){
			
			var $common_thumbnail = $(".common-thumbnail");
			
			$common_thumbnail.each(function(i,target){
					var $target = $(target);
					var $uuid = $("<input type='hidden' name = 'thumbnailList["+i+"].uuid' value='"+$target.data("uuid")+"'>");
					var $filename = $("<input type='hidden' name = 'thumbnailList["+i+"].filename' value='"+$target.data("filename")+"'>");
					var $path = $("<input type='hidden' name = 'thumbnailList["+i+"].path' value='"+$target.data("path")+"'>");
					var $common= $("<input type='hidden' name = 'thumbnailList["+i+"]."+$target.parent().attr("class")+"' value='Y'>");
					var $type;
					if($target.parent().attr("class")=="thumbnail"){
						$type = $("<input type='hidden' name = 'thumbnailList["+i+"].mainThumbnail' value='Y'>");	
					}else{
						$type = $("<input type='hidden' name = 'thumbnailList["+i+"].backThumbnail' value='Y'>");
					}
					
					$(".form1").append($uuid);
					$(".form1").append($filename);
					$(".form1").append($path);
					$(".form1").append($common);
					$(".form1").append($type);
			});
			
			return true;
		});
		
		
		//배경 , 대표 썸네일 img 태그에 click 이벤트 생성 
		$("img").each(function(i,e){
			
				
			var className = $(e).closest("div").attr("class");
			
			if(className == "thumbnail"){
				$(e).on("click",event,addThumbnail);	
			}
			else{
				$(e).on("click",event,addThumbnail);
			}
			
		});
		
		
		function deleteThumbnail(event,prefile){
			var target = event.target; 
			
			var file =  prefile ||  $(target).data("path") + '/s_' + $(target).data("uuid")  + '_' + $(target).data("filename");
			
			
			var data = {"filename" : file}; 
			$.ajax({
				url:"${path}/upload/deletethumbnail",
				async: false,
				type:"delete",
				contentType: "application/json; charset=utf-8;",
				data: JSON.stringify(data),
				dataType:"text",
				 success:function(result){
					 
					 if(prefile==null){
						 $("."+target.parentNode.className+" img").attr("src","${path}/resources/image/addicon.png")
						 $(target).remove();
					 }
					
					
				},
				error:function(re){
					alert("에러");
				}
				
				
			});
			
			
			
		}
		
		
		function addBackground(event){
			event.stopPropagation();
			var target  = event.target;
						
			/* $("input[name='thumbnail']").remove();
			var $thumbnail = $("<input type='file' name='thumbnail'>");
			$("form").append($thumbnail); */
			
			console.log(target.parentNode.className);
			$("input[name='thumbnailbackground']").click();
		}
		
		
		
		
		$("input[type='file']").on("change",thumbnailChange);
		
		function addThumbnail(event){
			
			event.stopPropagation();
			var target  = event.target;
						
			/* $("input[name='thumbnail']").remove();
			var $thumbnail = $("<input type='file' name='thumbnail'>");
			$("form").append($thumbnail); */
			
			var classname = target.parentNode.className;
			console.log(classname);
			$("."+classname+" input[type='file']").click();
			
			
			
		}
		
		
		
		function thumbnailChange(event){
			var target = event.target;
			var data = target.files;
			var formData = new FormData();
			formData.append("profileImg",data[0]);
			$.ajax({
				url:"${path}/upload/insertProfileImg",
				processData : false,
				contentType : false,
				type:"POST",
				data:formData,
				dataType:"json",
				success:function(result){
					console.log(result);
					var classname = target.parentNode.className
					var filename =$("."+classname+" i").data("filename");
					var path = $("."+classname+" i").data("path");
					var uuid = $("."+classname+" i").data("uuid");
					
					profileImgDisplay(result,target);
					if (filename != null) {
						var prefile = path + '/s_' + uuid + '_'+filename;
						deleteThumbnail(event,prefile);
					}
				},
				error : function(result) {
					console.log("실패");
				}

			})

		}
		/*
		function profileDrop(event) {
			event.preventDefault();
			event.stopPropagation();

			var data = event.originalEvent.dataTransfer.files;
			var formData = new FormData();

			formData.append("profileImg", data[0]);
			$.ajax({
				url : "${path}/upload/insertProfileImg",
				processData : false,
				contentType : false,
				type : "POST",
				data : formData,
				dataType : "json",
				success : function(result) {
					profileImgDisplay(result);
				},
				error : function(result) {
					console.log("실패");
				}

			})

		}
		*/
		function profileImgDisplay(result,target) {
			var check = RegExp(/\\/g);

			var path = result[0].path + '/s_' + result[0].uuid + '_'
					+ result[0].filename;

			if (check.test(path)) {
				path = encodeURIComponent(path.replace(/\\/g, "/"));

			}
			
			var classname = target.parentNode.className;
			
			
			$("."+classname+" img").attr("src",
					'${path}/upload/display?filename=' + path);

			$("."+classname+" i").remove();

			var $deleteicon = $("<i>");
			$deleteicon.addClass("material-icons common-thumbnail");
			$deleteicon.on("click", event, deleteThumbnail);
			$deleteicon.text("clear")
			$deleteicon.attr("data-path", result[0].path);
			$deleteicon.attr("data-uuid", result[0].uuid);
			$deleteicon.attr("data-filename", result[0].filename);

			$("."+classname).append($deleteicon);

			//$("<i class='material-icons' onclick='deleteThumbnail(event)'>")clear</i>

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
			} else if ($attr == "phone") {
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
	</script>
	<!--===============================================================================================-->
	<script src="${loginform}/js/main.js"></script>
	
	
	
	
	
</body>
</html>
