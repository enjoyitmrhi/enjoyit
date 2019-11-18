<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function moreContent() {

		$.ajax({
			type : "get",
			url : "add_list2",
			data : $("#searchTxtForm").serialize(),
			success : function(result) {

				renderMoreContents(result);
				getNumber();

			},
			error : function() {
				alert("시스템 오류입니다."); // 실패 시 처리
			}
		});
	}
	function getNumber() {
		var num = $("#num").val() - 0; // -0을 하지 않으면 문자로 인식하기 때문에 일부로 붙였다.
		num = num + 4;
		$("#num").val(num);
		return num

	}

	
	function renderMoreContents(list) {
		var rows = [];
		$.each(list, function(index, item) {
			rows.push(getRowContentByData(item));
		})

		$("#more_list").append(rows.join(""));
	}

	function getRowContentByData(item) {
		var content = "";
		content += "<div class='col-sm-8 col-md-6'>";
		content += "<div class='thumbnail'>";
		content += "<a href='sbcontent_view?wid="
				+ item.buid
				+ "&sbcode="
				+ item.sbcode
				+ "&sbpic="
				+ item.sbpic
				+ "'><img  alt='no image' src='resources/upload/"+ item.sbpic  + "' width='200px' height='200px'></a>";

		content += "<div class='caption'>";

		content += "<h3>제목 : " + item.sbtitle + " </h3>";

		content += "<p>가격 : " + item.sbprice + "</p>";

		content += "</div>";
		content += "</div>";
		content += "</div>";
		return content
	}
</script>

</head>

<body>


	<br>


	<div id="wrap">
		<div class="container">
			<form id="searchTxtForm">

				<input type="hidden" name="num" id="num" value="4">

			</form>



			<div>
				<div class="row text-center" id="more_list">
					<c:forEach items="${boardlist }" var="dto">
						<div class="col-sm-8 col-md-6">
							<div class="thumbnail">
								<a
									href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}&sbpic=${dto.sbpic }"><img
									src="resources/upload/${dto.sbpic }" alt="no image"
									class="img-thumbnail"></a>
								<div class="caption">
									<h3>제목 : ${dto.sbtitle }</h3>
									<p>가격 : ${dto.sbprice}</p>
								
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div id="more_btn_div" align="center">

				<hr>
				<a id="more_btn_a" href="javascript:moreContent();"> 더보기(More) </a>
				<hr>
			</div>




			<c:if test="${session_bid != null}">
				<a href="board_write_view?buid=${session_bid }">writing!!</a>

			</c:if>
			<c:if test="${session_bid == null}">

				<a>writing!! only for business</a>
			</c:if>




		</div>
		<!-- end container -->

	</div>
	<!-- end wrap -->

	
</body>

</html>