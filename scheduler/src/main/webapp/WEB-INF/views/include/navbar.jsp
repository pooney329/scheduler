<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<a class="navbar-brand" href="${path}">Hidden brand</a>
			<div class="container-fluid">
				<ul class="nav justify-content-end">
					<c:if test="${sessionScope.loginuser != null}">
						<li class="nav-item"><a class="nav-link active" href="#">${sessionScope.loginuser.name}</a></li>
						<li class="nav-item"><a class="nav-link active" href="${path}/user/logout">logout</a></li>
						
					</c:if>
					<c:if test="${sessionScope.loginuser == null}">
						<li class="nav-item"><a class="nav-link active" href="${path}/user/login">login</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link" href="#">serach</a></li>
				</ul>
			</div>
		</div>
</nav>