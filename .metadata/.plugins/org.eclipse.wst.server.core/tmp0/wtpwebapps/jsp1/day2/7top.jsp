<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7top.jsp</title>
</head>
<body>
<h4>top - header</h4>
<%
String name = request.getParameter("username");
out.print(name);
%>
<hr>
</body>
</html>