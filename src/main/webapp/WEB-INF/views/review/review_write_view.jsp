<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/include/header.jsp"%>

</head>
<body>
	<h3>write_view.jsp</h3>
	<table>
		<form action="review_write" method="post"
			enctype="multipart/form-data">
			<tr>
				<td class="left">이름</td>
				<td>${dto.cuid }</td>
			</tr>
			<tr>
				<td class="left">제목</td>
				<td><select name="rvtitle">
						<option value="배송 빨라요!">배송 빨라요!</option>
						<option value="아주 좋아요!">아주 좋아요!</option>
						<option value="예뻐요 잘쓸게요~">예뻐요 잘쓸게요~</option>
				</select></td>
			<tr>
				<td class="left">별점</td>
				<td><select name="rvstar">
						<option value="☆☆☆☆★">☆☆☆☆★</option>
						<option value="☆☆☆★★">☆☆☆★★</option>
						<option value="☆☆★★★">☆☆★★★</option>
						<option value="☆★★★★">☆★★★★</option>
						<option value="★★★★★" selected>★★★★★</option>
				</select></td>
			</tr>
			<tr>
				<td class="left">내용</td>
				<td><textarea type="text" name="rvcontent" rows="10"></textarea></td>
			</tr>
			<tr>
				<td class="left">사진</td>
				<td><input type="file" name="rvpic" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="write" />&nbsp;&nbsp;
					<a href="review_list">목록보기</a></td>
			</tr>

		</form>
	</table>


</body>
</html>