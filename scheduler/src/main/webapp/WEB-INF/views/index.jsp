<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="include/header.jsp" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
 
<style>

 * {
  box-sizing: border-box;
}

body {
  background: #2A2E37;
  height: 100vh;
}

.search {
  width: 100px;
  height: 100px;
  margin: 40px auto 0;
  background-color: #242628;
  position: relative;
  overflow: hidden;
  transition: all 0.5s ease;
}
.search:before {
  content: '';
  display: block;
  width: 3px;
  height: 100%;
  position: relative;
  background-color: #00FEDE;
  transition: all 0.5s ease;
}
.search.open {
  width: 700px;
}
.search.open:before {
  height: 60px;
  margin: 20px 0 20px 30px;
  position: absolute;
}

.search-box {
  width: 600px;
  height: 60px;
  box-shadow: none;
  border: none;
  background: transparent;
  color: #fff;
  padding: 20px 30px 20px 45px;
  font-size: 40px;
}
.search-box:focus {
  outline: none;
}

.search-button {
  width: 100px;
  height: 100px;
  display: block;
  position: absolute;
  right: 0;
  top: 0;
  padding: 20px;
  cursor: pointer;
}

.search-icon {
  width: 40px;
  height: 40px;
  border-radius: 40px;
  border: 3px solid #00FEDE;
  display: block;
  position: relative;
  margin-left: 5px;
  transition: all 0.5s ease;
}
.search-icon:before {
  content: '';
  width: 3px;
  height: 15px;
  position: absolute;
  right: -2px;
  top: 30px;
  display: block;
  background-color: #00FEDE;
  transform: rotate(-45deg);
  transition: all 0.5s ease;
}
.search-icon:after {
  content: '';
  width: 3px;
  height: 15px;
  position: absolute;
  right: -12px;
  top: 40px;
  display: block;
  background-color: #00FEDE;
  transform: rotate(-45deg);
  transition: all 0.5s ease;
}
.open .search-icon {
  margin: 0;
  width: 60px;
  height: 60px;
  border-radius: 60px;
}
.open .search-icon:before {
  transform: rotate(52deg);
  right: 22px;
  top: 23px;
  height: 18px;
}
.open .search-icon:after {
  transform: rotate(-230deg);
  right: 22px;
  top: 13px;
  height: 18px;
}

.title{
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
}


</style>
</head>

<body>
<%@ include file="include/navbar.jsp" %>
<div class="container title">
	<div>
		<h2 style="color:white; text-align:center; font-size:13em;">SCHEDULER</h2>
	</div>
	<div class="search">
	  <input type="search" class="search-box" />
	  <span class="search-button">
	    <span class="search-icon"></span>
	  </span>
	</div>

</div>



<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script>

$('.search-button').click(function(){
	  $(this).parent().toggleClass('open');
});


</script>

</body>
</html>