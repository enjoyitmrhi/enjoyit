<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h3>this is cuModify page</h3>
	<table>
		<tr>
			<td>회원번호</td>
			<td><input type="text">${cu.cunum }</td>
		</tr>
		<tr>
			<td>회원아이디</td>
			<td>${cu.cuid }</td>
		</tr>
		<tr>
			<td>회원명</td>
			<td>${cu.cuname }</td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td>${cu.cuaddr }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${cu.cuemail }</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${cu.cubirth }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${cu.cugender }</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${cu.cutel }</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>${cu.cudate }</td>
		</tr>
	</table>
</body>
</html>