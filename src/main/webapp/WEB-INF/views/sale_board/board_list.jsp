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
	<!-- <script >
function moreList(){
    $.ajax({
        url :"",
        type :"POST",
        cache : false,
        dataType:'json',
        data :"""
        success :function(data){
            //console.log(data);
            var content="";
            for(var i=0; i<data.hashMapList.length; i++){
                content +=
                "<tr>"+
                    "<td>"+data.hashMapList[i].area+"</td>"+
                    "<td>"+data.hashMapList[i].name+"</td>"+
                    "<td>"+data.hashMapList[i].gubun+"</td>"+
                    "<td>"+data.hashMapList[i].cnt+"</td>"+
                "</tr>";
            }
            content+="<div class='btns'><a href='javascript:moreList();' class='btn'>더보기</a></div> ";
            $(content).appendTo("#addplus");
        }, error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
    });
};
</script> -->


	<br>

	<div id="wrap">
		<div class="container">
			<%-- 	<table class="table table-hover">

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
							alt="no image" src="resources/upload/${dto.sbpic }" width="80px"
							height="80px"></a></td>
					<td>${dto.buid}</td>
					<td>${dto.sbloc}</td>
					<td>${dto.sbprice}</td>
					<td>${dto.sbdate }</td>

				</tr>
			</c:forEach>
		</table> --%>



			<div class="row" id="addplus">
				<c:set var="endlist" value="6"></c:set>


				<c:forEach items="${boardlist }" var="dto" begin="1"
					end="${endlist}">
				<%-- 	<c:if test="${ dto <= endlist}"> --%>
				<!--  dto에 데이터의 총 개수 길이를 구하고 dto.length 만큼 돌아가게 구현하면 될듯?-->

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

				<%-- 	</c:if> --%>
				</c:forEach>

		

				<!-- 게시물의 갯수가 6개 이상이면 안나오고, 더보기를 눌러야 나오게 하려고 함 -->
				<div class="btns">
					<a href="javascript:moreList();" class="btn btn-primary">더보기</a>
				</div>

			</div>

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