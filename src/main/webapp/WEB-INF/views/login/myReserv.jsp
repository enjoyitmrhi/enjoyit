<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function onSchedule(rtnum) {
		var url = "onSchedule.pop?rtnum="+ rtnum;
        var name = "Applt confirm";
        var option = "width = 500, height = 700, top = 50, left = 200, location = no"
        window.open(url, name, option);
	}

</script>
</head>
<body>
<div class="container">
		<table>
			<tr>
				<th>예약번호&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>상품명&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>예약자명&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>예약시작일&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>종료일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>일정보기</th>
			</tr>
			<c:forEach items="${rtlist }" var="dto">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						${dto.rtnum }</td>
						<td>${dto.sbtitle }</td>
						<td>${dto.cuid }</td>
						<td>${dto.rtsdate }</td>
						<td>${dto.rtedate }</td>
						<td><button onclick="onSchedule(${dto.rtnum })">일정보기</button></td>	
					</tr>
					<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
			</c:forEach>
		</table>
		
	</div>	
</body>
</html>