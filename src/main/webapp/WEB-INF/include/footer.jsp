<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.hfooter {
	font-family: 'Lobster', 'cursive';
	/* position: absolute; */
	width: 100%;
	height: 15%;
	/* top: 260%; */
	clear: both;
	text-align: center;
	font-size: 15px;
}

.hfooter a {
	font-size: 85%;
	text-align: center;
	margin: 5px;
	color: white;
}

.hfooter a:hover {
	color: red;
	font-size: 100%;
}
</style>
<script type="text/javascript">
	function terms() {
		var url = "terms.pop";
		var name = "Terms of us";
		var option = "width = 500, height = 700, top = 50, left = 200, location = no"
		window.open(url, name, option);
	}
	function htu() {
		var url = "htu.pop";
		var name = "How to use";
		var option = "width = 500, height = 700, top = 50, left = 200, location = no"
		window.open(url, name, option);
	}
</script>
</head>

<body>
	<div class="clearfix"></div>
	<footer class="footer">

	<div class="container my-auto">
		<!-- <div class="copyright text-center my-auto"> -->

		<div style="width: 100%; height: 30px; background-color: gray;"
			class="hfooter">
			<a href="/enjoyit/">홈으로</a> <a href="">개인정보취급방침</a> <a  href="javascript:terms()">이용약관</a> <a
				href="javascript:htu()">이용안내</a>


			<div style="text-align: center;">
				<br> <span> Enjoy / 대표자 : ET<br>
				</span> <span> 주소 : 서울특별시 강동구 천호대로 1095 현대코아 3층<br>
				</span> <span> Tel : 02-458-2241 / Fax:02-482-9894 / 대표 E-mail :
					i9096055@naver.com <br>
				</span> <br> <span>Copyright © Enjoyit 2019 GALLERIES
					ASSOCIATION OF KOREA. ALL RIGHT RESERVED.</span> <br>
			</div>
		</div>
		<!-- 	</div> -->
	</div>
	</footer>

</body>
</html>