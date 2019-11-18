<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<c:url value= "/resources/bootstrap/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value= "/resources/bootstrap/css/bootstrap.min.css" />">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function join() {
	var url = "join.pop";
    var name = "Customer Join";
    var option = "width = 500, height = 700, top = 50, left = 200, location = no"
    window.open(url, name, option);
}

function bJoin() {
	var url = "bJoin.pop";
    var name = "Business Join";
    var option = "width = 500, height = 700, top = 50, left = 200, location = no"
    window.open(url, name, option);
}

function login() {
	var url = "login.pop";
    var name = "Login page";
    var option = "width = 500, height = 700, top = 50, left = 200, location = no"
    window.open(url, name, option);
}

/* session.setAttribute("session_cid",getCookie("session_cid"));
session.setAttribute("session_bid",getCookie("session_bid")); */
</script>
<% 
Cookie[] cookies = request.getCookies();
if(cookies != null){
    for(Cookie cookie : cookies){
        if(cookie.getName().equals("cid")){
            session.setAttribute("session_cid", cookie.getValue());
        }else if(cookie.getName().equals("cname")){
            session.setAttribute("session_cname", cookie.getValue());
        }else if(cookie.getName().equals("bid")){
            session.setAttribute("session_bid", cookie.getValue());
        }else if(cookie.getName().equals("bname")){
            session.setAttribute("session_bname", cookie.getValue());
        }
    }
} 
%>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary"> <a
		class="navbar-brand" href="/enjoyit/">Enjoy_IT</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarColor01" aria-controls="navbarColor01"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="/enjoyit/">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown show"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" href="board_list_seminar">Seminar room</a>
				<div class="dropdown-menu " x-placement="bottom-start"
					style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 35px, 0px);">
					<a class="dropdown-item" href="board_list_seminar">Meeting room</a> <a
						class="dropdown-item" href="board_list_seminar">Study room</a> <a
						class="dropdown-item" href="board_list_seminar">Something else here</a>
				</div></li>
			<li class="nav-item dropdown show"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" href="board_list_practice">Practice
					room</a>
				<div class="dropdown-menu " x-placement="bottom-start"
					style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 35px, 0px);">
					<a class="dropdown-item" href="board_list_practice">Singing practice room</a> <a
						class="dropdown-item" href="board_list_practice">Dance practice room</a> <a
						class="dropdown-item" href="board_list_practice">Performance practice room</a>

				</div></li>
			<li class="nav-item  dropdown show"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" href="board_list_party">Party room</a>
				<div class="dropdown-menu " x-placement="bottom-start"
					style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 35px, 0px);">
					<a class="dropdown-item" href="board_list_party">Big party room</a> <a
						class="dropdown-item" href="board_list_party">Small party room</a> <a
						class="dropdown-item" href="board_list_party">Something else here</a>

				</div></li>
			<li class="nav-item"><a class="nav-link" href="#">About</a></li>
		</ul>











		<div class="form-inline my-2 my-lg-0">
			<c:if test="${session_cid != null }">
			<span style="color: #ccc">
			[${session_cname }]님 로그인 되셨습니다.
			</span>
			</c:if>
			<c:if test="${session_bid != null }">
			<span style="color: #ccc">
			[${session_bname }]님 로그인 되셨습니다.
			</span>
			</c:if>
		</div>
		<c:if test="${session_cid !=null }">
			<form class="form-inline my-2 my-lg-0" action="cuMypage">
				<button class="btn btn-secondary btn-sm" type="submit">MyPage</button>
			</form>
		</c:if>
		<c:if test="${session_bid !=null }">
			<form class="form-inline my-2 my-lg-0" action="buMypage">
				<button class="btn btn-secondary  btn-sm" type="submit">MyPage</button>
			</form>
		</c:if>
		&nbsp;&nbsp;
		<c:if test="${session_bid != null || session_cid != null  }">
			<form class="form-inline my-2 my-lg-0" action="logout">

				<button class="btn btn-secondary btn-sm" type="submit">Logout</button>

			</form>

		</c:if>
		<c:if test="${session_bid == null && session_cid == null  }">
			<div class="btn-group">
				<button type="button"
					class="btn btn-secondary dropdown-toggle btn-sm"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sign
					up</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="javascript:join()">고객회원가입</a> <a
						class="dropdown-item" href="javascript:bJoin()">기업회원가입</a>
				</div>
			</div>
			&nbsp;&nbsp;
			<form class="form-inline my-2 my-lg-0" action="javascript:login()">
				<button class="btn btn-secondary  btn-sm" type="submit">Sign
					in</button>
			</form>












		</c:if>
	</div>


	</nav>
	<div class="clearfix"></div>
	<br />
</body>
</html>