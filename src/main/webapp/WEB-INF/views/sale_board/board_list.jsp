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
	<br>
	<div class="container">
	<%-- 	<table class="table table-hover">

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
						href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}&sbpic=${dto.sbpic }"><img
							alt="no image" src="resources/upload/${dto.sbpic }" width="80px"
							height="80px"></a></td>
					<td>${dto.buid}</td>
					<td>${dto.sbloc}</td>
					<td>${dto.sbprice}</td>
					<td>${dto.sbdate }</td>

				</tr>
			</c:forEach>
		</table> --%>


		
		<div class="row">
		<c:forEach items="${boardlist }" var="dto">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<a
						href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}&sbpic=${dto.sbpic }"><img src="resources/upload/${dto.sbpic }" alt="no image"  width="200px"
							height="200px"></a>
					<div class="caption">
						<h3>제목 : ${dto.sbtitle }</h3>
						<p>가격 : ${dto.sbprice}</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>

		<c:if test="${session_bid != null}">
			<a href="board_write_view?buid=${session_bid }">writing!!</a>

		</c:if>
		<c:if test="${session_bid == null}">

			<a>writing!! only for business</a>
		</c:if>




	</div>



</body>
</html>