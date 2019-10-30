<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h3>qnaans_view</h3>
	<form action="qnaanswer_write">

		<input type="hidden" name="num" value="${answerview.qanum }">
		<input type="hidden" name="group" value="${answerview.qagroup }">
		<input type="hidden" name="step" value="${answerview.qastep }">
		<input type="hidden" name="indent" value="${answerview.qaindent }">

		<table border="1 solid #fff" width="200">
			<tr>
				<td>글번호</td>
				<td><input type="text" name="num" readonly="readonly"
					value="${answerview.qanum }"></td>

			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"
					value="${answerview.qatitle }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="20" name="content">
			${answerview.qacontent }</textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="id"
					value="${session_bid }${session_cid }" readonly="readonly"></td>
			</tr>

		</table>

		<input type="submit" value="답글쓰기">
	</form>

</body>
</html>
