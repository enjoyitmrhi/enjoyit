<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<caption>
			<c:if test="${prev != null}">
				<a href="msg_content.pop?num=${prev }"><button> &lt;&lt; </button></a>
			</c:if>
			<c:if test="${prev == null}">
				<a><button>&lt;&lt;</button></a>
			</c:if>

			<c:if test="${next != null}">
				<a href="msg_content.pop?num=${next }"><button>&gt;&gt;</button></a>
			</c:if>
			<c:if test="${next == null}">
				<a><button>&gt;&gt;</button></a>
			</c:if>
		</caption>

		<tr>
			<th>보낸사람</th>
			<th>${content.msgfrom }</th>
		</tr>
		<tr>
			<th>제목</th>
			<th>${content.msgtitle}</th>
		</tr>
		<tr>
			<th>내용</th>
			<th>${content.msgcontent}</th>
		</tr>
		<tr>
			<th>보낸시간</th>
			<th>${content.msgdate}</th>
		</tr>
	</table>
	<a href="message.pop"><button>목록으로</button></a>
	<a href="msg_del?num=${content.msgnum }"><button>삭제</button></a>
</body>
</html>