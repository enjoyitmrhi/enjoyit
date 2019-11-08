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
	<script>		
		function del_sbCont() {
			var sbcode=${sbcontent_view.sbcode};
			if (${sbcontent_view.buid == session_bid}) {			
			alert("삭제가능합니다.");
		 	location.href="sbdelete?sbcode="+sbcode;			 
		}else {
			alert("상품판매자가 아닙니다.");
			}
		}; 
		
		
		function modify_sbCont() {
			var sbcode=${sbcontent_view.sbcode};
			if (${sbcontent_view.buid ==session_bid}) {			
				alert("수정가능합니다.");
			 	location.href="sbmodify?sbcode="+sbcode;	 	
			}else {
				alert("상품판매자가 아닙니다.");
				}
			}; 

	</script>
	<div class="container">
		<h3>sbcontent_view</h3>
		<div class="border-secondary">
			<table class="table">
				<tr>
					<td>작성자</td>
					<td>${sbcontent_view.buid }</td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td>${sbcontent_view.sbcode }</td>
				</tr>
				<tr>
					<td>로그인 한 유저</td>
					<td>${session_bid }${session_cid }</td>
				</tr>
				<tr>
					<td>상품 리뷰 평균</td>
					<%-- <td> ${avgstar } </td> --%>
					<td>
					<c:choose>
							<c:when test="${avgstar eq 1 }">☆☆☆☆★</c:when>
							<c:when test="${avgstar eq 2 }">☆☆☆★★</c:when>
							<c:when test="${avgstar eq 3 }">☆☆★★★</c:when>
							<c:when test="${avgstar eq 4 }">☆★★★★</c:when>
							<c:when test="${avgstar eq 5 }">★★★★★</c:when>
						</c:choose>
					</td>
				</tr>

			</table>
		</div>

		<a href="review_list"> 리뷰보기</a> &nbsp;&nbsp;<a
			href="qna_list?sbcode=${sbcontent_view.sbcode }&wid=${wid }">QnA보기</a> <br />
		<button onclick="javascript:del_sbCont()">삭제하기</button>
		&nbsp;&nbsp;
		<button onclick="javascript:modify_sbCont()">수정하기</button>

	</div>
	<!-- <div>
						<img alt="no image" src="resources/upload/git2.PNG">
</div>
 -->
 
 	
 	<div id="map" style="width:50%;height:350px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c152ea050e4105950daf9c520e328d4c"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		mapOption = { 
      		  center: new kakao.maps.LatLng(${sblong}, ${sblat}), // 지도의 중심좌표
       		 level: 3 // 지도의 확대 레벨
    		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${sblong}, ${sblat}); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
  		  position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
		</script>
 	
</body>
</html>