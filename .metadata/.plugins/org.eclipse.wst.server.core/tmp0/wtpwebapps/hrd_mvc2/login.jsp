<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%@ include file="top.jsp" %>
<main>
	<form action="" method="POST">
		<input name="userid">
		<input type="password" name="password">
		<button>로그인</button>
	</form>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>