<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h3>review_reply_view.jsp</h3>
	<form action="review_reply" method="post">
		<input type="hidden" name="rvnum" value="${reply_view.rvnum }" /> <input
			type="hidden" name="rvgroup" value="${reply_view.rvgroup }" /> <input
			type="hidden" name="rvstep" value="${reply_view.rvstep }" /> <input
			type="hidden" name="rvindent" value="${reply_view.rvindent }" />
		<table width="500" cellpadding="0" cellspacing="0" border="1">

			<tr>
				<td colspan="2">${reply_view.rvnum }|${reply_view.bunum }</td>
			</tr>
			<tr>
				<td colspan="2">${reply_view.rvdate }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="rvtitle" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="rvcontent" rows="10">
			</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="reply" /></td>
			</tr>
		</table>
	</form>
</body>
</html>