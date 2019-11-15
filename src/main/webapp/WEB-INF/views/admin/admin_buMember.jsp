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
</head>
<body>
	


	<div class="container">

		<div style="width: 20px; display: inline;">
			<form action="admin_buMember" name="form1" id="form1" method="post">
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

	
<form action="del_bu" method="post">
			<h3>가맹회원 목록</h3>
			<input type="submit" value="가맹회원삭제">
			<table class="table table-hover">
				<tr class="table-dark">
					<td>선택</td>
					<td>회원번호</td>
					<td>회원아이디</td>
					<td>사업자명</td>
					<td>사업자주소</td>
					<td>이메일</td>
					<td>사업자등록번호</td>
					<td>연락처</td>
					<td>가입일</td>
				</tr>


				<c:forEach items="${blist}" var="bu">
					<tr>

						<td><input type="radio" name="buid" value="${bu.buid }"></td>

						<td>${bu.bunum}</td>
						<td><a href="buManagement?bunum=${bu.bunum}">${bu.buid }</a></td>
						<td>${bu.buname}</td>
						<td>${bu.buaddr}</td>
						<td>${bu.buemail}</td>
						<td>${bu.burenum}</td>
						<td>${bu.butel}</td>
						<td>${bu.budate}</td>
					</tr>
				</c:forEach>

			</table>
		</form>

		<!-- paging -->
		TotRow: ${bSearchVO.totRow }&nbsp; page/totPage:${bSearchVO.page }/${bSearchVO.totPage }
		<br>
		<form action="list" method="post">
			<input type="hidden" name="bpage" value="">
			<div>
				<c:if test="${bSearchVO.totPage > 1 }">
					<c:if test="${bSearchVO.page>1 }">
						<a href="admin_buMember?bpage=1">[처음]</a>
						<a href="admin_buMember?bpage=${bSearchVO.page-1 }">[이전]</a>
					</c:if>
					<c:forEach begin="${bSearchVO.pageStart }"
						end="${bSearchVO.pageEnd }" var="i">
						<c:choose>
							<c:when test="${i eq bSearchVO.page }">
								<c:out value="${i }" />
							</c:when>
							<c:otherwise>
								<%-- <a href="list?page=${i }"><c:out value="${i }" /></a> --%>
								<a href="javascript:fnSubmitbForm(${i })"><c:out
										value="${i }" /></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${bSearchVO.totPage>bSearchVO.page }">
						<a href="admin_buMember?bpage=${bSearchVO.page+1 }">[다음]</a>
						<a href="admin_buMember?bpage=${bSearchVO.totPage }">[마지막]</a>
					</c:if>
				</c:if>
			</div>
			<a href="admin_cuMember"><input type="button" value="일반회원보기"></a>
		</form>
	</div>
	<!-- end container -->

</body>
</html>