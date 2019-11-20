<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#chpw2').blur(function() {
			if ($('#chpw').val() != $(this).val()) {
				$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
				$('#pw2_check').css('color', 'red');
			} else {
				$('#pw2_check').text('');
			}
		});
	});
	
	function chk_pw() {
		if ($('#chpw').val() != $('#chpw2').val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
			$('#pw2_check').css('color', 'red');
			
		} else {
			$('#pw2_check').text('');
			document.form1.submit();
		}
	}
	
	</script>
	<div class="container">

		<h2>${session_bid }님비밀번호변경</h2>
		<form action="ch_bupwProc" method="post" name="form1">
			<table class="table" style="width: 50%;">
				<tr>
					<td>기존 비밀번호를 입력해주세요</td>
					<td><input type="password" name="bupw" class="form-control" /></td>
				</tr>
				<tr>
					<td>변경할 비밀번호를 입력해주세요</td>
					<td><input type="password" name="chpw" id="chpw"
						class="form-control" /></td>
				</tr>
				<tr>
					<td>비밀번호 재확인<br/><a id="pw2_check"></a></td>
					<td><input type="password" name="chpw2" id="chpw2"
						class="form-control" /></td>
				</tr>

			</table>

			<div id="pw2_check"></div>
			<input type="submit" value="변경">
		</form>
	</div>

</body>
</html>