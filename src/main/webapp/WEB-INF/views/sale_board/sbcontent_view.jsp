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
		function del_sbCont() {
			var sbcode=${sbcontent_view.sbcode};
			if (${sbcontent_view.buid == session_bid}) {			
			alert("삭제가능합니다.");
		 	location.href="sbdelete?sbcode="+sbcode;			 
		}else {
			alert("상품판매자가 아닙니다.");
			}
		}; 
		
		
		function modify_sbCont() {
			var sbcode=${sbcontent_view.sbcode};
			if (${sbcontent_view.buid ==session_bid}) {			
				alert("수정가능합니다.");
			 	location.href="sbmodify?sbcode="+sbcode;	 	
			}else {
				alert("상품판매자가 아닙니다.");
				}
			}; 

	</script>
	<div class="container">
		<h3>sbcontent_view</h3>
		<div class="border-secondary">
			<table class="table">
				<tr>
					<td>작성자</td>
					<td>${sbcontent_view.buid }</td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td>${sbcontent_view.sbcode }</td>
				</tr>
				<tr>
					<td>로그인 한 유저</td>
					<td>${session_bid }${session_cid }</td>
				</tr>
				<tr>
					<td>상품 리뷰 평균</td>
					<td></td>
				</tr>

			</table>
		</div>

		<a href="review_list"> 리뷰보기</a> &nbsp;&nbsp;<a>
			href="qna_list?wid=${wid }">QnA보기</a> <br />
		<button onclick="javascript:del_sbCont()">삭제하기</button>
		&nbsp;&nbsp;
		<button onclick="javascript:modify_sbCont()">수정하기</button>

	</div>
	<!-- <div>
						<img alt="no image" src="resources/upload/git2.PNG">
</div>
 -->
</body>
</html>