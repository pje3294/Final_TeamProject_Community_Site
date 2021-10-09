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
	<!-- 내정보 -->
	<table border="1">
		<tr>
			<th colspan="2">${selUser.id}</th>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td>${selUser.phone}></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${selUser.email}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${selUser.gender}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${selUser.birth}</td>
		</tr>
		<tr>
			<th>번호</th>
			<td>${selUser.userNum}</td>
		</tr>
		<tr>
			<th colspan='2'><button type="button"
					onclick="location.href='join.jsp?page=updateUser'">프로필 수정</button></th>
		</tr>
	</table>
	<!-- 내정보 END -->

	<!-- 내가쓴 게시글 -->
	<a href="myPage.do?myListCtgr=question&selUserNum=${selUser.userNum}&replyCtgr=${replyCtgr}&replyPageNum=${replyPageNum}">q&a</a>
	<!-- 더보기 부분 구현해야함! -->
	<a href="myPage.do?myListCtgr=board&selUserNum=${selUser.userNum}&replyCtgr=${replyCtgr}&replyPageNum=${replyPageNum}">게시글</a>
	<a href="myPage.do?myListCtgr=test&selUserNum=${selUser.userNum}&replyCtgr=${replyCtgr}&replyPageNum=${replyPageNum}">코딩문제</a>
	<!-- 커스텀 태그를 사용하는 것이 좋을 것듯!  커스텀 태그 태그바디로  .do 부분 결정!-->
	<c:choose>
		<c:when test="${param.myListCtgr eq 'test'}">
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성날짜</th>
					<th>작성자</th>

				</tr>
				<c:forEach var="v" items="${myList}">
					<tr>
						<td>${v.tId}</td>
						<td><a href="test.do?bId=${v.tId}">${v.tTitle}</a></td>
						<td>${v.tDate}</td>
						<td>${v.tWriter}</td>

					</tr>
				</c:forEach>
			</table>
			<br>
			<a href="test.do?selUserNum=${selUser.userNum}">더보기</a>
			<br>
		</c:when>
		<c:when test="${param.myListCtgr eq 'question'}">
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성날짜</th>
					<th>작성자</th>

				</tr>
				<c:forEach var="v" items="${myList}">
					<tr>
						<td>${v.bId}</td>
						<td><a href="detail.do?bId=${v.bId}">${v.bTitle}</a></td>
						<td>${v.bDate}</td>
						<td>${v.bWriter}</td>

					</tr>
				</c:forEach>

			</table>
			<br>
			<a href="question.do?selUserNum=${selUser.userNum}"> 더 보기</a>
			<br>
		</c:when>
		<c:otherwise>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성날짜</th>
					<th>작성자</th>
				</tr>
				<c:forEach var="v" items="${myList}">
					<tr>
						<td>${v.bId}</td>
						<td><a href="board.do?bId=${v.bId}">${v.bTitle}</a></td>
						<td>${v.bDate}</td>
						<td>${v.bWriter}</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<a href="board.do?selUserNum=${selUser.userNum}"> 더 보기</a>
			<br>
		</c:otherwise>


	</c:choose>
	<!-- 내가쓴 게시글 END-->
	<a href="myPage.do?myListCtgr=test&selUserNum=${selUser.userNum}&replyCtgr=reply">자유게시판 and Q&A 댓글</a>
	<a href="myPage.do?myListCtgr=test&selUserNum=${selUser.userNum}&replyCtgr=testReply"> 코딩 테스트 </a>
	<!-- 내가 쓴 댓글! -->
	<c:if test="${param.replyCtgr=='reply'}">
	<c:forEach var="reply" items="${myReplies}">
		댓글번호 :<a href="detail.do?bId=${reply.bId}"><input type="text"
			name="rId" value="${reply.rId }"></a>	 
			
			작성자 : ${reply.rWriter} 내용 : <input type="text" name="rContent"
			value="${reply.rContent}">
		<br>
	</c:forEach>
	<br>
	<h2>${replyLen }</h2>
	<br>
	<c:forEach var="i" begin="0" end="${(replyLen-1)/3 }">
		<a
			href="myPage.do?replyPageNum=${i}&myListCtgr=${myListCtgr}&selUserNum=${user.userNum}&replyCtgr=reply">${i+1}</a>
	</c:forEach>
	</c:if>
<!-- ----------------------------------------------------------------------------------------- -->
<br>
	<c:if test="${param.replyCtgr=='testReply'}">
	<c:forEach var="testReply" items="${myTestReplies}">
		댓글번호 :<a href="detailTest.do?tId=${testReply.tId}"><input type="text"
			name="rId" value="${testReply.rId }"></a>	 
			
			작성자 : ${testReply.rWriter} 내용 : <input type="text" name="rContent"
			value="${testReply.rContent}">
		<br>
	</c:forEach>
	<br>
	<h2>${replyLen }</h2>
	<br>
	<c:forEach var="i" begin="0" end="${(replyLen-1)/3 }">
		<a
			href="myPage.do?replyPageNum=${i}&myListCtgr=${myListCtgr}&selUserNum=${user.userNum}&replyCtgr=testReply">${i+1}</a>
	</c:forEach>
</c:if>




</body>
</html>