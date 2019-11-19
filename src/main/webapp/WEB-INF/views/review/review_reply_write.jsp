<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h3>reply_write.jsp</h3>
	<form action="review_reply" method="post">
			<input type="hidden" name="buid" value="${reply_write.buid }" />
			<input type="hidden" name="sbcode" value="${sbcode }" />
			<input type="hidden" name="rvgroup" value="${reply_write.rvgroup }" />
			<input type="hidden" name="rvstep" value="${reply_write.rvstep }" />
			<input type="hidden" name="rvindent" value="${reply_write.rvindent }" />
		<table border="1">
			<tr>
				<td>${reply_write.buid }</td>
				<td><input type="text" name="rvdate"
					value="${reply_write.rvdate}" /></td>
			</tr>
			<tr>
				<td colspan="2"><textarea type="text" name="rvcontent"
						rows="10" >${reply_write.rvcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="reply" /></td>
			</tr>
		</table>
	</form>
</body>
</html>