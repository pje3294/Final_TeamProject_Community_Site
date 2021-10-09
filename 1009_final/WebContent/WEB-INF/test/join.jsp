<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 회원가입 -->
	<%-- <c:if test="회원가입 페이지라면"> --%>
	<form action="join.do" method="post" name="join">
		
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<th colspan="2">아이콘</th>
			</tr>
			<tr>
				<td><input type="radio" name="iconId" value="icon1" required>1번
					<input type="radio" name="iconId" value="icon2">2번 <input
					type="radio" name="iconId" value="icon3">3번</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td><input type="text" name="phone" onkeypress="inNumber();"
					maxlength="11" required /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" required /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" required></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="woman"
					required>여성 <input type="radio" name="gender"
					value="man">남성</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="birth" required /></td>
			</tr>
			<tr>
				<th colspan='2'><input type="submit" value="회원가입"></th>
			</tr>
		</table>
	</form>
	<%-- </c:if> --%>
	<!-- 회원가입 END-->
	
	<!-- 프로필수정 -->
	 <c:if test="${param.page=='updateUser'}"> 
	
	
	<form action="updateUser.do" method="post" name="edit">
		<input type="text" name="userNum" value="${user.userNum}">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${user.name}" required></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${user.id }"readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pw" value="${user.pw}" required></td>
			</tr>
			<tr>
				<th colspan="2">아이콘</th>
			</tr>
			<tr>
				<td><input type="radio" name="iconId" value="icon1" required>1번
					<input type="radio" name="iconId" value="icon2">2번 <input
					type="radio" name="iconId" value="icon3">3번</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td><input type="text" name="phone" onkeypress="inNumber();"
					maxlength="11" value="${user.phone}" required /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="${user.email}" required /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="addr" value="${user.addr}" ></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="woman"
					required>여성 <input type="radio" name="gender"
					value="man">남성</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="birth" value="${user.birth}" required /></td>
			</tr>
			<tr>
				<th colspan='2'><input type="submit" value="프로필 수정"></th>
			</tr>
			
			<tr>
				<th colspan='2'><input type="button" value="회원탈퇴" onclick="del()"></th>
			</tr>
		</table>
	</form>
	</c:if> 
	<!-- 프로필수정 END-->

</body>
<script type="text/javascript">
	function inNumber() {
		if (event.keyCode<48 || event.keyCode>57) {
			event.returnValue = false;
		}
	}
	
	function del() {
		result = confirm("탈퇴하시겠습니까?");
		if (result == true) {
			location.href='deleteUser.do?userNum='+${user.userNum};
		} else {
			return;
		}
	}
</script>
</html>