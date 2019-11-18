<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<script>
	function fnSubmitcForm(page) {
		document.form1.cpage.value = page;
		document.form1.submit();
	}
	function fnSubmitbForm(page) {
		document.form1.bpage.value = page;
		document.form1.submit();
	}
</script>
</head>
<body>



	<div class="container">

		<div>
			<form action="admin_buMember" name="form1" id="form1" method="post">
				<input type="hidden" name="cpage" value=""> <input
					type="hidden" name="bpage" value=""> <select
					class="form-control" name="sort" onchange="chsort()" style="width: 50%; display: inline;">
					<option>정렬방법</option>
					<c:choose>
						<c:when test="${num }">
							<option value="num" selected="selected">회원번호</option>
						</c:when>
						<c:otherwise>
							<option value="num">회원번호</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${name }">
							<option value="name" selected="selected">회원명</option>
						</c:when>
						<c:otherwise>
							<option value="name">회원명</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${date }">
							<option value="date" selected="selected">가입일</option>
						</c:when>
						<c:otherwise>
							<option value="date">가입일</option>
						</c:otherwise>
					</c:choose>
					<!-- <option value="num">회원번호</option>
					<option value="name">이름순</option>
					<option value="date">가입일</option> -->
				</select> <input type="submit" value="정렬">
			</form>
		</div>



		<br>


		<form action="del_bu" method="post">
			<h3>가맹회원 목록</h3>
			<input type="submit" value="가맹회원삭제">
			<table class="table table-striped">
				<tr class="table-dark">
					<th>선택</th>
					<th>회원번호</th>
					<th>회원아이디</th>
					<th>사업자명</th>
					<th>사업자주소</th>
					<th>이메일</th>
					<th>사업자등록번호</th>
					<th>연락처</th>
					<th>가입일</th>
				</tr>


				<c:forEach items="${blist}" var="bu">
					<tr>

						<td><input type="radio" name="buid" value="${bu.buid }"></td>

						<td>${bu.bunum}</td>
						<td><a href="buManagement?bunum=${bu.bunum}">${bu.buid }</a></td>
						<td>${bu.buname}</td>
						<td>${bu.buaddr}</td>
						<td>${bu.buemail}</td>
						<td>${bu.burenum}</td>
						<td>${bu.butel}</td>
						<td>${bu.budate}</td>
					</tr>
				</c:forEach>

			</table>
		</form>

		<!-- paging -->
		TotRow: ${bSearchVO.totRow }&nbsp; page/totPage:${bSearchVO.page }/${bSearchVO.totPage }
		<br>
		<form action="list" method="post">
			<input type="hidden" name="bpage" value="">
			<div>
				<c:if test="${bSearchVO.totPage > 1 }">
					<c:if test="${bSearchVO.page>1 }">
						<a href="admin_buMember?bpage=1">[처음]</a>
						<a href="admin_buMember?bpage=${bSearchVO.page-1 }">[이전]</a>
					</c:if>
					<c:forEach begin="${bSearchVO.pageStart }"
						end="${bSearchVO.pageEnd }" var="i">
						<c:choose>
							<c:when test="${i eq bSearchVO.page }">
								<c:out value="${i }" />
							</c:when>
							<c:otherwise>
								<%-- <a href="list?page=${i }"><c:out value="${i }" /></a> --%>
								<a href="javascript:fnSubmitbForm(${i })"><c:out
										value="${i }" /></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${bSearchVO.totPage>bSearchVO.page }">
						<a href="admin_buMember?bpage=${bSearchVO.page+1 }">[다음]</a>
						<a href="admin_buMember?bpage=${bSearchVO.totPage }">[마지막]</a>
					</c:if>
				</c:if>
			</div>

		</form>
		<div id="map" style="width: 100%; height: 350px;"></div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c152ea050e4105950daf9c520e328d4c"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.5186807, 126.9929731), // 지도의 중심좌표
			level : 9
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var events = $
		{
			events
		};
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = events;
		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}

		/* 아래와 같이도 할 수 있습니다 */
		/*
		 for (var i = 0; i < positions.length; i ++) {
		 // 마커를 생성합니다
		 var marker = new kakao.maps.Marker({
		 map: map, // 마커를 표시할 지도
		 position: positions[i].latlng // 마커의 위치
		 });

		 // 마커에 표시할 인포윈도우를 생성합니다 
		 var infowindow = new kakao.maps.InfoWindow({
		 content: positions[i].content // 인포윈도우에 표시할 내용
		 });

		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		 // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		 (function(marker, infowindow) {
		 // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		 kakao.maps.event.addListener(marker, 'mouseover', function() {
		 infowindow.open(map, marker);
		 });

		 // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		 kakao.maps.event.addListener(marker, 'mouseout', function() {
		 infowindow.close();
		 });
		 })(marker, infowindow);
		 }
		 */
	</script>
</body>
</html>