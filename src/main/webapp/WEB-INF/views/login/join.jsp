<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>

	<script type="text/javascript">
		var idchk = 0;
		function chk_id() {
			var userid = $('input#cuid').val();
			var result;
			$.ajax({
				type : "POST",
				url : "chk_cid.do",
				data : {
					userid : userid
				},
				success : function(data) {

					if (data == 'false') {
						alert("이미 사용중인 아이디입니다.");
					} else if (userid == null) {
						alert("아이디를 입력해주세요");
					} else {
						alert("사용가능한 아이디입니다.");
						idchk = 1;
					}
				},
				error : function(data) {
					alert("fail..");
				}
			});
		}

		function checkfield() {
			if (document.addjoin.cuid.value == "") {
				alert("아이디를 입력하세요");
				document.addjoin.cuid.focus();
				exit;
			} else if (document.addjoin.cupw.value == "") {
				alert("비밀번호를 입력하세요");
				document.addjoin.cupw.focus();
				exit;

			} else if (document.addjoin.cupw2.value == "") {
				alert("비밀번호확인을 입력하세요");
				document.addjoin.cupw2.focus();
				exit;

			} else if (document.addjoin.cuname.value == "") {
				alert("이름을 입력하세요");
				document.addjoin.cuname.focus();
				exit;

			} else if (document.addjoin.cutel.value == "") {
				alert("연락처를 입력하세요");
				document.addjoin.cutel.focus();
				exit;

			} else if (document.addjoin.cuemail.value == "") {
				alert("이메일을 입력하세요");
				document.addjoin.cuemail.focus();
				exit;
			} else if (idchk == 0) {
				alert("아이디 중복체크 바랍니다.");
				document.addjoin.chk_cid.focus();
				exit;
			}

			if (document.addjoin.cupw.value != document.addjoin.cupw2.value) {
				alert("비밀번호가 일치하지않습니다.");
				document.addjoin.cupw2.focus();
				exit;

			}
			document.addjoin.submit();
		}
	</script>
	<div class="container">

		<h3>this is join page</h3>
		<form action="joinProc" method="post" name="addjoin">
			<table>
				<tr>
					<td><label>아이디*</label></td>
					<td><input type="text" name="cuid" id="cuid"> <input
						type="button" id="chk_cid" onclick="javascript:chk_id()"
						value="중복확인"></td>
				</tr>
				<tr>
					<td><label>비밀번호*</label></td>
					<td><input type="text" name="cupw" id="cupw"></td>
				</tr>
				<tr>
					<td><label>비밀번호 확인*</label></td>
					<td><input type="text" name="cupw2" id="cupw2"></td>
				</tr>
				<tr>
					<td><label>이름*</label></td>
					<td><input type="text" name="cuname" id="cuname"></td>
				</tr>
				<tr>
					<td><label>성별</label></td>
					<td><input type="text" name="cugender"></td>
				</tr>
				<tr>
					<td><label>생년월일</label></td>
					<td><select name="cuyear" class="form-control">
							<option value="" selected>년도</option>
							<c:forEach begin="0" end="50" var="i">
								<c:forEach begin="99" end="99" var="j">
									<option value="${j - i }">${j - i }</option>
								</c:forEach>
							</c:forEach>
					</select> <select name="cumonth" class="form-control">
							<option value="" selected>월</option>
							<c:forEach var="i" begin="1" end="12">
								<option value="${i }">${i }</option>
							</c:forEach>
					</select> <select name="cuday" class="form-control">
							<option value="" selected>일</option>
							<c:forEach var="i" begin="1" end="31">
								<option value="${i }">${i }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><label>주소</label></td>
					<td><input type="text" name="cuaddr"></td>
				</tr>
				<tr>
					<td><label>연락처*</label></td>
					<td><input type="tel" name="cutel" id="cutel"></td>
				</tr>
				<tr>
					<td><label>이메일*</label></td>
					<td><input type="email" name="cuemail" id="cuemail"></td>
				</tr>
			</table>

		</form>
		<input type="button" value="회원가입" onclick="checkfield()"> <a
			href="login"><button>취소</button></a>
	</div>
</body>
</html>