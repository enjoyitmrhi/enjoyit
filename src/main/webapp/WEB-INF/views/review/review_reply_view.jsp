<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/include/header.jsp" %>

</head>
<body>
	<h3>reply_view.jsp</h3>
	<form action="review_list">
		<table border="1">
			<tr>
				<td>${reply_view.bunum }</td>
				<td>${reply_view.rvdate }</td>
			</tr>
			<tr>
				<td colspan="2">${reply_view.rvcontent }</td>
			</tr>
		</table>
		<input type="submit" value="뒤로가기" />
	</form>
</body>
</html>