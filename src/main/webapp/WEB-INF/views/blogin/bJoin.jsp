<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/include/header.jsp"%>

</head>
<body>
	<h3>this is join page</h3>
	<form action="bJoinProc" method="post">
		<label>아이디</label> <input type="text" name="buid"> <input
			type="button" value="중복확인"><br> <label>비밀번호</label> <input
			type="text" name="bupw"><br> <label>비밀번호 확인</label> <input
			type="text" name="bupw2"><br> <label>사업자명</label> <input
			type="text" name="buname"><br> <label>주소</label> <input
			type="text" name="buaddr"><br> <label>사업자등록번호</label> <input
			type="text" name="burenum"><br> <label>연락처</label> <input
			type="tel" name="butel"><br> <label>이메일</label> <input
			type="email" name="buemail"><br> <input type="submit"
			value="회원가입">


	</form>
</body>
</html>