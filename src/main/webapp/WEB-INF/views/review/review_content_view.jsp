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
		<h3>review_content_view.jsp</h3>
		<form action="review_modify" method="post" enctype="multipart/form-data">
			<input type="hidden" name="rvnum" value="${content_view.rvnum }" />
			<table class="table table-hover">
				<tr>
					<td  >제목 : </td>
					<td colspan="2"><input type="text" name="rvtitle"
						value="${content_view.rvtitle }" size="50" /></td>
				</tr>
				<tr>
					<td>${content_view.cuid }|${content_view.sbcode } </td>
					<td>${content_view.rvdate }</td>
					<td>조회수 : ${content_view.rvhit } | 번호 : ${content_view.rvnum }	</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2"><textarea name="rvcontent" rows="10">
				${content_view.rvcontent }
			</textarea></td>
				</tr>
				<tr>
					<td>사진</td>
					<td colspan="2"><a
						href="review_download?p=resources/upload/&f=${content_view.rvpic }
			&sbcode=${content_view.sbcode }">
							${content_view.rvpic }</a></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" value="modify" />
						&nbsp;&nbsp;<a href="review_list">목록보기</a> &nbsp;&nbsp;<a
						href="review_delete?rvnum=${content_view.rvnum }
				&rvgroup=${content_view.rvgroup }
				&rvstep=${content_view.rvstep }
				&rvindent=${content_view.rvindent }
				">삭제</a>
						&nbsp;&nbsp;<a
						href="review_reply_view?rvnum=${content_view.rvnum }">답변</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>