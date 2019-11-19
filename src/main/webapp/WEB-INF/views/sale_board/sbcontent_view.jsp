<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<script>
	function del_sbCont(sbcode) {
		/* var sbcode = $
		{
			sbcontent_view.sbcode
		}
		; */
		location.href = "sbdelete?sbcode=" + sbcode;
	};
	
	 function reserv(sbcode){
         var url = "reservation.pop?sbcode="+ sbcode;
         var name = "reserv apply";
         var option = "width = 500, height = 700, top = 50, left = 200, location = no"
         window.open(url, name, option);
     }
</script>


</head>
<body>

	<div class="container">
		<h3>sbcontent_view</h3>
		<form action="sbmodify_view" method="post">
			<input type="hidden" name="sbcode" value="${sbcontent_view.sbcode }">
			<input type="hidden" name="sbtype" value="${sbcontent_view.sbtype}">
			<div class="border-secondary">
				<table class="table">
					<tr>
						<td>작성자</td>
						<td>${writer }</td>
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
						<td>위치</td>
						<td><div id="map" style="width: 60%; height: 350px;"></div></td>
					</tr>
					<tr>
						<td>상품 리뷰 평균</td>
						<td><c:set var="avg" value="${avgstar}"></c:set> <c:if
								test="${avg != null }">
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
			<div>
				<c:if test="${sbcontent_view.sbtype ==1}">
				<a href="board_list_seminar" class="btn btn-outline-primary btn-sm"
					role="btn"> 목록</a></c:if>
				<c:if test="${sbcontent_view.sbtype ==2}">
				<a href="board_list_practice" class="btn btn-outline-primary btn-sm"
					role="btn"> 목록</a></c:if>
				<c:if test="${sbcontent_view.sbtype ==3}">
				<a href="board_list_party" class="btn btn-outline-primary btn-sm"
					role="btn"> 목록</a></c:if>
				 &nbsp;&nbsp; <a
					href="review_list?wid=${wid }&sbcode=${sbcontent_view.sbcode }"
					class="btn btn-outline-primary btn-sm" role="btn"> 리뷰보기</a>
				&nbsp;&nbsp;<a
					href="qna_list?wid=${wid }&sbcode=${sbcontent_view.sbcode }"
					class="btn btn-outline-primary btn-sm" role="btn">QnA보기</a>&nbsp;&nbsp;
				<c:if test="${session_cid != null }">
					<a href="javascript:reserv(${sbcontent_view.sbcode})"
						class="btn btn-outline-primary btn-sm" role="btn">예약하기</a>
				</c:if>
				<div style="float: right;">
					<c:if test="${sbcontent_view.buid == session_bid}">


						<input type="submit" class="btn btn-outline-info btn-sm"
							value="수정페이지">
					</c:if>
				</div>
			</div>
		</form>


		<div id="map" style="width: 60%; height: 350px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c152ea050e4105950daf9c520e328d4c"></script>
		<script>



var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(${sbcontent_view.sblongitude }, ${sbcontent_view.sblatitude }), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
       
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var loc = '<div>'+$('#sbtitle')+'</div>';
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: loc, 
        latlng: new kakao.maps.LatLng(${sbcontent_view.sblongitude }, ${sbcontent_view.sblatitude })
    }];

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

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
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
 

</script>


	</div>
</body>
</html>