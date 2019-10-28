<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@include file="/WEB-INF/include/header.jsp"%>


</head>
<body>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function selectCId() {
			var chkcid = $('input:radio[name="selectcid"]:checked').val();
			return chkid;
		}
	</script>

	<form action="adminMain" name="form1" method="post">
		<select name="sort" onchange="chsort()">
			<option value="">정렬방법</option>
			<option value="num">회원번호</option>
			<option value="name">이름순</option>
			<option value="date">가입일</option>
		</select> <input type="submit" value="정렬">
	</form>
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
	<a class="navbar-brand mr-1" href="../index">Enjoy It </a>

	<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>
	<!-- Navbar Search -->
	<form
		class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="Search for..."
				aria-label="Search" aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
	</form>

	<!-- Navbar -->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span
				class="badge badge-danger">9+</span>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="alertsDropdown">
				<a class="dropdown-item" href="#">Action</a> <a
					class="dropdown-item" href="#">Another action</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">Something else here</a>
			</div></li>
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span
				class="badge badge-danger">7</span>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="messagesDropdown">
				<a class="dropdown-item" href="#">Action</a> <a
					class="dropdown-item" href="#">Another action</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">Something else here</a>
			</div></li>
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#">Settings</a> <a
					class="dropdown-item" href="#">Activity Log</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal">Logout</a>
			</div></li>
	</ul>

	</nav>


	<div id="wrapper">
	
	<!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="#">Login</a>
          <a class="dropdown-item" href="#">Register</a>
          <a class="dropdown-item" href="#">Forgot Password</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="#">404 Page</a>
          <a class="dropdown-item" href="#">Blank Page</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>
    </ul>
    
    <div id="content-wrapper">
          <div class="container-fluid">
    
		<form action="../del_cu" method="post">
			<h3>일반회원 목록</h3>
			<input type="submit" value="회원삭제">
			<table border="1">
				<tr>
					<td>선택</td>
					<td>회원번호</td>
					<td>회원아이디</td>
					<td>회원명</td>
					<td>회원주소</td>
					<td>이메일</td>
					<td>생년월일</td>
					<td>성별</td>
					<td>연락처</td>
					<td>가입일</td>

				</tr>
				<c:forEach items="${clist}" var="cu">
					<tr>
						<td><input type="radio" name="cunum" value="${cu.cunum }"></td>
						<td>${cu.cunum }</td>
						<td><a href="cuManagement?cunum=${cu.cunum}">${cu.cuid }</a></td>
						<td>${cu.cuname  }</td>
						<td>${cu.cuaddr }</td>
						<td>${cu.cuemail }</td>
						<td>${cu.cubirth }</td>
						<td>${cu.cugender  }</td>
						<td>${cu.cutel }</td>
						<td>${cu.cudate }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<form action="../del_bu" method="post">
			<h3>가맹회원 목록</h3>
			<input type="submit" value="가맹회원삭제">
			<table border="1">
				<tr>
					<td>선택</td>
					<td>회원번호</td>
					<td>회원아이디</td>
					<td>사업자명</td>
					<td>사업자주소</td>
					<td>이메일</td>
					<td>사업자등록번호</td>
					<td>연락처</td>
					<td>가입일</td>
				</tr>


				<c:forEach items="${blist}" var="bu">
					<tr>

						<td><input type="radio" name="bunum" value="${bu.bunum }"></td>

						<td>${bu.bunum}</td>
						<td><a href="buManagement?bunum=${bu.bunum}">${bu.buid }</a></td>
						<td>${bu.buname}</td>
						<td>${bu.buaddr}</td>
						<td>${bu.buemail}</td>
						<td>${bu.burenum}</td>
						<td>${bu.butel}</td>
						<td>${bu.budate}</td>
					</tr>
				</c:forEach>

			</table>
		</form>
		</div>
<%@include file="/WEB-INF/include/footer.jsp"%>
	</div>
	</div>

</body>

</html>