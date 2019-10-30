<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<script>		
		function del_auth() {
		var delnum=${num};
		if (${content_view.cuid == session_cid}) {			
			alert("삭제가능합니다.");
		 	location.href="qnadelete?num="+delnum;			 
		}else {
			alert("권한이 없습니다.");
			}
		}; 
		function modify_auth() {
			if (${content_view.cuid ==session_cid}) {			
				alert("수정가능합니다.");
			 	location.href="qnamodify?num="+delnum;	 	
			}else {
				alert("권한이 없습니다.");
				}
			}; 
		function reply_auth() {
			if (${wid == session_bid}) {			
				alert("답글가능합니다.");
			 	location.href="qnaanswerview?num="+delnum;	 	
			}else {
				alert("상품판매자가 아닙니다.");
				}
			};
	</script>
	<div class="container">
	<h3>content_view</h3>
	상품판매자 :${wid }
	<form action="qnaanswerview" method="post">
		<input type="hidden" name="num" value="${num }">
		<table class="table table-hover">
			<tr>
				<td>글번호</td>
				<td>${num }</td>

			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" rows="10" name="content">${content_view.qacontent }</textarea>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${content_view.cuid }</td>
			</tr>

		</table>
		<button onclick="javascript:reply_auth()">답글달기</button>
		<input type="submit" style="display: none;">

	</form>
	<a href="qna_list"> 목록가기</a>
	<button onclick="javascript:del_auth()">삭제하기</button>
	&nbsp;&nbsp;
	<button onclick="javascript:modify_auth()">수정하기</button>
	</div>
</body>
</html>