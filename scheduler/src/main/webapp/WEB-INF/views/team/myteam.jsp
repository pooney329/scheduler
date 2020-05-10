<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<style>
.cd {
	margin: 10px auto;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 70%;
	height: 100px;
}

.cd:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.team-thumbnail {
	background-color: #4d6c8b;
	height: 100%;
	padding-top: 15px;
	padding-bottom: 15px;
}

.team-thumbnail img{
	height: 100%; 
	width: 100%;
}

.team-content > div {
	height: 100%
}

.team-name {
	height: 30%
}

.team-intro {
	height: 70%
}




</style>


</head>
<%@ include file="../include/navbar.jsp" %>
<body>

<div class="container">
	<div class="list-group  list-group-horizontal" id="myList" role="tablist">
	  <a class="list-group-item list-group-item-action active" data-toggle="list" href="#" role="tab" id="waitingteam">참여 대기중인 팀</a>
	  <a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab" id="participatingteam">참여중인 팀</a>
	  <a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab" id="establishedteam">개설한 팀</a>
	  <a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab" id="selectedteam">내가 찜한 팀</a>
	</div>
	<div class="team-layout">
			<div class="team-item container">
			<c:forEach items="${list}" var="team">
				<div class="row cd" data-tbno="${team.tbno}">
					<div class="col-md-3 team-thumbnail">
						<img src="${path}/upload/display?filename=${team.thumbnailList[0].path}/s_${team.thumbnailList[0].uuid}_${team.thumbnailList[0].filename}">
					</div>
					<div class="col-md-9 team-content">
						<div class="row">
							<div class="col-md-12 team-name">
								${team.teamName}
							</div>
							<div class="col-md-12 team-intro">
								${team.teamIntroduce}
							</div>

						</div>

					</div>

				</div>
			</c:forEach>


			</div>
		</div>
</div>

<script>

//각 참여 대기중인 팀리스트 클릭 시 팀 디테일 페이지로 이동.  
$(".cd").click(function(){
	var tbno = $(this).data("tbno");
	location.href="${path}/team/teamdetail?tbno="+tbno;
});


//tap list 항목 클릭 시 해당 팀리스트 가져오기 ex)참여 대기중 , 개설한 팀, 찜한 팀.. .
$(".list-group a").on("click", function(e){
	e.preventDefault();
	var teamlistgroup =  e.target.id
	
	$.ajax({
		url: "${path}/team/myteam/"+teamlistgroup,
		method : "GET",
		success:function(list){
			showlist(list);
			
			
		},
		error:function(result){
			
		}
		
		
	});
	
	
});

function showlist(list){
	$(".team-item").html("");
	list.forEach(function(e,i){
		
		var cd_div = $("<div>"); 
		cd_div.addClass("row");
		cd_div.addClass("cd");
		cd_div.data("tbno" , e.tbno);
		
		
		
		var thumbnail_div = $("<div>");
		thumbnail_div.addClass("col-md-3");
		thumbnail_div.addClass("team-thumbnail");
		
		
		
		var thumb_img = $("<img>")
		
		thumb_img.attr("src", "${path}/upload/display?filename="+e.thumbnailList[0].path+"/s_"+e.thumbnailList[0].uuid+"_"+e.thumbnailList[0].filename);
		
		
		
		var content_div = $("<div>");
		content_div.addClass("team-content");
		content_div.addClass("col-md-9");
		
		var row_div = $("<div>");
		
		
		
		var name_div = $("<div>");
		name_div.addClass("team-name");
		name_div.addClass("col-md-12");
		name_div.text(e.teamName)
		
		var intro_div = $("<div>");
		intro_div.addClass("team-intro");
		intro_div.addClass("col-md-12");
		intro_div.text(e.teamIntroduce);
		
		
		thumbnail_div.append(thumb_img);
		
		cd_div.append(thumbnail_div);
		
		content_div.append(row_div);
		
		row_div.append(name_div);
		row_div.append(intro_div);
		
		
		cd_div.append(content_div);
		
		
		$(".team-item").append(cd_div);
		
		
		
		
	})
	
	//어떤 tab list를  선택했는지 값을 불러와서 참여대기중인 팀인경우는 클릭 시 상세정보 페이지로 이동 나머지는 스케즐을 조정할 수 있는 페이지로 이동 
	var tablist = $("#myList .active").attr("id");
	console.log(tablist);
	if(tablist == "waitingteam"){
		$(".cd").click(function(){
			var tbno = $(this).data("tbno");
			location.href="${path}/team/teamdetail?tbno="+tbno;
		});	
	}
	
	else if(tablist == "establishedteam" || tablist == "participatingteam"){
		console.log("aaa");
		
		
	}
	
	
	
	
}


</script>
	
</body>
</html>