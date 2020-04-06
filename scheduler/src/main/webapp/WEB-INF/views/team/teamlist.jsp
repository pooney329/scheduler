<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #wrap li{
            float: left;
            
            margin: 10px;
            
        }
        #wrap ul{
            list-style:none;
        }
        
        #wrap ul li{
            width: 250px; height:400px; 
            
        }
        .teamtitle{
              width:100%;
              padding:0 5px;
              overflow:hidden;
              text-overflow:ellipsis;
            
             
              white-space:nowrap;
            
        }
        .teamthumb img{
            position: absolute;
            width: 100%; 
            height: 100%; 
            
        }
        .backthumb{
            opacity: 0;
            transition: opacity 1s
        }
        
        .backthumb:hover{
            opacity: 1;
            
        }
        .teamexplain:hover #teamthumb{
            display: none;
        }
        
        .teamexplain .teamhashtag{
            display: none;
        }
        .teamexplain:hover .teamhashtag {
            display: block;
        }
        
        .teamexplain .teamtitle{
            color: #47a3da;
            
        }
        .teamexplain:hover{
            
            position: absolute;
            bottom: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            transition: 0.3s;
            opacity: 1;
            
            
            
        }
        .teamexplain:hover .teamnumber{
            font-size: 1.5em;
            transition: 0.3s;
            color: cadetblue;
        }
        
        .teamexplain:hover .teamtitle{
            padding: 10px;
            margin-top: 30px;
            
            height: 20%;
        }
        
        .teamexplain:hover .teamhashtag{
            color:#CECECE;
            font-size: 1.6em;
            height: 40%;
        }
        .teamexplain:hover button{
            display: inline-block;
            text-align: center;
        }
        
        .teamexplain{
            
            position: relative;
            background-color: #2A2B30; 
            width: 100%; 
            height: 20%; 
            text-align: center;
            
            
        }
        .teamitem{
            height:100%; 
            position: relative;
            border-radius: 2%;
            overflow: hidden;
            
            
            
        }
        
        .teamthumb{
            background-color: aquamarine; 
            width: 100%; 
            height: 80%;
            position: relative;
            
        }
        
        .teamnumber{
            color: #fff;
            position: absolute;
            bottom: 0px;
            right: 0px;
            
        }
        .wrap{
            width: 100%; 
            min-height: 100vh;
        }
        .teamexplain button{
            display: none;
        }
        


</style>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/navbar.jsp" %>


	
<div id="wrap">
	<div class="teamcontainer">
		<ul>
		
				
		</ul>
	
	</div>
	
</div>	



</body>


<script>
/*  team리스트를 가져올경우 각 teamdto객체에는 썸네일이 존재 할 수 있고 없을 수 있다. 이때 존재 한다면 리스트를 뿌려줌과 동시에 썸네일 2개의 이미지를 뿌려주는 경우를 위하여 아래와 같이 js에서 객체와 리스트를 다시만들어 자바의 리스트 객체에 있는 데이터를 뽑아서 다시 넣어서 
 * 만들어주는 작업이 필요하다 이유는 json으로 데이터를 가져오는 경우가 아닌경우는 자바의 객체를 js에서 사용할 수 있는 객체로 바로 바꿔주는 방법이 없으니 다시 만들어주는 작업을 수행해야한다. 
 */
 
 
 $.ajax({
	 url: "${path}/team/teamlist",
	 method: "post",
	 data : "json",
	 success : function(result){
		 console.log(result);
	 },
	 })
 
 
 
