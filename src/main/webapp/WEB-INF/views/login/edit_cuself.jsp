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
	<form action="editProc_cu" method="post">
		<table>
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="cunum" value="${cu.cunum }" readonly></td>
			</tr>
			<tr>
				<td>회원아이디</td>
				<td><input type="text" name="cuid" value="${cu.cuid }" readonly></td>
			</tr>	
			<tr>
				<td>회원명</td>
				<td><input type="text" name="cuname" value="${cu.cuname }"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="cuaddr" value="${cu.cuaddr }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="cuemail" value="${cu.cuemail }"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="cubirth" value="${cu.cubirth }"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="cugender" value="${cu.cugender }"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="cutel" value="${cu.cutel }"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><label>${cu.cudate }</label></td>
			</tr>
		</table>
		<input type="submit" value="정보수정"> <a
			href="cuMypage"><input type="button"
			value="취소"></a>
	</form>
</body>
</html>