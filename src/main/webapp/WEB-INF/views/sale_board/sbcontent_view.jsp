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
	<h3>sbcontent_view</h3>

	작성자 = ${wid }
	<br /> 상품코드 = ${sbcode }
	<br /> 로그인 한 유저 = ${session_bid }${session_cid }
	<br />
	<a href="review_list"> 리뷰보기</a>
	<br />
	<a href="qna_list?wid=${wid }">QnA</a>
	<br />

</body>
</html>