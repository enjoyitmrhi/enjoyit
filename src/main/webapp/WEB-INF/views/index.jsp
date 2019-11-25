<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EnjoyIT</title>
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


	<div class="container">
		<div id="banner" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#banner" data-slide-to="0" class="active"></li>
				<li data-target="#banner" data-slide-to="1"></li>
				<li data-target="#banner" data-slide-to="2"></li>
				<li data-target="#banner" data-slide-to="3"></li>
				<li data-target="#banner" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- 슬라이드 1 시작-->
				<div class="carousel-item active">
					<a href="board_list_party"> <img class="d-block img-fluid "
						src="resources/imgs/banner1.jpg" alt="First slide">
					</a>
				</div>
				<!-- 슬라이드 1 끝-->



				<!-- 슬라이드 2 시작-->
				<div class="carousel-item">
					<a href="board_list_seminar"> <img class="d-block img-fluid "
						src="resources/imgs/banner2.jpg" alt="Second slide">
					</a>
				</div>
				<!-- 슬라이드 2 끝-->

				<!-- 슬라이드 3 시작-->
				<div class="carousel-item">
					<a href="board_list_practice"> <img class="d-block img-fluid "
						src="resources/imgs/banner3.png" alt="Third slide">
					</a>
				</div>
				<!-- 슬라이드 3 끝-->

				<!-- 슬라이드 4 시작-->
				<div class="carousel-item">
					<a href="board_list_party"> <img class="d-block img-fluid "
						src="resources/imgs/banner4.jpg" alt="Third slide">
					</a>
				</div>
				<!-- 슬라이드 4 끝-->

				<!-- 슬라이드 5 시작-->
				<div class="carousel-item">
					<a href="board_list_party"> <img class="d-block img-fluid "
						src="resources/imgs/banner5.jpg" alt="Third slide">
					</a>
				</div>
				<!-- 슬라이드 5 끝-->
			</div>
			<a class="carousel-control-prev" href="#banner" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#banner" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<div class="clearfix"></div>


		<div>
			<h3>조회수 순으로 보기</h3>
			<div>
				<div class="row text-center" id="more_list">
					<c:forEach items="${boardlist }" var="dto">
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<a
									href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}&sbpic=${dto.sbpic }"><img
									src="resources/upload/${dto.sbpic }" alt="no image"
									class="img-thumbnail"></a>
								<div class="caption">
									<h3>${dto.sbtitle }</h3>
									<p>가격 : ${dto.sbprice} 원</p>

								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


		</div>
		<div class="clearfix"></div>

		<div id="lowprice" class="carousel slide" data-ride="carousel">
			<h3>낮은 가격순 보기</h3>
			<ol class="carousel-indicators">
				<li data-target="#lowprice" data-slide-to="0" class="active"></li>
				<li data-target="#lowprice" data-slide-to="1"></li>
				<li data-target="#lowprice" data-slide-to="2"></li>

			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- 슬라이드 1 시작-->
				<div class="carousel-item active">
					<div>
						<div class="row text-center" id="more_list">
							<c:forEach items="${boardlist_p1 }" var="dto">
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail">
										<a
											href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}&sbpic=${dto.sbpic }"><img
											src="resources/upload/${dto.sbpic }" alt="no image"
											class="img-thumbnail"></a>
										<div class="caption">
											<h3>${dto.sbtitle }</h3>
											<p>가격 : ${dto.sbprice} 원</p>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 슬라이드 1 끝-->

				<!-- 슬라이드 2 시작-->
				<div class="carousel-item">
					<div>
						<div class="row text-center" id="more_list">
							<c:forEach items="${boardlist_p2 }" var="dto">
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail">
										<a
											href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}&sbpic=${dto.sbpic }"><img
											src="resources/upload/${dto.sbpic }" alt="no image"
											class="img-thumbnail"></a>
										<div class="caption">
											<h3>${dto.sbtitle }</h3>
											<p>가격 : ${dto.sbprice} 원</p>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 슬라이드 2 끝-->

				<!-- 슬라이드 3 시작-->
				<div class="carousel-item">
					<div>
						<div class="row text-center" id="more_list">
							<c:forEach items="${boardlist_p3 }" var="dto">
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail">
										<a
											href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}&sbpic=${dto.sbpic }"><img
											src="resources/upload/${dto.sbpic }" alt="no image"
											class="img-thumbnail"></a>
										<div class="caption">
											<h3>${dto.sbtitle }</h3>
											<p>가격 : ${dto.sbprice} 원</p>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 슬라이드 3 끝-->

			</div>
			<a class="carousel-control-prev" href="#lowprice" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#lowprice" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>

	</div>

</body>
</html>