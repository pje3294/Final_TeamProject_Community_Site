<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko" class="fullscreen-bg">

<head>
<title>Add-On 회원가입</title>
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
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box lockscreen clearfix">
					<div class="content">
						<h1 class="sr-only">Klorofil - Free Bootstrap dashboard</h1>
						<div class="logo text-center">
							<img src="assets/img/logo.png" alt="Klorofil Logo">
						</div>
						<!-- 회원가입 -->
						<c:if test="${empty user}">
							<form action="join.do" method="post" name="join">
							<input type="hidden" name="iconId" value="1">
								<div class="form-group">
									<span>이름</span> <input class="form-control" type="text"
										name="name" maxlength="10" required>
										
								</div>
								<div class="form-group">
									<span>성별</span> <br> <label class="fancy-radio"> <input
										name="gender" value="M" type="radio"> <span><i></i>남성</span>
									</label> <label class="fancy-radio"> <input name="gender"
										value="F" type="radio"> <span><i></i>여성</span>
									</label>
								</div>
								<div class="form-group">
									<span>아이디</span> <div class="input-group">
											<input class="form-control" id="id" name="id" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,16}$" maxlength="16"
											title="영어,숫자 혼합  6-16자리" placeholder="영어,숫자 혼합  6-16자리" type="text" required>
											<span class="input-group-btn"><button class="btn btn-primary" id="idCheck" type="button" onclick="idCheck();">중복확인</button></span>
										</div>
								</div>
								<div class="form-group">
									<span>비밀번호</span> <input class="form-control" type="password"
										name="pw" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16"
										title="영어,숫자,특수문자 혼합  8-16자리" placeholder="영어,숫자,특수문자 혼합  8-16자리" required>
								</div>
								<div class="form-group">
									<span>비밀번호 확인</span> <input class="form-control" type="password"
										name="rpw" maxlength="16" required>
								</div>
								<div class="form-group">
									<span>생년월일</span> <input class="form-control" type="date"
										name="birth" max="9999-12-31" min="1000-01-01" required>
								</div>
								<div class="form-group">
									<span>휴대폰 번호</span> <input class="form-control" type="text"
										name="phone" onkeypress="inNumber();" pattern=".{11}" maxlength="11" 
										title="형식 01012345678" placeholder="'-'를 제외한 11자리 번호" required>
								</div>
								<div class="form-group">
									<span>주소</span> <div class="input-group">
									<input class="form-control" type="text" id="addr" name="addr" readonly required>
									<span class="input-group-btn">
										<button class="btn btn-primary" type="button" onclick="search_address();">검색</button>
									</span> </div>
								</div>
								<div class="form-group">
									<span>이메일</span> <input class="form-control" type="email"
										name="email" required>
								</div>
								<br>
								<div class="form-group">
									<input class="btn btn-primary btn-block" onclick="return joinform_check();" type="submit"
										value="회원가입">
								</div>
							</form>
						</c:if>
						<!-- 회원가입 END -->
						<!-- 회원 정보수정 -->
						<c:if test="${!empty user}">
							<form action="updateUser.do" method="post" name="userUp">
							<input type="hidden" name="iconId" value="${user.iconId}">
							<input type="hidden" name="userNum" value="${user.userNum}">
								<div class="form-group">
									<span>이름</span> <input class="form-control" type="text"
										name="name" maxlength="10" value="${user.name}" required>
										
								</div>
								<div class="form-group">
									<span>성별</span> <br> <label class="fancy-radio"> <input
										name="gender" value="M" type="radio"> <span><i></i>남성</span>
									</label> <label class="fancy-radio"> <input name="gender"
										value="F" type="radio"> <span><i></i>여성</span>
									</label>
								</div>
								<div class="form-group">
									<span>아이디</span>
											<input class="form-control" name="id" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,16}$" maxlength="16"
											title="영어,숫자 혼합  6-16자리" placeholder="영어,숫자 혼합  6-16자리" type="text" value="${user.id}" required readonly>
								</div>
								<div class="form-group">
									<span>비밀번호</span> <input class="form-control" type="password"
										name="pw" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16"
										title="영어,숫자,특수문자 혼합  8-16자리" placeholder="영어,숫자,특수문자 혼합  8-16자리" value="${user.pw}" required>
								</div>
								<div class="form-group">
									<span>비밀번호 확인</span> <input class="form-control" type="password"
										name="rpw" maxlength="16" value="${user.pw}" required>
								</div>
								<div class="form-group">
									<span>생년월일</span> <input class="form-control" type="date"
										name="birth" max="9999-12-31" min="1000-01-01" value="${user.birth}" required>
								</div>
								<div class="form-group">
									<span>휴대폰 번호</span> <input class="form-control" type="text"
										name="phone" onkeypress="inNumber();" pattern=".{11}" maxlength="11" 
										title="형식 01012345678" placeholder="'-'를 제외한 11자리 번호" value="${user.phone}" required>
								</div>
								<div class="form-group">
									<span>주소</span> <div class="input-group">
									<input class="form-control" type="text" id="addr" name="addr" value="${user.addr}" readonly required>
									<span class="input-group-btn">
										<button class="btn btn-primary" type="button" onclick="search_address();">검색</button>
									</span> </div>
								</div>
								<div class="form-group">
									<span>이메일</span> <input class="form-control" type="email"
										name="email" value="${user.email}" required>
								</div>
								<br>
								<div class="form-group">
									<input class="btn btn-primary" onclick="return joinform_check()" type="submit"
										value="수정하기">
									<input class="btn btn-warning box-right" onclick="del()" type="button"
										value="탈퇴하기">
								</div>
							</form>
						</c:if>
						<!-- 회원 정보수정 END -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
	
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		// 핸드폰칸에 번호만 입력
		function inNumber() {
			if (event.keyCode<48 || event.keyCode>57) {
				event.returnValue = false;
			}
		}
		
		// 탈퇴 버튼
		function del() {
			result = confirm("탈퇴하시겠습니까?");
			if (result == true) {

				document.userUp.action = "deleteUser.do";
				document.userUp.submit();
			} else {
				return;
			}
		}
		
		// 비밀번호 확인
		function joinform_check() {

			var pw = document.getElementById("pw");
			var rpw = document.getElementById("rpw");

			if (rpw.value !== pw.value) {
				alert("비밀번호가 일치하지 않습니다..");
				rpw.focus();
				return false;
			}
		}
		//   ================================================================================
			
			//우편번호 검색 팝업창

		function search_address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								// document.getElementById("addr3").value = extraAddr;

							} else {
								// document.getElementById("addr3").value = '';
								extraAddr = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							// document.getElementById('postal_code').value = data.zonecode;
							document.getElementById("addr").value = addr+extraAddr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("addr").focus();
						}
					}).open();
		}
		
		function idCheck() {
			result = confirm("탈퇴하시겠습니까?");
			if (result == true) {

				document.userUp.action = "idCheck.do";
				document.userUp.submit();
			} else {
				return;
			}
			/* var id = $('#id').val();
			console.log(id);
			$.ajax({
				type : 'GET',
				url : "idCheck.do",
				data : id,
				success : function(result) {
					console.log(result);
					if (result == 'false') {
						alert("ID형식이 잘못 되었습니다. 다시 입력하세요.");

					} else if (result == 'fail') {
						alert("ID가 이미 존재합니다. 다시 입력하세요.");

					} else {
						alert("사용 가능한 ID입니다.");
						
					}
				},
				error : function(xhr) {
					console.log(xhr.status + " : " + xhr.errorText);
					alert("에러발생!");
				}

			}) */
		}
	</script>
</body>
</html>