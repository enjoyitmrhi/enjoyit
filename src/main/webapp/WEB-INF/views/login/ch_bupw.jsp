<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "container">

<h2>${session_bid }님 비밀번호 변경</h2>
<form action="ch_bupwProc" method="post"> 
기존 비밀번호를 입력해주세요<br/>
<input type="password" name="bupw"/><br/>
변경할 비밀번호를 입력해주세요<br/>
<input type="password" name="chpw" id="chpw"/><br/>
비밀번호 재확인<br/>
<input type="password" name="chpw2" id="chpw2"/><br/>
<div id="pw2_check"></div>
<input type="submit" value="변경">
</form>
</div>

</body>
</html>