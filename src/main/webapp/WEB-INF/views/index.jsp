<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.carousel-item img {

width: 100%;
height: 300px;
}
#banner {
height: 300px;
}

</style>

</head>
<body>

	<div id="banner" class="carousel slide" data-ride="carousel" >
		<ol class="carousel-indicators">
			<li data-target="#banner" data-slide-to="0" class="active"></li>
			<li data-target="#banner" data-slide-to="1"></li>
			<li data-target="#banner" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- 슬라이드 1 시작-->
			<div class="carousel-item active">
				<img class="d-block img-fluid " src="resources/imgs/banner1.jpg" 
					alt="First slide">
			</div>
			<!-- 슬라이드 1 끝-->


			<!-- 슬라이드 2 시작-->
			<div class="carousel-item">
				<img class="d-block img-fluid " src="resources/imgs/banner2.jpg"
					alt="Second slide">
			</div>
			<!-- 슬라이드 2 끝-->

			<!-- 슬라이드 3 시작-->
			<div class="carousel-item">
				<img class="d-block img-fluid " src="resources/imgs/banner3.jpg"
					alt="Third slide">
			</div>
			<!-- 슬라이드 3 끝-->

		</div>
		<a class="carousel-control-prev" href="#banner" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#banner" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<div class="container">
		<h3>this is index page</h3>
		<a href="board_list">게시판 </a>




	</div>

</body>
</html>