<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function del_sbCont() {
		var sbcode = $
		{
			sbcontent_view.sbcode
		}
		;
		location.href = "sbdelete?sbcode=" + sbcode;

	};
</script>
</head>
<body>

	<div class="container">
		<h3>sbcontent_view</h3>
		<form action="sbmodify" method="post" enctype="multipart/form-data">
			<input type="hidden" name="sbcode" value="${sbcontent_view.sbcode }">
			<div class="border-secondary">
				<table class="table">
					<tr>
						<td>작성자</td>
						<td>${sbcontent_view.buid }</td>
					</tr>
					<tr>
						<td>상품코드</td>
						<!-- 나중에 지울 td -->
						<td>${sbcontent_view.sbcode }</td>
					</tr>
					<tr>
						<td>로그인 한 유저</td>
						<!-- 나중에 지울 td -->
						<td>${session_bid }${session_cid }</td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input class="form-control" name="sbprice" id="sbprice"
							value="${sbcontent_view.sbprice }"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input class="form-control" name="sbtitle" id="sbtitle"
							value="${sbcontent_view.sbtitle }"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><img class="w-75 p-3" alt="no image"
							src="resources/upload/${sbcontent_view.sbpic }"> <br /> <textarea
								class="form-control" rows="15" name="sbcontent" id="sbcontent"> ${sbcontent_view.sbcontent } </textarea></td>
					</tr>
					<tr>
						<td>상품 리뷰 평균</td>
						<td><c:set var="avg" value="${avgstar}"></c:set> 
						<c:if test="${avg != null }">
								<c:choose>
									<c:when test="${avg ge '1' and avg lt '2' }">★</c:when>
									<c:when test="${avg ge '2' and avg lt '3' }">★★</c:when>
									<c:when test="${avg ge '3' and avg lt '4' }">★★★</c:when>
									<c:when test="${avg ge '4' and avg lt '5' }">★★★★</c:when>
									<c:when test="${avg eq '5' }">★★★★★</c:when>
								</c:choose>
							</c:if></td>
					</tr>
				</table>
			</div>
			<a href="board_list"> 목록</a> &nbsp;&nbsp; <a href="review_list?wid=${wid }&sbcode=${sbcontent_view.sbcode }">
				리뷰보기</a> &nbsp;&nbsp;<a
				href="qna_list?wid=${wid }&sbcode=${sbcontent_view.sbcode }">QnA보기</a>
			<br />
			<c:if test="${sbcontent_view.buid == session_bid}">
				<button onclick="javascript:del_sbCont()">삭제하기</button>
		&nbsp;&nbsp;
		<input type="submit" value="수정하기">
			</c:if>
		</form>





		<div id="map" style="width: 50%; height: 350px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c152ea050e4105950daf9c520e328d4c"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);
		</script>
	</div>

</body>
</html>