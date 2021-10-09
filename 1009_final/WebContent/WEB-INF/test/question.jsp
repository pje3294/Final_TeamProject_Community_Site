<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
</head>
<body>

<!-- 정렬 버튼 -->
<table border="1">
	<tr>
		<th><button type="button" onclick="location.href='question.do?pageOrder=date&bTitle=${bTitle}&selUserNum=${selUserNum}'">최신순</button></th>
		<th><button type="button" onclick="location.href='question.do?pageOrder=hit&bTitle=${bTitle}&selUserNum=${selUserNum}'">조회순</button></th>
		<th><button type="button" onclick="location.href='question.do?pageOrder=reply&bTitle=${bTitle}&selUserNum=${selUserNum}'">댓글순</button></th>
	</tr>
</table>
<!-- 정렬 버튼 END-->

<hr>
<!-- 검색창 및 글쓰기 버튼-->
	<form method="post" action="question.do" name="bSearch">
		
		
		<table border="1">
			<tr>
				<td><input class="" type="text" name="bTitle" required>
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
	
		<c:forEach var="v" items="${questions}">
		
		<table>
			<tr>
				<td>테마</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>댓글수</td>
			</tr>
			<tr>
				<td>${v.bLang}</td>
				<td><a href="detail.do?&bId=${v.bId}">${v.bTitle}</a></td>
				<td>${v.bWriter}</td>
				<td>${v.bDate}</td>
			 	<td>${v.bHit}</td>
			 	<td>${v.reCnt}</td>
			</tr>
			<tr>
				<td colspan="3"><textarea name="bContent" rows="6"
						style="resize: none;" readonly>${v.bContent}</textarea></td>
			</tr>
			</table>
		</c:forEach>
		<%
			int pageLen = (Integer) request.getAttribute("pageLen") ;
			for (int i=0; i<=((pageLen-1)/3); i++){
				
		%>
			<span><a href="question.do?pageNum=<%=i%>&pageOrder=${pageOrder}&bTitle=${bTitle}&selUserNum=${selUserNum}"><%=i+1%></a></span>
		<%
		
			}
		%>
		
		
		
	
<!-- 게시판 글 END-->
</body>
</html>