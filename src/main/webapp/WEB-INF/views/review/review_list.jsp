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
	<div class="container">
		<table class="table table-hover">
			<tr class=" table-success">


				<th>제목</th>
				<th>별점</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${review_list }" var="dto">
				<tr>


					<td><c:set value="${dto.rvindent }" var="endIndent" /> <c:forEach
							begin="1" end="${dto.rvindent }" var="cnt">
							<c:if test="${cnt eq endIndent }">
								<img alt="" src="resources/imgs/reply.gif">[re]
				</c:if>
				&nbsp;
			</c:forEach> <a
						href="review_content_view?wid=${wid }&rvnum=${dto.rvnum }&rvcontent=${dto.rvcontent}&rvtitle=${dto.rvtitle}&sbcode=${sbcode}">${dto.rvtitle }</a></td>
					<td><c:choose>
							<c:when test="${dto.rvstar eq '1' }">★</c:when>
							<c:when test="${dto.rvstar eq '2' }">★★</c:when>
							<c:when test="${dto.rvstar eq '3' }">★★★</c:when>
							<c:when test="${dto.rvstar eq '4' }">★★★★</c:when>
							<c:when test="${dto.rvstar eq '5' }">★★★★★</c:when>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${not empty dto.cuid }">${dto.cuid }</c:when>


							<c:otherwise> ${dto.buid } </c:otherwise>
						</c:choose></td>
					<td>${dto.rvdate }</td>
					<td>${dto.rvhit }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7"><c:if test="${session_cid != null}">
						<a href="review_write_view?sbcode=${sbcode }&wid=${wid}">리뷰 작성</a>
					</c:if></td>
			</tr>
		</table>
		<form action="review_list" method="post" id="form1" name="form1">
			<input type="hidden" name="page" value="" /> <input type="hidden"
				value="${wid }" name="wid"><input type="hidden"
				name="sbcode" value="${sbcode }"> TotRow:${searchVO.totRow }&nbsp;
			page/totPage:${searchVO.page }/${searchVO.totPage }
			<script type="text/javascript">
				function fnSubmitForm(page) {
					document.form1.page.value = page;
					document.form1.submit();
				}
			</script>
			<div>
				<c:if test="${searchVO.totPage>1}">
					<c:if test="${searchVO.page>1}">
						<a href="review_list?page=1&sbcode=${sbcode }&wid=${wid }">[처음]</a>
						<a
							href="review_list?page=${searchVO.page-1 }&sbcode=${sbcode }&wid=${wid }">[이전]</a>
					</c:if>
					<c:forEach begin="${searchVO.pageStart}" end="${searchVO.pageEnd}"
						var="i">
						<c:choose>
							<c:when test="${i eq searchVO.page }">
								<c:out value="${i }"></c:out>
							</c:when>
							<c:otherwise>
								<a href="javascript:fnSubmitForm(${i })"><c:out
										value="${i }"></c:out></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${searchVO.totPage>searchVO.page}">
						<a
							href="review_list?page=${searchVO.page+1 }&sbcode=${sbcode }&wid=${wid }">[다음]</a>
						<a
							href="review_list?page=${searchVO.totPage }&sbcode=${sbcode }&wid=${wid }">[마지막]</a>
					</c:if>
				</c:if>
			</div>
			<div>
				<c:choose>
					<c:when test="${rvtitle}">
						<input type="checkbox" name="searchType" value="rvtitle"
							checked="checked" />
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="searchType" value="rvtitle" />
					</c:otherwise>
				</c:choose>
				<label>제목</label>
				<c:choose>
					<c:when test="${rvcontent}">
						<input type="checkbox" name="searchType" value="rvcontent"
							checked="checked" />
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="searchType" value="rvcontent" />
					</c:otherwise>
				</c:choose>
				<label>내용</label> <input type="text" name="sk" style="width: 150px;"
					maxlength="50" value="${serachKeyword }" /> <input type="submit"
					name="btn_search" value="검색" />
			</div>
			<div>
				<a href="qna_list?sbcode=${sbcode }&wid=${wid}"
					class="btn btn-outline-primary btn-sm" role="btn">QnA보기</a>
				<c:if test="${sbtype ==1}">
					<a href="board_list_seminar" class="btn btn-outline-primary btn-sm"
						role="btn"> 목록</a>
				</c:if>
				<c:if test="${sbtype ==2}">
					<a href="board_list_practice"
						class="btn btn-outline-primary btn-sm" role="btn"> 목록</a>
				</c:if>
				<c:if test="${sbtype ==3}">
					<a href="board_list_party" class="btn btn-outline-primary btn-sm"
						role="btn"> 목록</a>
				</c:if>

			</div>
		</form>
	</div>
	<!-- end container -->
</body>
</html>