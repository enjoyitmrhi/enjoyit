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
		<form action="review_write" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="${sbcode}" name="sbcode"> <input
				type="hidden" value="${wid}" name="wid">
			<table class="table table-hover">
				<tr>
					<td>상품 코드 : ${sbcode }</td>
					<td><input type="text" size="50" name="cuid"
						value="${session_cid }" readonly="readonly" class="form-control"></td>
				</tr>
				<tr>
					<td>${dto.rvdate }|${dto.rvnum }</td>
					<td>제목 : <input type="text" name="rvtitle"
						class="form-control" /></td>
				</tr>
				<tr>
					<td>별점</td>
					<td><select name="rvstar" id="rvstar" class="form-control"><option
								value="5" selected>★★★★★</option>
							<option value="4">★★★★</option>
							<option value="3">★★★</option>
							<option value="2">★★</option>
							<option value="1">★</option></select></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="rvcontent" rows="10" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="rvpic" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit"
						class="btn btn-outline-primary btn-sm" value="작성" />&nbsp;
						<a role = "btn" class ="btn btn-outline-danger btn-sm"  href="review_list?sbcode=${sbcode}&wid=${wid}"> 취소</a>
						</td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>