<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container">

		<h3>qna_write_view</h3>
		<form action="qna_write" method="post">
			<input type="hidden" value="${sbcode}" name="sbcode">
			<input type="hidden" value="${wid}" name="wid">
			<table class="table table-hover">
				<tr>
					<td>아이디</td>
					<td><input type="text" size="50" name="qid"
						value="${session_cid }" readonly="readonly"
						class="form-control"></td>

				</tr>
				
				<tr>
					<td>제목</td>
					<td><select class="form-control" name="qtitle">
							<option>상품을 문의합니다</option>
							<option>배송을 문의합니다</option>
					</select></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="qcontent" rows="10" class="form-control"></textarea></td>

				</tr>



			</table>
			<input type="submit" class="btn btn-outline-primary btn-sm" value="완료">
			<a role = "btn" class = "btn btn-outline-warning btn-sm" href="qna_list?sbcode=${sbcode}&wid=${wid}">취소</a>
			
		</form>
	</div>
</body>
</html>