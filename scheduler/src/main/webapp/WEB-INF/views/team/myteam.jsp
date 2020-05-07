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
}

.cd:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}


</style>


</head>
<%@ include file="../include/navbar.jsp" %>
<body>

<div class="container">
	<div class="list-group  list-group-horizontal" id="myList" role="tablist">
	  <a class="list-group-item list-group-item-action active" data-toggle="list" href="#" role="tab">가입대기중</a>
	  <a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">개설한 팀</a>
	  <a class="list-group-item list-group-item-action" data-toggle="list" href="#" role="tab">내가 찜한 팀</a>
	</div>
	<div class="team-layout">
			<div class="team-item container">
			
			
			<c:forEach items="${list}" var="team">
				<div class="row cd" style="height: 100px">
					<div class="col-md-3"
						style="background-color: red; height: 100%; padding-top: 15px; padding-bottom: 15px;">
						<img src="${path}/upload/display?filename=${team.thumbnailList[0].path}/s_${team.thumbnailList[0].uuid}_${team.thumbnailList[0].filename}" style="height: 100%; width: 100%;">
					</div>
					<div class="col-md-9">
						<div class="row" style="height: 100%">
							<div class="col-md-12" style="height: 30%">
								${team.teamName}
							</div>
							<div class="col-md-12" style="height: 70%">
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

</script>
	
</body>
</html>