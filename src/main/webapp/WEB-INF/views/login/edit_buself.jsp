<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<div class = "container">
	<form action="editProc_bu" method="post">
		<table class ="table" style="width: 70%;">
			<tr>
				<td style="width: 200px;">회원번호</td>
				<td><input type="text" name="bunum" value="${bu.bunum }" readonly class="form-control"></td>
			</tr>
			<tr>
				<td>회원아이디</td>
				<td><input type="text" name="buid" value="${bu.buid }" readonly class="form-control"/></td>
			</tr>
			<tr>
				<td>사업자명</td>
				<td><input type="text" name="buname" value="${bu.buname }" class="form-control"/></td>
			</tr>
			<tr>
				<td>사업자주소</td>
				<td><input type="text" name="buaddr" value="${bu.buaddr }" class="form-control"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="buemail" value="${bu.buemail }" class="form-control"/></td>
			</tr>
			<tr>
				<td>사업자등록번호</td>
				<td><input type="text" name="burenum" value="${bu.burenum }" class="form-control"/></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="butel" value="${bu.butel }" class="form-control"/></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><label>${bu.budate }</label></td>
			</tr>
		</table>
		<input type="submit" value="정보수정"> <a
			href="buMypage?bunum=${bu.bunum }">
			 <input type="button" value="취소"></a>
	</form>
	</div>
</body>
</html>