<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c152ea050e4105950daf9c520e328d4c&libraries=services"></script>

<script type="text/javascript">
	var idchk = 0;
	function chk_id() {
		var userid = $('input#buid').val();
		var result;
		$.ajax({
			type : "POST",
			url : "chk_bid.do",
			data : {
				userid : userid
			},
			success : function(data) {
				if (data == 'false') {
					alert("이미 사용중인 아이디입니다.");
					idchk = 0;
				} else {
					alert("사용가능한 아이디입니다.");
					idchk = 1;
				}
			},
			error : function(data) {
				alert("fail..");
			}
		});
	}

	function checkfield() {
		if (document.addjoin.buid.value == "") {
			alert("아이디를 입력하세요");
			document.addjoin.buid.focus();
			exit;
		} else if (document.addjoin.bupw.value == "") {
			alert("비밀번호를 입력하세요");
			document.addjoin.bupw.focus();
			exit;

		} else if (document.addjoin.bupw2.value == "") {
			alert("비밀번호확인을 입력하세요");
			document.addjoin.bupw2.focus();
			exit;

		} else if (document.addjoin.buname.value == "") {
			alert("이름을 입력하세요");
			document.addjoin.buname.focus();
			exit;

		} else if (document.addjoin.sample4_postcode.value == "") {
			alert("주소를 입력하세요");
			document.addjoin.sample4_postcode.focus();
			exit;

		} else if (document.addjoin.burenum.value == "") {
			alert("사업자등록번호를 입력하세요");
			document.addjoin.burenum.focus();
			exit;

		} else if (document.addjoin.butel.value == "") {
			alert("연락처를 입력하세요");
			document.addjoin.butel.focus();
			exit;

		} else if (document.addjoin.buemail.value == "") {
			alert("이메일을 입력하세요");
			document.addjoin.buemail.focus();
			exit;
		} else if (idchk == 0) {
			alert("아이디 중복체크 바랍니다.");
			document.addjoin.chk_bid.focus();
			exit;
		}

		if (document.addjoin.bupw.value != document.addjoin.bupw2.value) {
			alert("비밀번호가 일치하지않습니다.");
			document.addjoin.bupw2.focus();
			exit;

		}
		document.addjoin.submit();
		window.close();
	}

	function close_pop() {
		window.close();

	}

	var geocoder = new daum.maps.services.Geocoder();
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 주소로 상세 정보를 검색
						geocoder
								.addressSearch(
										data.roadAddress,
										function(results, status) {
											// 정상적으로 검색이 완료됐으면
											if (status === daum.maps.services.Status.OK) {

												var result = results[0]; //첫번째 결과의 값을 활용

												// 해당 주소에 대한 좌표를 받아서
												var coords = new daum.maps.LatLng(
														result.y, result.x);

												document
														.getElementById("longy").value = result.y;
												document.getElementById("latx").value = result.x;

											}
										});

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
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
<body>
	<div class="container">

		<h3>기업 회원가입</h3>
		<form action="bJoinProc" method="post" name="addjoin">
			<table class="table">

				<tbody>
					<tr>
						<td><label><strong>아이디*</strong></label></td>
						<td><input type="text" name="buid" id="buid"></td>
						<td><input type="button" id="chk_bid"
							onclick="javascript:chk_id()" value="중복확인"></td>

					</tr>
					<tr>
						<td><label><strong>비밀번호*</strong></label></td>
						<td colspan="2"><input type="password" name="bupw" id="bupw"></td>
					</tr>
					<tr>
						<td><label><strong>비밀번호 확인*</strong></label></td>
						<td colspan="2"><input type="password" name="bupw2"
							id="bupw2"></td>
					</tr>
					<tr>
						<td><label><strong>사업자명*</strong></label></td>
						<td colspan="2"><input type="text" name="buname" id="buname"></td>
					</tr>
					<!-- <label>주소*</label> <input type="text" name="buaddr" id="buaddr"><br>  -->


					<tr>
						<td colspan="3"><input type="text" id="sample4_postcode"
							placeholder="우편번호"> <input type="button"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
					</tr>
					<tr>
						<td colspan="3"><input type="text" name="addr1"
							id="sample4_roadAddress" placeholder="도로명주소" style="width: 20%">
							<input type="text" name="addr2" id="sample4_detailAddress"
							placeholder="상세주소"> <input type="text" name="addr3"
							id="sample4_extraAddress" placeholder="참고항목"></td>
					</tr>
					<tr>
						<td><input type="hidden" id="sample4_jibunAddress"
							placeholder="지번주소"> <span id="guide"
							style="color: #999; display: none"></span></td>
					</tr>
					<tr style="display: none;">
						<th>좌표정보</th>
						<td><input type="text" name="longy" id="longy"
							placeholder="경도"> <input type="text" name="latx"
							id="latx" placeholder="위도"></td>
					</tr>
				</tbody>

				<tr>
					<td><label><strong>사업자등록번호*</strong></label></td>
					<td colspan="2"><input type="text" name="burenum" id="burenum"></td>
				</tr>
				<tr>
					<td><label><strong>연락처*</strong></label></td>
					<td colspan="2"><input type="tel" name="butel" id="butel"></td>
				</tr>
				<tr>
					<td><label><strong>이메일*</strong></label></td>
					<td colspan="2"><input type="email" name="buemail"
						id="buemail"></td>
				</tr>
			</table>

		</form>
		<input type="button" value="회원가입" onclick="checkfield()"> <a
			href="javascript:close_pop()"><button>취소</button></a>
	</div>
</body>
</html>