var teamlist = new Array();
var thumbnaillist;
var thumbnaill; 
var team;
<c:forEach var="team" items="${list}">
	team = new Object;
	thumbnaillist = new Array();
	
	team.tbno = ${team.tbno};
	team.teamMaster ="${team.teamMaster}" ;//방장
	team.teamIntroduce ="${team.teamIntroduce}";  //팀소개
	team.teamName ="${team.teamName}";  //팀이름
	team.category ="${team.category}"; //팀카테고리
	team.teamContent ="${team.teamContent}"; //팀 내용
	team.teamHashTag ="${team.teamHashTag}"; //팀 해쉬태그
	team.participants ="${team.participants}"; //참여인원 수 
	team.allowSearch ="${team.allowSearch}";  // 검색 노출 허용 여부
	team.thumbnailExistence ="${team.thumbnailExistence}";  //썸네일 존재 여부
	team.num ="${team.num}";  //썸네일 존재 여부
	
	thumbnailist = new Array();
	
	<c:if test="${team.thumbnailList != null}">
		<c:forEach var="thumbnail" items="${team.thumbnailList}">
			thumbnail = new Object();
			thumbnail.tIdx = "${thumbnail.tbno}";
			thumbnail.uuid = "${thumbnail.uuid}";
			thumbnail.filename = "${thumbnail.filename}";
			thumbnail.path = "${thumbnail.path}";
		
			thumbnail.mainThumbnail = "${thumbnail.mainThumbnail}";
			thumbnail.backThumbnail = "${thumbnail.backThumbnail}";
			thumbnailist.push(thumbnail);	
			
		</c:forEach>
		team.thumbnailList = thumbnailist;
	</c:if>

	<c:if test="${team.thumbnailList == null }">
		team.thumbnailList = null;
	</c:if>
	 teamlist.push(team);
</c:forEach>

for(var i=0; i<teamlist.length; i++){
	var $ul = $(".teamcontainer ul");
	var $li = $("<li>");
	
	var $teamitem =$("<div>");
	$teamitem.attr("class","teamitem");
	$li.append($teamitem);
	
	var $teamthumb= $("<div>"); 
	$teamthumb.attr("class","teamthumb")
	
	
	

	
	var $back_img = $("<img>");
	$back_img.attr("src", '${path}/resources/image/greyback.PNG');
	
	$teamthumb.append($back_img);
	
	
	var $main_img = $("<img>");
	$main_img.attr("src", '${path}/resources/image/default_img.jpg');
	$main_img.attr("class","backthumb");
	$teamthumb.append($main_img);
	
		
	$teamitem.append($teamthumb);
	
	var $teamexplain  = $("<div class='teamexplain'>");
	
	
	
	
	var $h3 = $("<h3>");
	$h3.text(teamlist[i].teamName);
	$h3.attr("class", "teamtitle");
	
	var $p = $("<p>");
	$p.text(teamlist[i].teamHashTag);
	$p.attr("class","teamhashtag");
	
	
	var $span = $("<span>");
	$span.text(teamlist[i].num+"/"+teamlist[i].participants);
	$span.attr("class","teamnumber");
	
	var $button = $("<button>");
	
	$button.text("탐방하기");
	
	$button.attr("class","btn btn-primary");
	
	
	
	$teamexplain.append($h3);
	$teamexplain.append($p);
	$teamexplain.append($span);
	$teamexplain.append($button);
	
	$teamitem.append($teamexplain); 
	
	
	if(teamlist[i].thumbnailList != null){
		
		
		for(var j =0; j<teamlist[i].thumbnailList.length; j++){
			
			var path = teamlist[i].thumbnailList[j].path + '/s_' + teamlist[i].thumbnailList[j].uuid + '_'+ teamlist[i].thumbnailList[j].filename;
			path = encodeURIComponent(path);
			
			console.log(teamlist[i].thumbnailList[j].backThumbnail);
			
			console.log(teamlist[i].thumbnailList[j]);
			if(teamlist[i].thumbnailList[j].mainThumbnail =="Y"){
				
				$back_img.attr("src", '${path}/upload/display?filename=' + path);
				
			}
			else if(teamlist[i].thumbnailList[j].backThumbnail == "Y" ){
				
				
				
				$main_img.attr("src", '${path}/upload/display?filename=' + path);
				   
			}
		}	
	}
	$ul.append($li);
	
}
</script>


</html>