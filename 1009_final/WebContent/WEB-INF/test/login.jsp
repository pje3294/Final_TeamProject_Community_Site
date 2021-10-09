<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="login.do" method="post" name="login">

	<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userId" required></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="userPw" required></td>
			</tr>
			<tr>
				<th colspan='2'><input type="submit" value="로그인">
			</tr>
			<tr>
				<th colspan='2'><input type="button" value="회원가입" onclick="location.href='join.jsp'">
			</tr>
	</table>
</form>



</body>
</html>