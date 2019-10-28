<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<script language="javascript" type="text/javascript">
	function change_cuMod(){

		$('#cuType').css('display','block');
		$('#buType').css('display','none');				
	};
	function change_buMod(){
		$('#cuType').css('display','none');
		$('#buType').css('display','block');
	};
		
		
</script>
	
	<div id="cuType" >
	<h3><strong>회원 로그인</strong></h3>
	<form action="loginProc" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="cuid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="cupw"></td>
			</tr>
		</table>
		<input type="submit" value="로그인">
	
	</form>
	</div>
	
	<div id="buType" style="display:none;">
	<h3><strong>가맹점 로그인</strong></h3>
	<form action="bLoginProc" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="buid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="bupw"></td>
			</tr>
		</table>
		<input type="submit" value="로그인">
	
	</form>
	</div>
	  <input type="radio" name="login" id="cu" onclick="javascript:change_cuMod()" checked="checked" /> 
	  <span class="up">회원로그인</span>&nbsp;&nbsp; 
	  <input type="radio" name="login" id="bu" onclick="javascript:change_buMod()"/> 
	  <span class="up">가맹점로그인</span>
	

	<ul>
		<li><a href="index">index</a>
		<li><a href="join">고객회원가입</a></li>
		<li><a href="bJoin">가맹점회원가입</a></li>
		<li><a href="findId">findId</a></li>
		<li><a href="findPw">findPw</a></li>
	</ul>
</body>
</html>	