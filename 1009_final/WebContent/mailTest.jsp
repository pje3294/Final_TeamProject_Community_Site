<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="web.mail.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
   <form id="mail" action="mail.do" method="post">
      <input type="text" id="id" name="id" placeholder="회원 아이디"> 
      <br>
      <input type="email" id="mymail" name="mymail" placeholder="받으실 이메일">
      <br>
      <button type="submit">정보입력 완료</button>
   </form>



</body>
</html>