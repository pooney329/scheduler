<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>

	body{
	background-color:#29b6f6;
	}
	.backthumb img{
		width:100%;
		height:100%;
	}
	
	.mainthumb {
		position: absolute;
		top:300px;
		
		
		text-align:center;
		height:300px;
		width:100%;	
	}
	.mainthumb img{
		width:300px;
		height:100%;
	}
	.thumbnail{
		position:relative;
		border-bottom:3px solid grey;
	
	}
	
	.teamtitle{
		position:relative;
		top:100px;
		text-align:center;
		font-size:1.7em;
	}
	.master{
		
	}
	.master img{
		border-radius:50%;
		width:20%;
		height:20%;
	}
	.master span{
		margin-left:5%;
		font-size: 2em;
			
	}
	.master div{
		margin-top:30px;
	}
	.master{
		height:300px;
	}
	
	.basicinfo img  {
		width:20%;
		height: 100%;
	
	}
	.master img{
		width:20%;
		
	}
	
	.basicinfo h2 , .teamintroduce h2 , .master h2{
		font-size:3em;
		
	}
	.basicinfo > div{
	
		height:150px;
		
		
	}
	.basicinfo > div div  , .master > div div{
		display:inline-block; 
		height:100%; 
		width:79%;
		padding-left:70px;
	}
	
	.basicinfo > div div>span:first-child , .master > div div>span:first-child{
		display:block;
		
	}
	.basicinfo-tile	{
		color:#d0d0d0;
		font-size:2em;
	}
	
	.basicinfo > div span:last-child	{

		font-size:1.3em;
	}
	
	.teamdate div span:last-child{
		display:inline-block;
	}
	.basicinfo > div span:nth-child(2){
		display:inline-block; 
		font-weight:bold;
		font-size:1.4em;	
	}
	
	.basicinfo{
		height:500px;
		
	
	}
	
	.basicinfo h2 , .teamintroduce h2{
		margin-bottom:30px;
		
		border-top:1px solid grey;
		
		
	}
	
	.teamintroduce p{
		font-size:1.4em;	
	}
	.teamintroduce p{
		padding:20px;
	}
</style>


<%@ include file ="../include/header.jsp" %>





</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<div style="height:100%; width:100%;   background: linear-gradient(to right, #b24592, #f15f79);">
	<div class="" style="width:700px; margin-right:auto; margin-left:auto; background-color:white; ">
		<div class="thumbnail" style="width:100%;">
			<div class="backthumb" style="height:400px;">
				<c:if test="${team.thumbnailList[0].mainThumbnail =='Y'}">
						<img src="${path}/upload/display?filename=${team.thumbnailList[0].path}/s_${team.thumbnailList[0].uuid}_${team.thumbnailList[0].filename}"/>		
				</c:if>
				
			</div>
			<div class="mainthumb">
				<c:if test="${team.thumbnailList[1].backThumbnail =='Y'}">
						<img src="${path}/upload/display?filename=${team.thumbnailList[1].path}/s_${team.thumbnailList[1].uuid}_${team.thumbnailList[1].filename}"/>		
				</c:if>
			
			</div>
			<div class="team-intro" style="height:350px; padding-top:100px;">
				<div class="teamtitle">
					<p>${team.teamName}</p>
				</div>
			</div>
			 
		</div>
		
		<div class="master">
		<h2>팀 마스터</h2>
			<div>
				 <img src="${path}/upload/display?filename=${team.proFileImg.path}/s_${team.proFileImg.uuid}_${team.proFileImg.filename}"/>
				 <div>
				  	<span class="basicinfo-tile">마스터 이름</span>
				 	<span>${team.masterName}</span>
				 </div>
				  
				 
			 </div>		
		</div>
		
		<div class="basicinfo">
			<h2>기본 정보</h2>
			<div class="teamdate">
				 <img src="${path}/resources/image/calendar.png"/> 
				 <div>
				 	<span class="basicinfo-tile">회원 모집 기간</span>
					 
					 <fmt:formatDate value="${team.startDay}" pattern="yyyy-MM-dd" var="startday"/>
					 <fmt:formatDate value="${team.endDay}" pattern="yyyy-MM-dd" var="endday"/> 
					 
					 <jsp:useBean id="today" class="java.util.Date" />
					 <fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
					 <span>
					 <span>${startday} ~ ${endday}</span>
					  
					 <c:if test="${now<endday}">
					 	<span class="badge badge-info" style="font-size:15px;">모집중</span> 
					 </c:if>
					 <c:if test="${now>endday}">
					 	 <span class="badge badge-danger">마감</span>
					 </c:if>
					 </span>
					 
					 
					 
				</div>
			</div>
			 <div class="teamnumber">
				 <img src="${path}/resources/image/teamnumber.png"/> 
				  <div>
				  	<span class="basicinfo-tile">모집 인원</span>
				 	<span>${team.num}/${team.participants}명</span>
				 </div>
			 </div>			
		</div>
		<div class="teamintroduce">
			<div>
				<h2>팀 상세정보</h2>
				<p style="word-break:break-all;">
					${team.teamIntroduce}
				</p>
				
				
			</div>
			
		</div>
		
	
		
		<!-- 참여하기 모달창 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">참가 신청을 하시 겠습니까?</div>
						<div class="modal-footer">
							
							<button type="button" class="btn btn-primary" id="teamsubmit">보내기</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소하기</button>
						</div>
					</div>
				</div>
			</div>
			<!--이미 회원인지 혹은 이미 참가 신청을 한상태인지 확인하여 버튼의 상태를 달리한다.  -->
			<c:choose>
				<c:when test="${msg =='member'}">
					<div style="text-align: center;">
					<button class="btn btn-primary" style="width: 80%; height: 70px;" disabled>이미 회원입니다</button>
					</div>
				</c:when>
				
				
				<c:when test="${msg =='apply'}">
					<div style="text-align: center;">
					<button class="btn btn-primary" style="width: 80%; height: 70px;" disabled>참여 대기중 </button>
					</div>
				</c:when>
				 <c:otherwise>
            		<!-- 참여하기 버튼 -->
				<div style="text-align: center;">
					<button class="btn btn-primary" style="width: 80%; height: 70px;"
						data-toggle="modal" data-target="#exampleModal">참가 하기</button>
				</div>	
         		</c:otherwise>
			
			</c:choose>
				
			

		</div>
</div>



<script>

	//참가하기 버튼을 눌른 다음 msg 값을 넘겨 받 게된다. 이떄 참가 신청완료라는 alert 창을 뛰우게되고  teamlist에서 teamdetail로 넘어온경우 msg값이 null 이기 때문에 아무런 alert창이 나오지 않는다. 
	<c:if  test="${apply_result != null && apply_result !='' }">
		alert("${apply_result}");
	</c:if>
	
	
	$("#teamsubmit").click(function(){
		location.href="${path}/team/teamapplication?tbno=${tbno}"
	});
</script>






</body>


</html>
