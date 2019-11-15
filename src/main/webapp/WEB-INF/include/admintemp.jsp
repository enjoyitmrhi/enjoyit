<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제목</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<c:url value= "/resources/bootstrap/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value= "/resources/bootstrap/css/bootstrap.min.css" />">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</head>
<body>

	<div>
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="main">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	
	
	
	<script type="text/javascript">
		$(function() {

		});
	</script>

</body>
</html>
