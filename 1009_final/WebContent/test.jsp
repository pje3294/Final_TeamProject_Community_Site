<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!doctype html>
<html lang="ko">

<head>
<title>Add-On 코딩시험</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.jpg">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.jpg">
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- 상단 바 -->
		<mytag:navbar userName="${user.name}" userNum="${user.userNum}" />
		<!-- 왼쪽 사이드 바 -->
		<mytag:sidebar ctgr='test' />
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">코딩 테스트</h3>
						</div>
						<div class="panel-body">
							<!-- 정렬 버튼 -->
							<div class="row">
								<div class="col-md-4">
									<button type="button"
										onclick="location.href='test.do?pageOrder=date&tTitle=${tTitle}'"
										class="btn btn-primary btn-block">최신순</button>
								</div>
								<div class="col-md-4">
									<button type="button"
										onclick="location.href='test.do?pageOrder=hit&tTitle=${tTitle}'"
										class="btn btn-primary btn-block">조회순</button>
								</div>
								<div class="col-md-4">
									<button type="button"
										onclick="location.href='test.do?pageOrder=reply&tTitle=${tTitle}'"
										class="btn btn-primary btn-block">댓글순</button>
								</div>
							</div>
							<!-- 정렬 버튼 END -->
							<br> <br>
							<!-- 검색 및 글쓰기 버튼 -->
							<form method="post" action="test.do" name="test">
								<div class="input-group">
									<span class="input-group-btn">
									<button class="btn btn-default" type="submit">검색</button></span>
									<input class="form-control searchBox" type="text" name="tTitle">
									<c:if test="${!empty user}">
										<span class="input-group-btn">
											<button type="button" onclick="location.href='formTest.jsp'"
												class="btn btn-default box-right">글쓰기</button>
										</span>
									</c:if>
								</div>
							</form>
							<!-- 검색 및 글쓰기 버튼 END -->
							<br>
							<!-- 게시물 리스트 -->
							<table class="table table-striped tList">
								<thead>
									<tr>
										<th>번호</th>
										<th>테마</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성날짜</th>
										<th>조회수</th>
										<th>댓글수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="v" items="${tests}">
										<tr>
											<td>${v.tId}</td>
											<td>${v.tLang}</td>
											<td><a href="detailTest.do?tId=${v.tId}">${v.tTitle}</a></td>
											<td><a href="myPage.do?selUserNum=${v.userNum}&MyListCtgr=test">${v.tWriter}</a></td>
											<td>${v.tDate}</td>
											<td>${v.tHit}</td>
											<td>${v.reCnt}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 게시물 리스트 END -->
							<!-- 페이징 버튼 -->
							<div class="text-center">
								<c:forEach var="i" begin="0" end="${(pageLen-1)/3}">
									<button type="button"
										onclick="location.href='test.do?pageNum=${i}&tTitle=${tTitle}'"
										class="label label-primary">${i+1}</button>
								</c:forEach>
							</div>
							<!-- 페이징 버튼 END -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
	<div class="clearfix"></div>
	<footer>
		<div class="container-fluid">
			<p class="copyright">
				&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme
					I Need</a>. All Rights Reserved.
			</p>
		</div>
	</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
