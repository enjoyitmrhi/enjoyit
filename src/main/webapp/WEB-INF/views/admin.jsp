<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/bootstrap/css/sb-admin.min.css" >
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.css" >


</head>
<body>

<h3> this is administrator page</h3>
	<div>
	관리자로그인
	<form action="adminLoginProc" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="adid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="adpw"></td>
			</tr>
		</table>
		<input type="submit" value="로그인">
	
	</form>
	</div>
</body>
</html>