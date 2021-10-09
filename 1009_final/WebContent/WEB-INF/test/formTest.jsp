<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 작성 페이지 -->
	<%-- <c:if test="작성 페이지라면"> --%>
	<form method="post" action="formTest.do" name="insert">
		<input
			type="hidden" name="userNum" value="${user.userNum}"> <!-- 세션값 : user -->
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="tTitle" required></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="tWriter" value="${user.name}"
					readonly></td>
			</tr>
			<tr>
				<th>태그</th>
				<td><input type="text" name="tLang" required></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="tContent" rows="6"
						style="resize: none;" required></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="tEx" rows="6"
						style="resize: none;" required></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="tAnswer" rows="6"
						style="resize: none;" required></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글 작성"></td>
			</tr>
		</table>
	</form>
	<%-- </c:if> --%>
	<!-- 작성 페이지 END-->

	<!-- 수정 페이지 -->
	<%-- <c:if test="수정 페이지라면"> --%>

	<form method="post" name="edit" action="updateTest.do">
		
		<input type="text" name="tId" value="${param.tId}">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="tTitle" value="${param.tTitle}" required></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="tWriter" value="${param.tWriter}"
					readonly></td>
			</tr>
			<tr>
				<th>태그</th>
				<td><input type="text" name="tLang" value="${param.tLang}" required></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="tContent" rows="6"
						style="resize: none;" required>${param.tContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="tEx" rows="6"
						style="resize: none;" required>${param.tEx}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="tAnswer" rows="6"
						style="resize: none;" required>${param.tAnswer}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글 수정"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="글 삭제" onclick="del()"></td>
			</tr>
		</table>
	</form>

	<%-- </c:if> --%>
	<!-- 수정 페이지 END-->
</body>
<script type="text/javascript">
	function del() {
		result = confirm("글을 삭제하시겠습니까?");
		if (result == true) {
			location.href="deleteTest.do?tId="+${param.tId};
		} else {
			return;
		}
	}
</script>
</html>