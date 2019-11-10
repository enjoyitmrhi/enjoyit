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
<h3>this is buMypage</h3>
<table>
		<tr>
			<td>회원아이디</td>
			<td>${bu.buid }</td>
		</tr>
		<tr>
			<td>사업자명</td>
			<td>${bu.buname }</td>
		</tr>
		<tr>
			<td>사업자주소</td>
			<td>${bu.buaddr }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${bu.buemail }</td>
		</tr>
		<tr>
			<td>사업자등록번호</td>
			<td>${bu.burenum }</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${bu.butel }</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>${bu.budate }</td>
		</tr>
		<tr>
			<td>문의한 글</td>
			<td><a href="myAnswer">${qnacnt }개</a> <-보러가기</td>
		</tr>
		<tr>
			<td>달린 리뷰</td>
			<td><a href="myreply">${rvcnt }개</a> <-보러가기</td>
		</tr>
	</table>
	<a href="edit_buself?bunum=${bu.bunum }"><button>정보수정</button></a>
	<a href="ch_bupw"><button>비밀번호변경</button></a>
	<a href="del_buself?bunum=${bu.bunum }"><button>회원탈퇴</button></a>
	</div>
</body>
</html>