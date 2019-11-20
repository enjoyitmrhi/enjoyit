<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
		function modify_auth() {

			document.ansform.submit();
		};
	</script>
</head>
<body>
	<div class="container">
		상품판매자 :${wid }
		<form action="qnamodify" method="post" name="ansform" id="ansform">

			<input type="hidden" name="sbcode" value="${content_view.sbcode }">
			<input type="hidden" name="qanum" value="${content_view.qanum }">
			<input type="hidden" name="wid" value="${wid }">
			<table class="table table-hover">
				<tr>
					<td>글번호</td>
					<td>${content_view.qanum   }</td>

				</tr>
				<tr>
					<td>제목</td>
					<td>${content_view.qatitle   }</td>

				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control" rows="10" name="content">${content_view.qacontent }</textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${content_view.cuid }</td>
				</tr>
				<tr>
					<td colspan="2">

						<div style="float: left;">
							<c:if test="${wid == session_bid && reply}">
							
								<a class="btn btn-outline-primary btn-sm" role="btn"
									href="qnaanswerview?qanum=${content_view.qanum}&wid=${wid }&sbcode=${content_view.sbcode}">답글달기</a>
								<br />
							
							</c:if>
							<c:if test="${content_view.cuid ==session_cid}">
								<input type="button" value="수정하기"
									onclick="javascript:modify_auth()"
									class="btn btn-outline-primary btn-sm">
								<a
									href="qnadelete?qanum=${content_view.qanum}&wid=${wid }&sbcode=${content_view.sbcode}"
									class="btn btn-outline-primary btn-sm" role="btn">삭제하기</a>
							</c:if>
						</div> <input type="submit" style="display: none;">
						<div style="float: right;">
							<a href="qna_list?sbcode=${content_view.sbcode }&wid=${wid}"
								class="btn btn-outline-primary btn-sm" role="btn"> 목록가기</a>
						</div>


					</td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>