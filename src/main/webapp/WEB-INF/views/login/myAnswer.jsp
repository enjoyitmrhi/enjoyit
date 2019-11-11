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
<h3>this is my Answer</h3>
		<table>
			<tr>
				<td>상품명</td>
				<td>질문자</td>
				<td>제목</td>
				<td>내용</td>
			</tr>
			<c:forEach items="${qnalist }" var="dto">
					<tr>
						<td>${dto.sbproduct }</td>
						<td>${dto.sbname }</td>
						<td><a href="qna_list?wid=${dto.sbproduct }&sbcode=${dto.sbcode }">${dto.qatitle }</a></td>
						<td>${dto.qacontent }</td>
					</tr>
			</c:forEach>
		</table>
		
	</div>	
</body>
</html>