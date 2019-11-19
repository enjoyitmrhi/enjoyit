<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	var msg = ${newmsg}
	if(msg != '0' ){
		alert("미확인 메세지 "+msg+"개가 있습니다.");
	}
	
	function onMsgBox() {
		var url = "message.pop";
        var name = "Applt confirm";
        var option = "width = 500, height = 700, top = 50, left = 200, location = no"
        window.open(url, name, option);
	}
	
	setInterval(function(){
		  $(".blinkEle").toggle();
		}, 500);
</script>
<style type="text/css">
.culeft{
width: 200px;
text-align: center;
}
</style>
</head>
<body>
<div class="container">

<table class ="table">
		<tr>
			<td class = "culeft">회원아이디</td>
			<td>${cu.cuid }</td>
		</tr>
		<tr>
			<td>회원명</td>
			<td>${cu.cuname }</td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td>${cu.cuaddr }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${cu.cuemail }</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${cu.cubirth }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${cu.cugender }</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${cu.cutel }</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>${cu.cudate }</td>
		</tr>
		<tr>
			<td>메세지함<c:if test="${newmsg != 0}"><a class="blinkEle" style="color: red;">new</a></c:if></td>
			<td><a href="javascript:onMsgBox()">${totmsg }개</a> <-보러가기</td>
		</tr>
		<tr>
			<td>작성한 질문수</td>
			<td><a href="myQuestion">${qnacnt }개</a> <-보러가기</td>
		</tr>
		<tr>
			<td>작성한 리뷰수</td>
			<td><a href="myReview">${rvcnt }개</a> <-보러가기</td>
		</tr>
		
	</table>
		<a href="edit_cuself?cunum=${cu.cunum }"><button>정보수정</button></a>
		<a href="ch_cupw"><button>비밀번호변경</button></a>	
		<a href="del_cuself?cunum=${cu.cunum }"><button>회원탈퇴</button></a>

</div>

</body>
</html>