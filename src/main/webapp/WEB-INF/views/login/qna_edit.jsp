<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	<div class="container">
	<h3>content_view</h3>
	상품판매자 :${session_bid }
	<form action="qnaanswerview" method="post" name="ansform" id="ansform">
		<input type="hidden" name="num" value="${num }">
		<table class="table table-hover">
			<tr>
				<td>글번호</td>
				<td>${num }</td>

				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control" rows="10" name="content">${content_view.qacontent }</textarea>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${content_view.cuid }</td>
				</tr>

		</table>
		<input type="button" value="답글달기" onclick="javascript:reply_auth()">
		<!-- <button onclick="javascript:reply_auth()">답글달기</button> -->
		<input type="submit" style="display: none;">

		</form>
		<a href="qna_list"> 목록가기</a>
		<button onclick="javascript:del_auth()">삭제하기</button>
		&nbsp;&nbsp;
		<button onclick="javascript:modify_auth()">수정하기</button>
	</div>
</body>
</html>