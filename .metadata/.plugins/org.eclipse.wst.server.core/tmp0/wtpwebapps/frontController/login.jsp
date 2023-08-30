<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h3>로그인 Sign-in</h3>
<form action="login" method="post">
	<input type="text" name="id" value="hong">
	<input type="password" name="password">
	<button>로그인</button>
</form>
<!-- 
GET : url 에 입력파라미터가 쿼리스트링으로 보입니다.
POST : url 에 포함되지 않고 request 몸체(body data) 로 전달.
*전달한수 있는 데이터의 크기가 GET 은 제한적. POST 는 무제한.(설정은 톰캣. 기본이 2MB)
 -->
</body>
</html>