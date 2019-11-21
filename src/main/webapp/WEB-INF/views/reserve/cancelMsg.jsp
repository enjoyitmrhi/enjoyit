<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function closeWindow() { 
	 document.form1.submit();
	 window.opener.location = "myReserv";
	 window.close();  
}
</script>
</head>
<body>
<div class ="container">
	<form action="send.do"name="form1">
	<table>
		<tr>
			<th>title</th>
			<th><input type="text" name="title"></th>
		</tr>
		<tr>
			<th>from</th>
			<th><input type="text" name="from" value="${session_bname}" readonly></th>
		</tr>
		<tr>
			<th>to</th>
			<th><input type="text" name="to" value="${cuid }"></th>
		</tr>
		<tr>
			<th>content</th>
			<th><textarea rows="10" cols="20" name="content"></textarea></th>
		</tr>
		<tr><th colspan="2"><input type="button" onclick="closeWindow()" value="전송"></th></tr>
	</table>
	</form>
</div>
</body>
</html> 