<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>

<!-- 공지글 -->
	<hr>
	<h1>공지</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성날짜</th>
		</tr>
		<c:forEach var="v" items="${announceList}">
			<tr>
				<td>${v.bId}</td>
				<td><a href="detail.do?bId=${v.bId}">${v.bTitle}</a></td>
				<td>${v.bDate}</td>
			</tr>
		</c:forEach>
		
	</table>
		<% 
			int announceLen = (Integer)request.getAttribute("announceLen");
			for (int i=0; i<=((announceLen-1)/3);i++){
				%>
				<a href="board.do?announcePageNum=<%=i%>&boardPageNum=${boardPageNum}"><%=i+1 %></a>
				
				
				<% 
				
			}
		%>
<!-- 공지글  END-->
<hr>
<!-- 정렬 버튼 -->
<table border="1">
	<tr>
		<th><button type="button" onclick="location.href='board.do?pageOrder=date&bTitle=${bTitle}&selUserNum=${selUserNum}'">최신순</button></th>
		<th><button type="button" onclick="location.href='board.do?pageOrder=hit&bTitle=${bTitle}&selUserNum=${selUserNum}'">조회순</button></th>
		<th><button type="button" onclick="location.href='board.do?pageOrder=reply&bTitle=${bTitle}&selUserNum=${selUserNum}'">댓글순</button></th>
	</tr>
</table>
<!-- 정렬 버튼 END-->

<hr>
<!-- 검색창 및 글쓰기 버튼-->
	<form method="post" action="board.do" name="bSearch">
		
		<table border="1">
			<tr>
				<td><input class="" type="text" name="bTitle"  required>
					<input type="hidden" name="selUserNum" value="${selUserNum}">
					<span class=""><button class="" type="submit">검색</button></span></td>
					<!-- 로그인시에만 -->
				<td><button type="button" class=""
						onclick="location.href='form.jsp'">글 쓰기</button></td>
			</tr>
		</table>
	</form>
<!-- 검색창 및 글쓰기 버튼 END-->
<hr>
<!-- 게시판 글-->
<hr>
	<h1>게시판</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>테마</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
			<th>조회수</th>
			<th>댓글수</th>
			
		</tr>
		<c:forEach var="v" items="${boardList}">
			<tr>
				<td>${v.bId}</td>
				<td>${v.bLang}</td>
				<td><a href="detail.do?bId=${v.bId}">${v.bTitle}</a></td>
				<td>${v.bWriter}</td>
				<td>${v.bDate}</td>
				<td>${v.bHit}</td>
				<td>${v.reCnt}</td>
				
			</tr>
		</c:forEach>
	</table>
	<% 
			int boardLen = (Integer)request.getAttribute("boardLen");
			for (int i=0; i<=((boardLen-1)/3);i++){
				%>
				<a href="board.do?announcePageNum=${announcePageNum}&boardPageNum=<%=i%>&bTitle=${bTitle}&pageOrder=${pageOrder}&selUserNum=${selUserNum}"><%=i+1 %></a>
				
				
				<% 
				
			}
		%>
		<h2>확인 : ${selUser.userNum }</h2>
<!-- 게시판 글 END-->
</body>
</html>