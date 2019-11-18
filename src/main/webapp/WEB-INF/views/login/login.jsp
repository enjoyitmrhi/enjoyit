<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<script language="javascript" type="text/javascript">
	function change_cuMod() {

		$('#cuType').css('display', 'block');
		$('#buType').css('display', 'none');
	};
	function change_buMod() {
		$('#cuType').css('display', 'none');
		$('#buType').css('display', 'block');
	};

	function loginProc() {
		var userid = $('input#cuid').val();
		var userpw = $('input#cupw').val();
		$.ajax({
			type : "POST",
			url : "loginProc.do",
			data : {
				userid : userid,
				userpw : userpw
			},
			success : function(data) {
				if (data == 'true') {
					document.form1.submit();
					window.opener.location.reload();
					alert("로그인 성공하셨습니다.");
					window.close();
				} else {
					alert(data);
					$('input#cuid').val() = "";
					$('input#cupw').val() = "";
				}
			},
			error : function(data) {
				alert("fail..");
			}

		});
	}

	function bLoginProc() {
		var userid = $('input#buid').val();
		var userpw = $('input#bupw').val();
		$.ajax({
			type : "POST",
			url : "bLoginProc.do",
			data : {
				userid : userid,
				userpw : userpw
			},
			success : function(data) {
				if (data == 'true') {
					document.form1.submit();
					window.opener.location.reload();
					alert("로그인 성공하셨습니다.");
					window.close();
				} else {
					alert(data);
					$('input#buid').val() = "";
					$('input#bupw').val() = "";
				}
			},
			error : function(data) {
				alert("fail..");
			}

		});
	}
</script>
</head>
<body>
	<br>

	<div class="container">
		<div id="cuType">
			<h3>
				<strong>회원 로그인</strong>
			</h3>
			<form action="#" method="post" name="form1">
				<table>
					<tr>
						<td>아이디</td>
						<td><input class="form-control" type="text" name="cuid"
							id="cuid"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="form-control" name="cupw"
							id="cupw"></td>

					</tr>
				</table>

				<input type="button" value="로그인" onclick="loginProc()">

			</form>
		</div>

		<div id="buType" style="display: none;">
			<h3>
				<strong>가맹점 로그인</strong>
			</h3>
			<form action="#" method="post" name="form2">
				<table>
					<tr>
						<td>아이디</td>
						<td><input class="form-control" type="text" name="buid"
							id="buid"></td>


					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input class="form-control" type="password" name="bupw"
							id="bupw"></td>

					</tr>
				</table>
				<input type="button" value="로그인" onclick="bLoginProc()">

			</form>
		</div>

		<input type="radio" name="login" id="cu"
			onclick="javascript:change_cuMod()" checked="checked" /> <span
			class="up">회원로그인</span>&nbsp;&nbsp; <input type="radio" name="login"
			id="bu" onclick="javascript:change_buMod()" /> <span class="up">가맹점로그인</span>


		<ul>
			<li><a href="findId">아이디찾기</a></li>
			<li><a href="findPw">비밀번호찾기</a></li>
		</ul>
	</div>



</body>
</html>
