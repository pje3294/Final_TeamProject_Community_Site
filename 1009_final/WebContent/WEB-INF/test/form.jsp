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
	<form method="post" action="form.do" name="insert">
		 <input type="hidden" name="userNum" value="${user.userNum}">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="bTitle" required></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bWriter" value="${user.name}"
					readonly></td>
			</tr>
			<tr>
				<th>게시판 종류</th>
				<td><input type="radio" name="bCtgr" value="question" required>QnA
					<input type="radio" name="bCtgr" value="board">자유게시판
						<!-- 만약 관리자라면  -->
						<input type="radio" name="bCtgr" value="announce">공지
				</td>
			</tr>
			<tr>
				<th>태그</th>
				<td><input type="text" name="bLang" required></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="bContent" rows="6"
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
	
	
	
	
	<form method="post" action="update.do" name="edit">
		<input type="text" value="${param.bId}" name="bId">
		<!-- userNum없는상태 ?? -->
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="bTitle" value="${param.bTitle}" required></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bWriter" value="${param.bWriter}"
					readonly></td>
			</tr>
			<tr>
				<th>게시판 종류</th>
				<td><input type="text" name="bCtgr" value="${param.bCtgr}" readonly></td>
			</tr>
			<tr>
				<th>태그</th>
				<td><input type="text" name="bLang" value="${param.bLang}" required></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="bContent" rows="6"
						style="resize: none;" required>${param.bContent}</textarea></td>
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
			location.href="delete.do?bId="+${param.bId};
		} else {
			return;
		}
	}
</script>
</html>