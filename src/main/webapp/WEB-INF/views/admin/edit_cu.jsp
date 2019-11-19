<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container" style="align-content: center;">
		<form action="cu_editProc" method="post">
			<table class="table" style="width: 70%; height: 50%;">
				<tr>
					<th width="16%">회원번호</th>
					<td><input type="text" name="cunum" value="${cu.cunum }"
						class="form-control" readonly></td>
				</tr>
				<tr>
					<th width="16%">회원아이디</th>
					<td><input type="text" name="cuid" value="${cu.cuid }"
						class="form-control" readonly></td>
				</tr>
				<tr>
					<th width="16%">회원명</th>
					<td><input type="text" name="cuname" value="${cu.cuname }"
						class="form-control"></td>
				</tr>
				<tr>
					<th width="16%">회원주소</th>
					<td><input type="text" name="cuaddr" value="${cu.cuaddr }"
						class="form-control"></td>
				</tr>
				<tr>
					<th width="16%">이메일</th>
					<td><input type="text" name="cuemail" value="${cu.cuemail }"
						class="form-control"></td>
				</tr>
				<tr>
					<th width="16%">생년월일</th>
					<td><input type="text" name="cubirth" value="${cu.cubirth }"
						class="form-control"></td>
				</tr>
				<tr>
					<th width="16%">성별</th>
					<td><input type="text" name="cugender"
						value="${cu.cugender } " class="form-control"></td>
				</tr>
				<tr>
					<th width="16%">연락처</th>
					<td><input type="text" name="cutel" value="${cu.cutel }"
						class="form-control"></td>
				</tr>
				<tr>
					<th width="16%">가입일</th>
					<td><label>${cu.cudate }</label></td>
				</tr>
			</table>
			<input type="submit" value="정보수정" class="btn btn-outline-dark btn-sm">
			<a href="cuManagement?cunum=${cu.cunum }" role="btn"
				class="btn btn-outline-dark btn-sm">취소</a>
		</form>
	</div>
</body>
</html>