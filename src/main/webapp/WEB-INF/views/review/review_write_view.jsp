<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h3>review_write_view.jsp</h3>
	<form action="review_write" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td colspan="2">${dto.sbcode }|${dto.cuid }</td>
			</tr>
			<tr>
				<td>${dto.rvdate }|${dto.rvnum }</td>
				<th><input type="text" name="rvtitle" /></th>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="rvcontent" rows="10"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="rvpic" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="write" />&nbsp;&nbsp;
					<a href="review_list">목록보기</a></td>
			</tr>
		</table>
	</form>

</body>
</html>