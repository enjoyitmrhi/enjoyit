<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/include/header.jsp"%>

</head>
<body>
	<br>
	<div class="container">
		<table class="table table-hover">

			<tr class="table-active">
				<td>SBCODE</td>
				<td>SBTITLE</td>
				<td>SBPIC</td>
				<td>BUID</td>
				<td>SBLOC</td>
				<td>SBPRICE</td>
				<td>Writing DATE</td>

			</tr>
			<c:forEach items="${boardlist }" var="dto">
				<tr>

					<td>${dto.sbcode }</td>
					<td>${dto.sbtitle }</td>
					<td><a
						href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}">${dto.sbpic }</a>
						<img alt="no image" src="resources/upload/${dto.sbpic }">
						</td>
					<td>${dto.buid}</td>
					<td>${dto.sbloc}</td>
					<td>${dto.sbprice}</td>
					<td>${dto.sbdate }</td>

				</tr>
			</c:forEach>


			<c:if test="${session_bid != null}">
				<tr>
					<td colspan="7"><a
						href="board_write_view?buid=${session_bid }">writing!!</a></td>
				</tr>
			</c:if>
			<c:if test="${session_bid == null}">
				<tr>
					<td colspan="7"><a>writing!! only for business</a></td>
				</tr>
			</c:if>

		</table>


	</div>



</body>
</html>