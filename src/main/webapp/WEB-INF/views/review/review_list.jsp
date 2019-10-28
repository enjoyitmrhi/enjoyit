<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>review_list</h3>
	<form action="review_write" method="post">
		<table border="1">
			<tr>
				<td colspan="2"><a href="review_write_view">리뷰 작성</a></td>
			</tr>
			<c:forEach items="${review_list}" var="dto">
				<tr>
					<th>${dto.rvtitle }</th>
					<th>${dto.rvstar}</th>
					<%-- <th><c:set var="rvstar" value="${dto.rvstar }" />
							<c:if test="${dto.rvstar}">
								<c:choose>
									<c:when test="${dto.rvstar eq '1' }">
										<img src="../../image/star1.png" alt="${rvstar }" />
									</c:when>
									<c:when test="${dto.rvstar eq '2' }">
										<img src="../../image/star2.png" alt="${rvstar }" />
									</c:when>
									<c:when test="${dto.rvstar eq '3' }">
										<img src="../../image/star3.png" alt="${rvstar }" />
									</c:when>
									<c:when test="${dto.rvstar eq '4' }">
										<img src="../../image/star4.png" alt="${rvstar }" />
									</c:when>
									<c:when test="${dto.rvstar eq '5' }">
										<img src="../../image/star5.png" alt="${rvstar }" />
									</c:when>
								</c:choose>
							</c:if></th> --%>
				</tr>

				<tr>
					<th>${dto.cunum }|${dto.sbcode }</th>
					<th>${dto.rvdate }</th>
				</tr>
				<tr>
					<th colspan="2">${dto.rvcontent}</th>
				</tr>
				<tr>
					<th colspan="2">${dto.rvpic }</th>
				</tr>

				<!-- <tr>
					<td colspan="2"><a href="#">더보기</a></td>
				</tr> -->
				<tr>
					<td colspan="2"><a href="review_reply_write?bunum=b001">답변 달기 |</a><a
						href="review_reply_view?bunum=b001"> 답변 보기</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>

	<div><a href="qna_list">QnA보기</a>
	<a href="board_list">게시글로 가기</a>
	</div>
</body>
</html>