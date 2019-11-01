<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
	<div class="container">
		<h3>this is index page</h3>
		<c:if test="${session_cid != null }">
[${session_cname }]님 로그인 되셨습니다.	
</c:if>
		<c:if test="${session_bid != null }">
[${session_bname }]님 로그인 되셨습니다.	
</c:if>


		<ul>
			<c:if test="${session_cid == null && session_bid == null }">
				<li><a href="login">login</a></li>
			</c:if>
			<c:if test="${session_cid != null }">
				<li><a href="logout">logout</a></li>
			</c:if>
			<c:if test="${session_bid != null }">
				<li><a href="logout">logout</a></li>
			</c:if>
			<c:if test="${session_cid == null && session_bid == null}">
				<li><a href="board_list">BOARD without LOGIN</a></li>
			</c:if>
			<c:if test="${session_bid != null }">
				<li><a href="board_list">BOARD</a></li>
			</c:if>
			<c:if test="${session_cid != null }">
				<li><a href="board_list">BOARD</a></li>
			</c:if>
			<c:if test="${session_bid != null }">
				<li><a href="buMypage">My Page</a></li>
			</c:if>
			<c:if test="${session_cid != null }">
				<li><a href="cuMypage">My Page</a></li>
			</c:if>

		</ul>
	</div>

</body>
</html>