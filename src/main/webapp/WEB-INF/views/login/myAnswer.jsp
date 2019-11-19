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
<div class="container">
		<table>
			<tr>
				<td>상품명</td>
				<td>제목</td>
				<td>내용</td>
				<td>질문자</td>
			</tr>
			<c:forEach items="${qnalist }" var="dto">
					<c:if test="${dto.qaindent==0 }">
					<tr>
						<td>${dto.sbproduct }</td>
						<td>${dto.qatitle }</td>
						<td><a href="qna_list?wid=${session_bid }&sbcode=${dto.sbcode}">${dto.qacontent }</a> &nbsp;&nbsp;<-문의글 확인</td>
						<td>${dto.cuid }</td>
					</tr>
					</c:if>
					<c:if test="${dto.qaindent==1 }">
					<tr>
						<td>${dto.sbproduct }</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[답변]</td>
						<td>${dto.qacontent }</td>
						<td><a href="qna_edit?num=${dto.qanum }">[수정,삭제]</a></td>
					</tr>
					</c:if>
					<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
			</c:forEach>
		</table>
		
	</div>	
</body>
</html>