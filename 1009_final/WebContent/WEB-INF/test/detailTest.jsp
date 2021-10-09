<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>

<form method="post" action="formTest.jsp" name="detailTest">
		<input type="text" name="tId" value="${test.tId}"> 
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="tTitle" value="${test.tTitle}" readonly></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><a href="myPage.do?selUserNum=${test.userNum}&myListCtgr=board&replyCtgr=reply"><input type="text" name="tWriter" value="${test.tWriter}" readonly></a></td>
				
			</tr>
			<tr>
				<th>분야</th>
				<td><input type="text" name="tLang" value="${test.tLang}" readonly></td>
			</tr>
			<tr><td colspan="2">문제</td></tr>
			<tr>
				<td colspan="2"><textarea name="tContent" rows="6"
						style="resize: none;" readonly>${test.tContent}</textarea></td>
			</tr>
			<tr><td colspan="2">출력예시</td></tr>
			<tr>
				<td colspan="2"><textarea name="tEx" rows="6"
						style="resize: none;" readonly>${test.tEx}</textarea></td>
			</tr>
			<tr><td colspan="2">정답</td></tr>
			<tr>
				<td colspan="2"><textarea name="tAnswer" rows="6"
						style="resize: none;" readonly>${test.tAnswer}</textarea></td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td>${test.tDate}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글 수정"></td>
			</tr>
		</table>
	</form>
	<%
		System.out.println(session.getAttribute("user"));
		
	%>
	<form method="post" action="insertTestReply.do">
		<input type="hidden" name="tId" value="${test.tId}"> <input
			type="hidden" name="userNum" value="${user.userNum}"> <input
			type="hidden" name="rWriter" value="${user.name}"> <input
			type="hidden" name="parentId" value="0"> <input type="text"
			name="rContent"> <input type="submit" value="댓글  작성">
	</form>

	<c:forEach var="testReplySet" items="${testReplySets}">
		<c:set var="reply" value="${testReplySet.reply}" />
			<form method="post" action="updateTestReply.do">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="tId" value="${test.tId}">
			댓글번호 : <input type="text" name="rId" value="${reply.rId}">	 
			작성자 : ${reply.rWriter} 내용 : <input type="text" name="rContent" value="${reply.rContent}" >	
			 parentId : ${reply.parentId}<input type="submit" value="수정하기"> 
			 <a href="deleteTestReply.do?rId=${reply.rId}&tId=${test.tId}&pageNum=${pageNum}">삭제하기</a>
			 </form>
													
			
			<br>
		<form method="post" action="insertTestReply.do">
			<input type="hidden" name="tId" value="${test.tId}"> <input
				type="hidden" name="userNum" value="${user.userNum}"> <input
				type="hidden" name="rWriter" value="${user.name}"> <input
				type="hidden" name="parentId" value="${reply.rId}"> 
				<input type="hidden" name="pageNum" value="${pageNum}">
				<input type="text" name="rContent">
				 <input type="submit" value="대댓글  작성">
		</form>

		<c:forEach var="rreply" items="${testReplySet.rrlist}">
			댓글번호 : ${rreply.rId} 작성자 : ${rreply.rWriter} 내용 : ${rreply.rContent} parentId : ${rreply.parentId}	
			 <a href="deleteTestReply.do?rId=${rreply.rId}&tId=${test.tId}&pageNum=${pageNum}">삭제하기</a>
			<br>
		</c:forEach>

		<br>
		 

	</c:forEach>
	
	<% 
		
		int pageLen =(Integer)request.getAttribute("pageLen"); 
		for ( int i =0; i<=((pageLen-1)/3); i++) {
			%>
			
			<a href="detailTest.do?pageNum=<%=i%>&tId=${test.tId}"><%=i+1 %></a>
			
			<%
		}
	
	%>
	
	
	

</body>
</html>