<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container">

		<h3>this is join page</h3>
		<form action="joinProc" method="post">
			<label>아이디</label> <input type="text" name="cuid"> <input
				type="button" value="중복확인"><br> <label>비밀번호</label> <input
				type="text" name="cupw"><br> <label>비밀번호 확인</label> <input
				type="text" name="cupw2"><br> <label>이름</label> <input
				type="text" name="cuname"><br> <label>성별</label> <input
				type="text" name="cugender"><br> <label>생년월일</label> <select
				name="cuyear">
				<option value="" selected>년도</option>
				<option value="97">97</option>
				<option value="96">96</option>
				<option value="95">95</option>
				<option value="94">94</option>
				<option value="93">93</option>
				<option value="92">92</option>
				<option value="91">91</option>
				<option value="90">90</option>
				<option value="89">89</option>
				<option value="88">88</option>
				<option value="87">87</option>
				<option value="86">86</option>
				<option value="85">85</option>
				<option value="84">84</option>
				<option value="83">83</option>
				<option value="82">82</option>
				<option value="81">81</option>
				<option value="80">80</option>
			</select> <select name="cumonth">
				<option value="" selected>월</option>
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>

			</select> <select name="cuday">
				<option value="" selected>일</option>
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>

			</select><br> <label>주소</label> <input type="text" name="cuaddr"><br>
			<label>연락처</label> <input type="tel" name="cutel"><br> <label>이메일</label>
			<input type="email" name="cuemail"><br> <input
				type="submit" value="회원가입"> <input type="button" value="취소">
		</form>
	</div>
</body>

</html>