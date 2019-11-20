<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<script type="text/javascript">
		function sendMsg() {
			location.href = "sendMsg.pop";
		}

		function closeWindow() {
			window.opener.location.reload();
			window.close();
		}
	</script>
	<div class="container">

		<table class="table">
			<tr>
				<th>선택</th>
				<th>보낸사람</th>
				<th>제목</th>
				<th>보낸시간</th>
				<th>읽음확인</th>
			</tr>
			<c:forEach items="${msg_list}" var="dto">
				<tr>
					<th><input type="radio" name="selectmsg${dto.msgnum }"
						value="${dto.msgnum }"></th>
					<th>${dto.msgfrom }</th>
					<th><a href="msg_content.pop?num=${dto.msgnum }">${dto.msgtitle }</a></th>
					<th>${dto.msgdate }</th>
					<th><c:if test="${dto.msgchk}">확인</c:if> <c:if
							test="${dto.msgchk =='false'}">미확인</c:if></th>
				</tr>
			</c:forEach>
		</table>
		<a href="javascript:sendMsg()"><button>메세지 보내기</button></a>
		<button>삭제</button>
		<a href="javascript:closeWindow()"><button>창닫기</button></a>
	</div>
</body>
</html>