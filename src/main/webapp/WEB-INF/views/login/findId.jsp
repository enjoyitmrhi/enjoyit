<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script language="javascript" type="text/javascript">
	function change_cuMod() {

		$('#cuType').css('display', 'block');
		$('#buType').css('display', 'none');
	};
	function change_buMod() {
		$('#cuType').css('display', 'none');
		$('#buType').css('display', 'block');
	};

	function showPopup_cu() {
		var frmPopup = document.cuPopup;
		var url = 'popup_findId';
		window.open('', 'popupView', "width=400, height=300, left=100, top=50");

		frmPopup.action = url;
		frmPopup.target = 'popupView'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
		frmPopup.submit();

	}
	function showPopup_bu() {
		var frmPopup = document.buPopup;
		var url = 'popup_findId';
		window.open('', 'popupView', "width=400, height=300, left=100, top=50");

		frmPopup.action = url;
		frmPopup.target = 'popupView'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
		frmPopup.submit();

	}
</script>
</head>
<body>


	<div class="container">
		<h3>this is findId page</h3>
		<div id="cuType">
			일반회원 <br>
			<form action="popup_chkId" name="cuPopup">
				<label>이름</label> <input type="text" name="cuname" id="cuname"><br>
				<label>연락처</label> <input type="tel" name="cutel" id="cutel"><br>
				<label>생년월일</label> <select name="cuyear" id="cuyear">
					<option value="" selected>년도</option>
					<c:forEach begin="0" end="50" var="i">
						<c:forEach begin="99" end="99" var="j">
							<option value="19${j - i }">${j - i }</option>
						</c:forEach>
					</c:forEach>
				</select> <select name="cumonth" id="cumonth">
					<option value="" selected>월</option>
					<c:forEach var="i" begin="1" end="12">
						<c:if test="${i < 10 }">
							<option value="0${i }">0${i }</option>
						</c:if>
						<c:if test="${i >= 10 }">
							<option value="${i }">${i }</option>
						</c:if>
					</c:forEach>
				</select> <select name="cuday" id="cuday">
					<option value="" selected>일</option>
					<c:forEach var="i" begin="1" end="31">
						<c:if test="${i <10}">
							<option value="0${i }">0${i }</option>
						</c:if>
						<c:if test="${i >=10 }">
							<option value="${i }">${i }</option>
						</c:if>
					</c:forEach>
				</select><br /> <input type="button" value="아이디확인" onclick="showPopup_cu();">
			</form>
		</div>

		<div id="buType" style="display: none;">
			가맹회원 <br>
			<form action="popup_chkId" name="buPopup">
				<label>사업자명</label> <input type="text" name="buname" id="buname"><br>
				<label>사업자등록번호</label> <input type="text" name="burenum"
					id="burenum"><br> <label>연락처</label> <input type="tel"
					name="butel" id="butel"><br> <input type="button"
					value="아이디확인" onclick="showPopup_bu();">
			</form>
		</div>

		<input type="radio" name="chk_id" id="cu"
			onclick="javascript:change_cuMod()" checked="checked" /> <span
			class="up">일반회원 아이디찾기</span>&nbsp;&nbsp; <input type="radio"
			name="chk_id" id="bu" onclick="javascript:change_buMod()" /> <span
			class="up">가맹회원 아이디찾기</span>
	</div>
</body>
</html>