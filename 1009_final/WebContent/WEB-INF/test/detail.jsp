<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>

	<form method="post" action="form.jsp" name="detail">
		<input type="hidden" name="bId" value="${board.bId}">
		<table border="1">

			<tr>
				<th>제목</th>
				<td><input type="text" name="bTitle" value="${board.bTitle}"
					readonly></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><a href="myPage.do?selUserNum=${board.userNum}&myListCtgr=board&replyCtgr=reply"><input type="text" name="bWriter" value="${board.bWriter}"
					readonly></a></td>
			</tr>
			<tr>
				<th>게시판 종류</th>
				<td><input type="text" name="bCtgr" value="${board.bCtgr}"
					readonly></td>
			</tr>
			<tr>
				<th>테마</th>
				<td><input type="text" name="bLang" value="${board.bLang}"
					readonly></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="bContent" rows="6"
						style="resize: none;" readonly>${board.bContent}</textarea></td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td>${board.bDate}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="submit"
					value="update"></td>
			</tr>
		</table>
	</form>
	<form method="post" action="insertReply.do">
		<input type="hidden" name="bId" value="${board.bId}"> userNum : <input
			type="hidden" name="userNum" value="${user.userNum}"> <input
			type="hidden" name="rWriter" value="${user.name}"> <input
			type="hidden" name="parentId" value="0"> <input type="text"
			name="rContent"> <input type="submit" value="댓글  작성">
	</form>

	<c:forEach var="replySet" items="${replySets}">
		<c:set var="reply" value="${replySet.rvo}" />
			<form method="post" action="updateReply.do">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="bId" value="${board.bId}">
			댓글번호 : <input type="text" name="rId" value="${reply.rId }">	 
			작성자 : ${reply.rWriter} 내용 : <input type="text" name="rContent" value="${reply.rContent}" >	
			 parentId : ${reply.parentId}<input type="submit" value="수정하기"> 
			 <a href="deleteReply.do?rId=${reply.rId}&bId=${board.bId}&pageNum=${pageNum}">삭제하기</a>
			 </form>
														
			
			<br>
		<form method="post" action="insertReply.do">
			<input type="hidden" name="bId" value="${board.bId}"> <input
				type="hidden" name="userNum" value="${user.userNum}"> <input
				type="hidden" name="rWriter" value="${user.name}"> <input
				type="hidden" name="parentId" value="${reply.rId}"> 
				<input type="hidden" name="pageNum" value="${pageNum}">
				<input type="text" name="rContent">
				 <input type="submit" value="대댓글  작성">
		</form>

		<c:forEach var="rreply" items="${replySet.rrlist}">
			댓글번호 : ${rreply.rId} 작성자 : ${rreply.rWriter} 내용 : ${rreply.rContent} parentId : ${rreply.parentId}	
			<br>
		</c:forEach>

		<br>

	</c:forEach>



	<% 
			int pageLen = (Integer) request.getAttribute("pageLen");
			
			
			for ( int i =0; i<=((pageLen-1)/3); i++){
				%>

	<a href="detail.do?bId=${board.bId}&pageNum=<%=i%>"><%=i+1 %></a>

	<%
			}
		
		%>








</body>
</html>