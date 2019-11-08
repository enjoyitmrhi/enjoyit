<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <link rel="stylesheet"	href="<c:url value= "/resources/bootstrap/css/bootstrap.css" />">  
<link rel="stylesheet"	href="<c:url value= "/resources/bootstrap/css/bootstrap.min.css" />"> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
 
 
 
 
 
</head> 
<body> 
 
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary"> <a 
		class="navbar-brand" href="index">Enjoy_IT</a> 
	<button class="navbar-toggler" type="button" data-toggle="collapse" 
		data-target="#navbarColor01" aria-controls="navbarColor01" 
		aria-expanded="false" aria-label="Toggle navigation"> 
		<span class="navbar-toggler-icon"></span> 
	</button> 
 
	<div class="collapse navbar-collapse" id="navbarColor01"> 
		<ul class="navbar-nav mr-auto"> 
			<li class="nav-item active"><a class="nav-link" href="#">Home 
					<span class="sr-only">(current)</span> 
			</a></li> 
			<li class="nav-item"><a class="nav-link" href="#">Features</a></li> 
			<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li> 
			<li class="nav-item"><a class="nav-link" href="#">About</a></li> 
		</ul> 
 
		<c:if test="${session_cid !=null }"> 
			<form class="form-inline my-2 my-lg-0" action="cuMypage"> 
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">MyPage</button> 
			</form> 
		</c:if> 
		<c:if test="${session_bid !=null }"> 
			<form class="form-inline my-2 my-lg-0" action="buMypage"> 
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">MyPage</button> 
			</form> 
		</c:if> 
		&nbsp;&nbsp; 
		<c:if test="${session_bid != null || session_cid != null  }"> 
			<form class="form-inline my-2 my-lg-0" action="logout"> 
 
				<button class="btn btn-secondary" type="submit">Logout</button> 
 
			</form> 
 
 
		</c:if> 
		<c:if test="${session_bid == null && session_cid == null  }"> 
			<form class="form-inline my-2 my-lg-0" action="login"> 
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Sign in</button> 
			</form> 
					&nbsp;&nbsp; 
			 
			 
				<form> 
				<div class="btn-group" role="group" 
					aria-label="Button group with nested dropdown"> 
					<button type="button" class="btn btn-secondary my-2 my-sm-0">Sign up</button> 
					<div class="btn-group" role="group"> 
						<button id="btnGroupDrop1" type="button" 
							class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" 
							aria-haspopup="true" aria-expanded="false"></button> 
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> 
							<a class="dropdown-item" href="join">고객회원가입</a> <a 
								class="dropdown-item" href="bJoin">기업회원가입</a> 
						</div> 
					</div> 
				</div> 
			</form> 
 
 
 
 
 
		</c:if> 
 
	</div> 
	</nav> 
	<br /> 
</body> 
</html>