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
	<h3>this is buModify page</h3>
	<form action="bu_editProc" method="post">
		<table>
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="bunum" value="${bu.bunum }"></td>
			</tr>
			<tr>
				<td>회원아이디</td>
				<td><input type="text" name="buid" value="${bu.buid }" /></td>
			</tr>
			<tr>
				<td>사업자명</td>
				<td><input type="text" name="buname" value="${bu.buname }" /></td>
			</tr>
			<tr>
				<td>사업자주소</td>
				<td><input type="text" name="buaddr" value="${bu.buaddr }" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="buemail" value="${bu.buemail }" /></td>
			</tr>
			<tr>
				<td>사업자등록번호</td>
				<td><input type="text" name="burenum" value="${bu.burenum }" /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="butel" value="${bu.butel }" /></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><label>${bu.budate }</label></td>
			</tr>
		</table>
		<input type="submit" value="정보수정"> <a
			href="buManagement?bunum=${bu.bunum }"><input type="button"
			value="취소"></a>
	</form>
</div>
</body>
</html>