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
		height:150px;
		width:100%;	
	}
	.mainthumb img{
		width:150px;
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
		text-align:center;
	}
	.master img{
		border-radius:50%;
		width:10%;
		height:10%;
	}
	.master span{
		margin-left:5%;
		font-size: 2em;
			
	}
	.master div{
		margin-top:30px;
	}
</style>


<%@ include file ="../include/header.jsp" %>





</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<div style="height:100%; width:100%;">
	<div class="" style="width:700px; height:12700px; background-color:red; margin-right:auto; margin-left:auto; ">
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
			<div class="team-intro" style="height:300px;">
				<div class="teamtitle">
					<p>${team.teamName}</p>
				</div>
			</div>
			 
		</div>
		
		<div class="master">
			<div>
				 <img src="${path}/upload/display?filename=${team.proFileImg.path}/s_${team.proFileImg.uuid}_${team.proFileImg.filename}"/> 
				 <span>${team.masterName}</span>
			 </div>		
		</div>
						

	</div>
</div>










</body>


</html>
