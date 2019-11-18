<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c152ea050e4105950daf9c520e328d4c&libraries=services"></script>
<title>Insert title here</title>
<script type="text/javascript">
var geocoder = new daum.maps.services.Geocoder();
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
new daum.Postcode({
    oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var roadAddr = data.roadAddress; // 도로명 주소 변수
        var extraRoadAddr = ''; // 참고 항목 변수

        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraRoadAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if(extraRoadAddr !== ''){
            extraRoadAddr = ' (' + extraRoadAddr + ')';
        }

        
        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.roadAddress, function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new daum.maps.LatLng(result.y, result.x);
                
                
                document.getElementById("longy").value = result.y;
                document.getElementById("latx").value = result.x;
                
              
            }
        });
        
        
        
        
        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('sample4_postcode').value = data.zonecode;
        document.getElementById("sample4_roadAddress").value = roadAddr;
        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
        
        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
        if(roadAddr !== ''){
            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
        } else {
            document.getElementById("sample4_extraAddress").value = '';
        }

        var guideTextBox = document.getElementById("guide");
        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
        if(data.autoRoadAddress) {
            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
            guideTextBox.style.display = 'block';

        } else if(data.autoJibunAddress) {
            var expJibunAddr = data.autoJibunAddress;
            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
            guideTextBox.style.display = 'block';
        } else {
            guideTextBox.innerHTML = '';
            guideTextBox.style.display = 'none';
        }
    }
}).open();
}
</script>
</head>
<body><div id = "wrap">
	<div class="container">

		<h3>board_write_view</h3>
		<form action="board_write" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td>아이디</td>
					<td><input type="text" size="50" name="buid"
						value="${session_bid  }" readonly="readonly" class="form-control"></td>

				</tr>
				
				<tr>
					<td>제목</td>
					<td><input type="text" size="50" name="sbtitle"
						class="form-control"></td>

				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" size="50" name="sbprice"
						class="form-control"></td>

				</tr>
				<tr>
					<td>룸타입</td>
					<td><select name="sbtype" class="form-control">
					<option value="1" selected>Seminar room</option>
					<option value="2">Practice room</option>
					<option value="3">Party room</option>
					</select></td>

				</tr> 
            <tbody>
				<tr>
					<td>내용</td>
					<td><textarea rows="15" name="sbcontent"
						class="form-control"> </textarea> </td>

				</tr>
				 <tr>
					<td>사진</td>
					<td><input type="file" name="sbpic" class="form-control"></td>

				</tr>
               <tr>
                  <td><input type="text" id="sample4_postcode"
                     placeholder="우편번호"> <input type="button"
                     onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="form-control"><br>
                  </td>
               </tr>
               <tr>
                  <td><input type="text" name="addr1" id="sample4_roadAddress"
                     placeholder="도로명주소" style="width: 20%" class="form-control"> <input
                     type="text" name="addr2" id="sample4_detailAddress"
                     placeholder="상세주소" class="form-control"> <input type="text" name="addr3"
                     id="sample4_extraAddress" placeholder="참고항목" class="form-control"></td>
               </tr>
               <tr>
                  <td><input type="hidden" id="sample4_jibunAddress"
                     placeholder="지번주소" class="form-control"> <span id="guide"
                     style="color: #999; display: none"></span></td>
               </tr>
               <tr style="display: none;">
                  <th>좌표정보</th>
                  <td><input type="text" name="longy" id="longy"
                     placeholder="경도"> <input type="text" name="latx"
                     id="latx" placeholder="위도"></td>
               </tr>
 				
			</table>
			<input type="submit" value="완료">
		</form>
		<a href="board_list"> 취소</a>
	</div></div>
</body>
</html>