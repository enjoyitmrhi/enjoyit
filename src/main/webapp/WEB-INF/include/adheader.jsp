<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
		class="navbar-brand" href="#">관리자 페이지</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarColor02" aria-controls="navbarColor02"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarColor02">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="/enjoyit/admin">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item "><a class="nav-link" href="admin_cuMember">고객 회원관리</a></li>
			<li class="nav-item "><a class="nav-link" href="admin_buMember">가맹 회원관리</a></li>
			<li class="nav-item dropdown show"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" href="#">회원관리</a>
				<div class="dropdown-menu " x-placement="bottom-start"
					style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 35px, 0px);">
					<a class="dropdown-item" href="admin_cuMember">고객 회원 관리</a> <a
						class="dropdown-item" href="admin_buMember">가맹 회원관리</a>

				</div></li>

		</ul>





	</div>


	</nav>
	<br />
</body>
</html>