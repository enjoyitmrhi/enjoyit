<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
<script type="text/javascript">
var idchk =0;
function chk_id(){
	var userid = $('input#buid').val();
	var result;
	$.ajax({
	 	type:"POST",
		url:"chk_bid.do",
		data : {userid : userid},
        success: function(data){
        	
			 if (data == 'false') {
				alert("이미 사용중인 아이디입니다.");
			} else {
				alert("사용가능한 아이디입니다.");
				idchk=1;
			} 
        },
		error : function(data) {
			alert("fail..");
		} 
	}); 
}

function checkfield() {
	if(document.addjoin.buid.value==""){
		alert("아이디를 입력하세요");
		document.addjoin.buid.focus();
		exit;
	}else if(document.addjoin.bupw.value==""){
		alert("비밀번호를 입력하세요");
		document.addjoin.bupw.focus();
		exit;
		
	}else if(document.addjoin.bupw2.value==""){
		alert("비밀번호확인을 입력하세요");
		document.addjoin.bupw2.focus();
		exit;
		
	}else if(document.addjoin.buname.value==""){
		alert("이름을 입력하세요");
		document.addjoin.buname.focus();
		exit;
		
	}else if(document.addjoin.buaddr.value==""){
		alert("주소를 입력하세요");
		document.addjoin.buaddr.focus();
		exit;
		
	}else if(document.addjoin.burenum.value==""){
		alert("사업자등록번호를 입력하세요");
		document.addjoin.burenum.focus();
		exit;
		
	}else if(document.addjoin.butel.value==""){
		alert("연락처를 입력하세요");
		document.addjoin.butel.focus();
		exit;
		
	}else if(document.addjoin.buemail.value==""){
		alert("이메일을 입력하세요");
		document.addjoin.buemail.focus();
		exit;
	}else if(idchk == 0 ){
		alert("아이디 중복체크 바랍니다.");
		document.addjoin.chk_bid.focus();
		exit;
	}
	
	if(document.addjoin.bupw.value!=document.addjoin.bupw2.value){
		alert("비밀번호가 일치하지않습니다.");
		document.addjoin.bupw2.focus();
		exit;
	}
	document.addjoin.submit();
}
</script>
<div class="container">

	<h3>this is join page</h3>
	<form action="bJoinProc" method="post" name="addjoin">
		<label>아이디*</label> <input type="text" name="buid" id="buid"> 
		<input type="button" id="chk_bid" onclick="javascript:chk_id()" value="중복확인"><br> 
		<label>비밀번호*</label> <input type="text" name="bupw" id="bupw"><br> 
		<label>비밀번호 확인*</label> <input type="text" name="bupw2" id="bupw2"><br> 
		<label>사업자명*</label> <input type="text" name="buname" id="buname"><br> 
		<label>주소*</label> <input type="text" name="buaddr" id="buaddr"><br> 
		<label>사업자등록번호*</label> <input type="text" name="burenum" id="burenum"><br> 
		<label>연락처*</label> <input type="tel" name="butel" id="butel"><br> 
		<label>이메일*</label> <input type="email" name="buemail" id="buemail"><br> 
		<input type="button" value="회원가입" onclick="checkfield()">
	</form>
	<a href="login"><button>취소</button></a>
	</div>
</body>
</html>