<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.test.TestVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!doctype html>
<html lang="ko">

<head>
<title>Add-On 코딩시험 게시판</title>
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
<!-- Star -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/fontawesome-stars.css">
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
					<h3 class="page-title">코딩 테스트</h3>
					<!-- 게시물 -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h4 class="text-left">
								<span class="lnr lnr-home"></span>&nbsp;<a
									href="myPage.do?selUserNum=${test.userNum}&myListCtgr=test">${test.tWriter}</a>
							</h4>
							<span class="panel-subtitle text-right">${test.tDate}</span>
						</div>
						<div class="panel-heading">
							<h3 class="panel-title">${test.tTitle}</h3>
							<p class="panel-subtitle">${test.tLang}</p>
						</div>
						<div class="panel-body">
							<form method="post" action="formTest.jsp" name="detailTest">
								<!-- 내용 -->
								<textarea name="tContent" rows="6" class="form-control"
									style="resize: none;" readonly>${test.tContent}
                           </textarea>
								<br>
								<h4>출력 예시</h4>
								<textarea name="tEx" rows="6" class="form-control"
									style="resize: none;">${test.tEx}</textarea>
								<br>
								<div class="panel panel-action">
									<div class="panel-heading">
										<h4>정답</h4>
										<div class="right">
											<button type="button" class="btn-toggle-collapse">
												<i class="lnr lnr-chevron-up lnr-chevron-down"></i>
											</button>
										</div>
									</div>
									<div class="panel-body panel-action-body">
										<textarea name="tAnswer" rows="6" class="form-control"
											style="resize: none;" readonly>${test.tAnswer}</textarea>
									</div>

								</div>
								<div class="input-group">
									<input class="form-control" type="text" name="userAnswer">
									<span class="input-group-btn">
										<button class="btn btn-primary" type="button"
											onclick="checkAnswer">정답 작성</button>
									</span>
								</div>
								<input type="hidden" name="tTitle" value="${test.tTitle}">
								<input type="hidden" name="tWriter" value="${test.tWriter}">
								<input type="hidden" name="tLang" value="${test.tLang}">
								<input type="hidden" name="tId" value="${test.tId}">
								<c:if test="${test.userNum==user.userNum}">
									<button type="submit" class="btn btn-default">글 수정</button>
								</c:if>
							</form>
						</div>
						<!-- 게시물 END -->

						<!-- 댓글 -->
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">댓글</h3>
							</div>
							<div class="panel-body">
								<!-- 댓글작성 -->
								<c:if test="${!empty user}">
									<form method="post" action="insertTestReply.do" name="reply">
										<input type="hidden" name="userNum" value="${user.userNum}">
										<input type="hidden" name="tId" value="${test.tId}"> <input
											type="hidden" name="rWriter" value="${user.id}"> <input
											type="hidden" name="parentId" value="0">
										<div class="input-group">
											<input class="form-control" type="text" name="rContent"
												required> <span class="input-group-btn"> <select
												class="example">
													<option value="1">1</option>
													<option value="2" selected>2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
											</select>
											</span> <span class="input-group-btn"><button
													class="btn btn-primary" type="submit">댓글 작성</button></span>
										</div>
									</form>
								</c:if>
								<!-- 댓글작성 END -->
								<br>
								<!-- 댓글 리스트 -->
								<table class="table table-condensed">
									<tbody>
										<c:forEach var="replySet" items="${replySets}">
											<c:set var="reply" value="${replySet.rvo}" />
											<tr>
												<td>${reply.rWriter}</td>
												<td class="panel-action">
													<div class="panel-heading">
														<form method="post" action="control.jsp" name="replyUp">
															<input type="text" class="form-reply" name="rContent"
																value="${reply.rContent}" required readonly>
															<div class="right">
																<!-- 댓글 수정 및 삭제 -->
																<c:if test="${reply.userNum == user.userNum}">
																	<input type="hidden" name="rId" value="${reply.rId}">
																	<input type="hidden" name="tId" value="${test.tId}">
																	<input type="hidden" name="pageNum" value="${pageNum}">
																	<button type="button" class="btn-update">수정하기</button>
																	<input type="submit" class="btn updateBtn" value="수정완료">
																	<button type="button" onclick="replyDel()">삭제하기</button>
																</c:if>
																<!-- 댓글 수정 및 삭제 END -->
																<button type="button" class="btn-toggle-collapse">더보기
																</button>
															</div>
														</form>
													</div>
													<div class="panel-body panel-action-body">
														<!-- 대댓글 작성 -->
														<c:if test="${!empty user}">
															<form method="post" action="insertTestReply.do"
																name="rreply">
																<input type="hidden" name="userNum"
																	value="${user.userNum}"> <input type="hidden"
																	name="tId" value="${test.tId}"> <input
																	type="hidden" name="rWriter" value="${user.id}">
																<input type="hidden" name="parentId"
																	value="${reply.rId}"> <input type="hidden"
																	name="pageNum" value="${pageNum}">
																<div class="input-group">
																	<input class="form-control" type="text" name="rContent"
																		required> <span class="input-group-btn"><button
																			class="btn btn-primary" type="submit">댓글 작성</button></span>
																</div>
															</form>
														</c:if>
														<!-- 대댓글 작성 END -->
														<br>
														<!-- 대댓글 리스트 -->
														<table class="table table-condensed">
															<tbody>
																<c:forEach var="rreply" items="${replySet.rrlist}">
																	<tr>
																		<td>${rreply.rWriter}</td>
																		<td><div class="panel-heading">
																				<form method="post" action="updateReply.do"
																					name="rreplyUp">
																					<input type="text" class="form-reply"
																						name="rContent" value="${rreply.rContent}"
																						required readonly>
																					<div class="right">
																						<!-- 대댓글 수정 및 삭제 -->
																						<c:if test="${rreply.rWriter == user.id}">
																							<input type="hidden" name="pageNum"
																								value="${pageNum}">
																							<input type="hidden" name="rId"
																								value="${rreply.rId}">
																							<input type="hidden" name="tId"
																								value="${test.tId}">
																							<button type="button" class="btn-update">수정하기</button>
																							<input type="submit" class="btn updateBtn"
																								value="수정완료">
																							<button type="button" onclick="rreplyDel()">삭제하기</button>
																						</c:if>
																						<!-- 대댓글 수정 및 삭제 END -->
																					</div>
																				</form>
																			</div></td>
																		<td><select class="example">
																				<option value="1">1</option>
																				<option value="2" selected>2</option>
																				<option value="3">3</option>
																				<option value="4">4</option>
																				<option value="5">5</option>
																		</select></td>
																		<td>${rreply.rDate}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
														<!-- 대댓글 리스트 END-->
													</div>
												</td>
												<td>${reply.rDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- 댓글 리스트 END -->
							</div>
						</div>
						<!-- 댓글 END -->
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
	<script src="assets/scripts/jquery.barrating.min.js"></script>

	<script type="text/javascript">
		function replyDel() {
			result = confirm("댓글을 삭제하시겠습니까?");
			if (result == true) {
				document.replyUp.action = "deleteTestReply.do";
				document.replyUp.submit();
			} else {
				return;
			}
		}
		function rreplyDel() {
			result = confirm("대댓글을 삭제하시겠습니까?");
			if (result == true) {
				document.rreplyUp.action = "deleteTestReply.do";
				document.rreplyUp.submit();
			} else {
				return;
			}
		}
	</script>
</body>

</html>