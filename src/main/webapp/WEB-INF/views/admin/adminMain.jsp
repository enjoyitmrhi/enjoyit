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
		function selectCId() {
			var chkcid = $('input:radio[name="selectcid"]:checked').val();
			return chkid;
		}
	</script>










	<div class="container">

		<div style="width: 20px; display: inline;" >
			<form action="adminMain" name="form1" method="post">
				<select class="form-control" name="sort" onchange="chsort()">
					<option value="">정렬방법</option>
					<option value="num">회원번호</option>
					<option value="name">이름순</option>
					<option value="date">가입일</option>
				</select> <input type="submit" value="정렬">
			</form>
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
		<br>
		<form action="../del_bu" method="post">
			<h3>가맹회원 목록</h3>
			<input type="submit" value="가맹회원삭제">
			<table class="table table-hover">
				<tr class="table-secondary">
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

						<td><input type="radio" name="bunum" value="${bu.bunum }"></td>

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
	</div>




</body>


</html>