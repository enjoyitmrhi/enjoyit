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
						<td>위치</td>
						<td><div id="map" style="width: 60%; height: 350px;"></div></td>
					</tr>
					<tr>
						<td>상품 리뷰 평균</td>

						<td><c:set var="avg" value="${avgstar}"></c:set> <c:if
								test="${avg != null }">
								<c:choose>
									<c:when test="${avg eq '1' }">☆☆☆☆★</c:when>
									<c:when test="${avg eq '2' }">☆☆☆★★</c:when>
									<c:when test="${avg eq '3' }">☆☆★★★</c:when>
									<c:when test="${avg eq '4' }">☆★★★★</c:when>
									<c:when test="${avg eq '5' }">★★★★★</c:when>
								</c:choose>
							</c:if></td>
					</tr>

				</table>


			</div>
			<div>
				<a href="board_list" class="btn btn-outline-primary btn-sm"
					role="btn"> 목록</a> &nbsp;&nbsp; <a
					href="review_list?wid=${wid }&sbcode=${sbcontent_view.sbcode }"
					class="btn btn-outline-primary btn-sm" role="btn"> 리뷰보기</a>
				&nbsp;&nbsp;<a
					href="qna_list?wid=${wid }&sbcode=${sbcontent_view.sbcode }"
					class="btn btn-outline-primary btn-sm" role="btn">QnA보기</a>&nbsp;&nbsp;
				<a href="javascript:reserv(${sbcontent_view.sbcode})"
					class="btn btn-outline-primary btn-sm" role="btn">예약하기</a>
				<div style="float: right;">
					<c:if test="${sbcontent_view.buid == session_bid}">
						<button onclick="javascript:del_sbCont(${sbcontent_view.sbcode})"
							class="btn btn-outline-info btn-sm">삭제하기</button>
		&nbsp;&nbsp;
		<input type="submit" class="btn btn-outline-info btn-sm" value="수정하기">
					</c:if>
				</div>
			</div>
		</form>


	<div id="map" style="width:60%;height:350px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c152ea050e4105950daf9c520e328d4c"></script>
		<script>



var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(${longY}, ${latX}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
       
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: '<div>작업장 </div>', 
        latlng: new kakao.maps.LatLng(${longY}, ${latX})
    }
];

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


	</div>
</body>
</html>