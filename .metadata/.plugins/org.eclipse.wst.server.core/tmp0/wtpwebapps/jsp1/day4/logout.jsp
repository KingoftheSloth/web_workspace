<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
<%
//방법 1. 현재 브라우저에 저장된 JSESSIONID 항목을 삭제 합니다.
session.invalidate();

//방법 2. JSESSIONID는 유지를 하고 user attribute만 삭제하기
//session.removeAttribute("user");

out.print("<script>");
out.print("alert('로그아웃 성공했습니다.');");
out.print("location.href='index.jsp';");
//새로운 요청이 서버로전달되면 새로운 JSESSIONID 값을 클라이언트에게 준다.
out.print("</script>");
%>
</body>
</html>