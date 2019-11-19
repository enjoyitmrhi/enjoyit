<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container">

		<form action="bu_editProc" method="post">
			<table class="table" style="width: 70%; height: 50%;">
				<tr>
					<th width="20%">회원번호</th>
					<td><input type="text" name="bunum" value="${bu.bunum }"
						class="form-control"></td>
				</tr>
				<tr>
					<th width="20%">회원아이디</th>
					<td><input type="text" name="buid" value="${bu.buid }"
						class="form-control" /></td>
				</tr>
				<tr>
					<th width="20%">사업자명</th>
					<td><input type="text" name="buname" value="${bu.buname }"
						class="form-control" /></td>
				</tr>
				<tr>
					<th width="20%">사업자주소</th>
					<td><input type="text" name="buaddr" value="${bu.buaddr }"
						class="form-control" /></td>
				</tr>
				<tr>
					<th width="20%">이메일</th>
					<td><input type="email" name="buemail" value="${bu.buemail }"
						class="form-control" /></td>
				</tr>
				<tr>
					<th width="20%">사업자등록번호</th>
					<td><input type="text" name="burenum" value="${bu.burenum }"
						class="form-control" /></td>
				</tr>
				<tr>
					<th width="20%">연락처</th>
					<td><input type="text" name="butel" value="${bu.butel }"
						class="form-control" /></td>
				</tr>
				<tr>
					<th width="20%">가입일</th>
					<td><label>${bu.budate }</label></td>
				</tr>
			</table>
			<input type="submit" value="정보수정" class="btn btn-outline-dark btn-sm">
			<a href="buManagement?bunum=${bu.bunum }" role="btn"
				class="btn btn-outline-dark btn-sm">취소</a>
		</form>
	</div>
</body>
</html>