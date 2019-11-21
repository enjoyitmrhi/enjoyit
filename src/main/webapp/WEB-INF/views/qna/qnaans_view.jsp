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
		<form action="qnaanswer_write">

			<input type="hidden" name="num" value="${answerview.qanum }">
			<input type="hidden" name="sbcode" value="${answerview.sbcode }">
			<input type="hidden" name="group" value="${answerview.qagroup }">
			<input type="hidden" name="step" value="${answerview.qastep }">
			<input type="hidden" name="indent" value="${answerview.qaindent }">

			<table class="table">
				<tr>
					<td>글번호</td>
					<td><input class="form-control" type="text" name="num"
						readonly="readonly" value="${answerview.qanum }"></td>

				</tr>
				<tr>
					<td>제목</td>
					<td><input class="form-control" type="text" name="title"
						value="${answerview.qatitle }"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><pre><textarea class="form-control" rows="10" cols="20" name="content">${answerview.qacontent }
└[re]
</textarea>
					</pre></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input class="form-control" type="text" name="id"
						value="${session_bid }" readonly="readonly"></td>
				</tr>

			</table>
			<input class="btn btn-outline-primary btn-sm" type="submit"
				value="완료"> <a
				href="qna_list?sbcode=${answerview.sbcode }&wid=${wid}"
				class="btn btn-outline-warning btn-sm" role="button"> 취소</a>
			&nbsp;&nbsp;
		</form>
	</div>

</body>
</html>
