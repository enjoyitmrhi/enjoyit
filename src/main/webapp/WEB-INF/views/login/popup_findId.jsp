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
<c:if test="${cuid != null || buid != null}">
귀하의 아이디는 
</c:if>
<c:if test="${cuid != null }">
<c:forEach items="${cuid}" var="cu">
   <label>${cu.cuid}</label>
</c:forEach>
</c:if>
<c:if test="${buid != null }">
<c:forEach items="${buid}" var="bu">
   <label>${bu.buid}</label>
</c:forEach>
</c:if>
<c:if test="${cuid != null || buid != null}">
입니다.
</c:if>
</body>
</html>