<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrap .teamitem {
	float: left;
	margin: 10px;
}



#wrap .teamitem{
	width: 250px;
	height: 400px;
}

#wrap {
	height:100vh;
}

.teamcontainer{
	height:100%;
	width:1200px;
	margin-left: auto; 
	margin-right: auto;


	


	
}

.teamtitle {
	width: 100%;
	padding: 0 5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.teamthumb img {
	position: absolute;
	width: 100%;
	height: 100%;
}

.backthumb {
	opacity: 0;
	transition: opacity 1s
}

.backthumb:hover {
	opacity: 1;
}

.teamexplain:hover #teamthumb {
	display: none;
}

.teamexplain .teamhashtag {
	display: none;
}

.teamexplain:hover .teamhashtag {
	display: block;
}

.teamexplain .teamtitle {
	color: #47a3da;
}

.teamexplain:hover {
	position: absolute;
	bottom: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	transition: 0.3s;
	opacity: 1;
}

.teamexplain:hover .teamnumber {
	font-size: 1.5em;
	transition: 0.3s;
	color: cadetblue;
}

.teamexplain:hover .teamtitle {
	padding: 10px;
	margin-top: 30px;
	height: 20%;
}

.teamexplain:hover .teamhashtag {
	color: #CECECE;
	font-size: 1.6em;
	height: 40%;
}

.teamexplain:hover button {
	display: inline-block;
	text-align: center;
}

.teamexplain {
	position: relative;
	background-color: #2A2B30;
	width: 100%;
	height: 20%;
	text-align: center;
}

.teamitem {
	height: 100%;
	position: relative;
	border-radius: 2%;
	overflow: hidden;
}

.teamthumb {
	background-color: aquamarine;
	width: 100%;
	height: 80%;
	position: relative;
}

.teamnumber {
	color: #fff;
	position: absolute;
	bottom: 0px;
	right: 0px;
}

.wrap {
	width: 100%;
	min-height: 100vh;
}

.teamexplain button {
	display: none;
}
</style>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/navbar.jsp" %>


	
<div id="wrap">
	<div class="teamcontainer">
		
	</div>
	
</div>	



</body>
<script>


var lastScrollTop = 0; 
var scrollCount  = 0; 


//즉시실행함수 사용하여 처음 16개의 항목을 보여준다 
(getList = function(){
	
	/* scrollcount를 기준으로 리스트를 가져온다  */
	var obj = {"scrollCount": scrollCount++};    
	var $teamcontainer = $(".teamcontainer");
	$.ajax({
		url : "${path}/team/teamlist",
		data : JSON.stringify(obj),	
		method : "post",
		contentType: "application/json",
		dataType : "json",
		success : function(teamlist) {
			
			for (var i = 0; i < teamlist.length; i++) {
				

				var $teamitem = $("<div>");
				$teamitem.attr("class", "teamitem");
				$teamcontainer.append($teamitem);

				var $teamthumb = $("<div>");
				$teamthumb.attr("class", "teamthumb")

				var $back_img = $("<img>");
				$back_img.attr("src",
						'${path}/resources/image/greyback.PNG');

				$teamthumb.append($back_img);

				var $main_img = $("<img>");
				$main_img.attr("src",
						'${path}/resources/image/default_img.jpg');
				$main_img.attr("class", "backthumb");
				$teamthumb.append($main_img);

				$teamitem.append($teamthumb);

				var $teamexplain = $("<div class='teamexplain'>");

				var $h3 = $("<h3>");
				$h3.text(teamlist[i].teamName);
				$h3.attr("class", "teamtitle");

				var $p = $("<p>");
				$p.text(teamlist[i].teamHashTag);
				$p.attr("class", "teamhashtag");

				var $span = $("<span>");
				$span.text(teamlist[i].num + "/"
						+ teamlist[i].participants);
				$span.attr("class", "teamnumber");

				var $button = $("<button>");

				$button.text("탐방하기");

				$button.attr("class", "btn btn-primary");
				$button.data("tbno", teamlist[i].tbno);
				$button.click(function(){
					var tbno = $(this).data("tbno");
					location.href="${path}/team/teamdetail?tbno="+ tbno
				});
				
				
				

				$teamexplain.append($h3);
				$teamexplain.append($p);
				$teamexplain.append($span);
				$teamexplain.append($button);

				$teamitem.append($teamexplain);

				if (teamlist[i].thumbnailList != null) {

					for (var j = 0; j < teamlist[i].thumbnailList.length; j++) {

						var path = teamlist[i].thumbnailList[j].path
								+ '/s_'
								+ teamlist[i].thumbnailList[j].uuid
								+ '_'
								+ teamlist[i].thumbnailList[j].filename;
						path = encodeURIComponent(path);

						
						if (teamlist[i].thumbnailList[j].mainThumbnail == "Y") {

							$back_img.attr("src",
									'${path}/upload/display?filename='
											+ path);

						} else if (teamlist[i].thumbnailList[j].backThumbnail == "Y") {

							$main_img.attr("src",
									'${path}/upload/display?filename='
											+ path);

						}
					}
				}
				$teamcontainer.append($teamitem);

			}

		},
		error : function(result) {
			console.log("에러발생");
		}
		
		
	})
	
	
}

)();

/* 스크롤인벤트  */
$(window).scroll(function(){

	var currentScrollTop = $(window).scrollTop();
	
	
	
	/* 아래로 스크롤  시 */
	if(currentScrollTop - lastScrollTop > 0){
		
		
		/* 스크롤이 끝에 도달 했을 경우  */
		if(Math.ceil($(window).scrollTop()) >= ($(document).height() - $(window).height())){
			getList();
		
		}
		else{
			
		}
	}
	
})




</script>


</html>