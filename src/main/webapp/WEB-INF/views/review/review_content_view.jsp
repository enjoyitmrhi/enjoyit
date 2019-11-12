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
		<h3>review_content_view.jsp</h3>
		<form action="review_modify?wid=${wid }&sbcode=${sbcode }" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="rvnum" value="${content_view.rvnum }" />
			<input type="hidden" name="rvpic" value="${content_view.rvpic }" />
			<input type="hidden" name="sbcode" value="${content_view.rvnum }" />
			<input type="hidden" name="wid" value="${content_view.rvpic }" />

			<table class="table ">
				<tr>
					<td>제목 :</td>
					<td colspan="3"><input type="text" name="rvtitle"
						value="${content_view.rvtitle }" size="50" /></td>
				</tr>
				<tr>
					<td>별점</td>
					<td colspan="2"><c:choose>
							<c:when test="${content_view.rvstar eq '1' }">☆☆☆☆★</c:when>
							<c:when test="${content_view.rvstar eq '2' }">☆☆☆★★</c:when>
							<c:when test="${content_view.rvstar eq '3' }">☆☆★★★</c:when>
							<c:when test="${content_view.rvstar eq '4' }">☆★★★★</c:when>
							<c:when test="${content_view.rvstar eq '5' }">★★★★★</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<td>${content_view.cuid }|상품 코드 : ${content_view.sbcode }</td>
					<td>${content_view.rvdate }</td>
					<td>조회수 : ${content_view.rvhit } | 번호 : ${content_view.rvnum }
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2"><textarea name="rvcontent" rows="10">
				${content_view.rvcontent }
			</textarea></td>
				</tr>
				<tr>
					<td>사진</td>
					<td colspan="2">
							<img alt="no image" src="resources/upload/${content_view.rvpic }" style="width: 300px; height: 200px;">
							</td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" value="modify" />
						&nbsp;&nbsp;<a href="review_list?sbcode=${sbcode }&wid=${wid}">목록보기</a> &nbsp;&nbsp;<a
						href="review_delete?rvnum=${content_view.rvnum }
				&rvgroup=${content_view.rvgroup }
				&rvstep=${content_view.rvstep }
				&rvindent=${content_view.rvindent }&sbcode=${sbcode }&wid=${wid}
				">삭제</a>
						&nbsp;&nbsp;<a
						href="review_reply_view?rvnum=${content_view.rvnum }&sbcode=${sbcode }&wid=${wid}">답변</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>