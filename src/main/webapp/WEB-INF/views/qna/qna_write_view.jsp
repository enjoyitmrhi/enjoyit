<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

	<script>
		function cancle() {
			location.href = "qna_list?sbcode=${sbcode}"
		}
	</script>
	<div class="container">

		<h3>qna_write_view</h3>
		<form action="qna_write" method="post">
			<input type="hidden" value="${sbcode}" name="sbcode">
			<table class="table table-hover">
				<tr>
					<td>아이디</td>
					<td><input type="text" size="50" name="qid"
						value="${session_bid }${session_cid }" readonly="readonly"
						class="form-control"></td>

				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" size="50" name="qtitle"
						class="form-control"></td>

				</tr>
				<tr>
					<td>선택</td>
					<td><select class="form-control">
							<option>상품을 문의합니다</option>
							<option>배송을 문의합니다</option>
					</select></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="qcontent" rows="10" class="form-control"></textarea></td>

				</tr>



			</table>
			<input type="submit" class="btn btn-outline-primary" value="완료">
			<input type="button" onclick="javascript:cancle() " value="취소"
				class="btn btn-outline-danger">
		</form>
	</div>
</body>
</html>