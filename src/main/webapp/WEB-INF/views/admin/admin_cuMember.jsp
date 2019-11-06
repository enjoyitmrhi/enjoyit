<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<script>
		function fnSubmitcForm(page) {
			document.form1.cpage.value = page;
			document.form1.submit();
		}
		function fnSubmitbForm(page) {
			document.form1.bpage.value = page;
			document.form1.submit();
		}
	</script>


	<div class="container">

		<div style="width: 20px; display: inline;">
			<form action="adminMain" name="form1" id="form1" method="post">
				<input type="hidden" name="cpage" value=""> <input
					type="hidden" name="bpage" value=""> <select
					class="form-control" name="sort" onchange="chsort()">
					<option>정렬방법</option>
					<c:choose>
						<c:when test="${num }">
							<option value="num" selected="selected">회원번호</option>
						</c:when>
						<c:otherwise>
							<option value="num">회원번호</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${name }">
							<option value="name" selected="selected">회원명</option>
						</c:when>
						<c:otherwise>
							<option value="name">회원명</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${date }">
							<option value="date" selected="selected">가입일</option>
						</c:when>
						<c:otherwise>
							<option value="date">가입일</option>
						</c:otherwise>
					</c:choose>
					<!-- <option value="num">회원번호</option>
					<option value="name">이름순</option>
					<option value="date">가입일</option> -->
				</select> <input type="submit" value="정렬">
			</form>
		</div>

		

		<br>
		

	</div>
<form action="../del_cu" method="post">
			<h3>일반회원 목록</h3>
			<input type="submit" value="회원삭제">
			<table class="table table-hover">
				<tr class="table-primary">
					<td>선택</td>
					<td>회원번호</td>
					<td>회원아이디</td>
					<td>회원명</td>
					<td>회원주소</td>
					<td>이메일</td>
					<td>생년월일</td>
					<td>성별</td>
					<td>연락처</td>
					<td>가입일</td>

				</tr>
				<c:forEach items="${clist}" var="cu">
					<tr>
						<td><input type="radio" name="cunum" value="${cu.cunum }  "></td>
						<td>${cu.cunum }</td>
						<td><a href="cuManagement?cunum=${cu.cunum}">${cu.cuid }</a></td>
						<td>${cu.cuname  }</td>
						<td>${cu.cuaddr }</td>
						<td>${cu.cuemail }</td>
						<td>${cu.cubirth }</td>
						<td>${cu.cugender  }</td>
						<td>${cu.cutel }</td>
						<td>${cu.cudate }</td>
					</tr>
				</c:forEach>
			</table>
		</form>

		<!-- paging -->
		TotRow: ${cSearchVO.totRow }&nbsp; page/totPage:${cSearchVO.page }/${cSearchVO.totPage }<br>
		<form action="list" method="post">
			<input type="hidden" name="cpage" value="">
			<div>
				<c:if test="${cSearchVO.totPage > 1 }">
					<c:if test="${cSearchVO.page>1 }">
						<a href="adminMain?cpage=1">[처음]</a>
						<a href="adminMain?cpage=${cSearchVO.page-1 }">[이전]</a>
					</c:if>
					<c:forEach begin="${cSearchVO.pageStart }"
						end="${cSearchVO.pageEnd }" var="i">
						<c:choose>
							<c:when test="${i eq cSearchVO.page }">
								<c:out value="${i }" />
							</c:when>
							<c:otherwise>
								<%-- <a href="list?page=${i }"><c:out value="${i }" /></a> --%>
								<a href="javascript:fnSubmitcForm(${i })"><c:out
										value="${i }" /></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${cSearchVO.totPage>cSearchVO.page }">
						<a href="adminMain?cpage=${cSearchVO.page+1 }">[다음]</a>
						<a href="adminMain?cpage=${cSearchVO.totPage }">[마지막]</a>
					</c:if>
				</c:if>
			</div>
		</form>
</body>
</html>