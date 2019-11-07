<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body><div id = "wrap">
	<div class="container">

		<h3>board_write_view</h3>
		<form action="board_write" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td>아이디</td>
					<td><input type="text" size="50" name="buid"
						value="${session_bid  }" readonly="readonly" class="form-control"></td>

				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="sbpic" class="form-control"></td>

				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" size="50" name="sbtitle"
						class="form-control"></td>

				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" size="50" name="sbprice"
						class="form-control"></td>

				</tr>
				<tr>
					<td>위치</td>
					<td><input type="text" size="50" name="sbloc"
						class="form-control"></td>

				</tr>



			</table>
			<input type="submit" value="완료">
		</form>
		<a href="board_list"> 취소</a>
	</div></div>
</body>
</html>