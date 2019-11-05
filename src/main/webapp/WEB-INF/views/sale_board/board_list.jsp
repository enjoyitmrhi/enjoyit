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
		var list = [];
		$.ajax({
			type : "post",
			url : "/board_list.do",
			data : $('#searchTxtForm').serialize(),
			success : function(result) {
				$.each(list,result)
				console.log(list.sbcode);
			},
			error : function() {
				alert("시스템 오류입니다."); // 실패 시 처리
			}
		});
	}
	/* function getMoreList(list){
	
	 var content = "";
	 var length = list.length;
	 for(i=0; i<list.length; i++){
	 var resultVO = list[i];
	 if(resultVO.title != ''){
	 content += "<tr>";
	 content += "<td>"+resultVO.sbcode+"</td>";
	 content += "<td>"+resultVO.sbtitle+"</td>";
	 content += "<td>"+resultVO.sbpic+"</td>";
	 content += "<td>"+resultVO.buid+"</td>";
	 content += "<td>"+resultVO.sbloc+"</td>";
	 content += "<td>"+resultVO.sbprice+"</td>";
	 content += "<td>"+resultVO.sbdate+"</td>";
	
	
	 content += "</tr>";
	
	 }
	 }
	 $("#more_list tr:last").after(content); 
	 // id가 more_list 인 tr의 마지막에 content 값을 추가함
	 } */
</script>

</head>
<body>


	<br>


	<div id="wrap">
		<div class="container">
			<form id="searchTxtForm">
				<input type="hidden" name="viewCount" id="viewCount" value="0">
				<input type="hidden" name="startCount" id="startCount" value="0">



				<div class="tableList">


					<table id="more_list" class="table table-hover">

						<tr class="table-active">
							<td>SBCODE</td>
							<td>SBTITLE</td>
							<td>SBPIC</td>
							<td>BUID</td>
							<td>SBLOC</td>
							<td>SBPRICE</td>
							<td>Writing DATE</td>

						</tr>
						<c:forEach items="${boardlist }" var="dto">
							<tr>

								<td>${dto.sbcode }</td>
								<td>${dto.sbtitle }</td>
								<td><a
									href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}&sbpic=${dto.sbpic }"><img
										alt="no image" src="resources/upload/${dto.sbpic }"
										width="80px" height="80px"></a></td>
								<td>${dto.buid}</td>
								<td>${dto.sbloc}</td>
								<td>${dto.sbprice}</td>
								<td>${dto.sbdate }</td>

							</tr>
						</c:forEach>
					</table>

					<div id="more_btn_div" align="center">
						<c:set var="endlist" value="6"></c:set>
						<hr>
						<a id="more_btn_a" href="javascript:moreContent(${endlist }+6);">
							더보기(More) </a>
						<hr>
					</div>
				</div>
			</form>



			<%-- 	<div class="row" id="addplus">
				<c:set var="endlist" value="6"></c:set>


				<c:forEach items="${boardlist }" var="dto" begin="1"
					end="${endlist}">

					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<a
								href="sbcontent_view?wid=${dto.buid}&sbcode=${dto.sbcode}&sbpic=${dto.sbpic }"><img
								src="resources/upload/${dto.sbpic }" alt="no image"
								width="200px" height="200px"></a>
							<div class="caption">
								<h3>제목 : ${dto.sbtitle }</h3>
								<p>가격 : ${dto.sbprice}</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">예약하기</a> <a
										href="#" class="btn btn-default" role="button">리뷰보기</a>
								</p>
							</div>
						</div>
					</div>

				</c:forEach>



				<!-- 게시물의 갯수가 6개 이상이면 안나오고, 더보기를 눌러야 나오게 하려고 함 -->
				<div class="btns">
					<a href="javascript:moreList();" class="btn btn-primary">더보기</a>
				</div>

			</div> --%>

			<c:if test="${session_bid != null}">
				<a href="board_write_view?buid=${session_bid }">writing!!</a>

			</c:if>
			<c:if test="${session_bid == null}">

				<a>writing!! only for business</a>
			</c:if>




		</div>


	</div>
</body>
</html>