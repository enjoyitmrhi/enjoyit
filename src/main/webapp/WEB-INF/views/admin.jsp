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
		
		 <div class="col-sm-6">
			관리자로그인
			<form action="adminLoginProc" method="post">
				<table class= "table table-light" align="center" >
					<tr>
						<th ><span>아이디</span></th>
						<td><input type="text" name="adid" class = "form-control"></td>
					</tr>
					<tr>
						<th ><span>비밀번호</span></th>
						<td><input type="password" name="adpw"  class = "form-control"></td>
					</tr>
				</table>
				<input type="submit" value="로그인">

			</form>
		</div>
	</div>
</body>
</html>