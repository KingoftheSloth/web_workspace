<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   <!-- JSP 를 위한 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>
<h3>회원 수정</h3>
<p>${custno} 회원 수정 페이지 입니다.</p>
<form action="save" method="post">
<!-- hidden : 화면에는 숨김. 파라미터 값은 전달. -->
	<input type="hidden" name="func" value="2">
	<input type="text" name="username" value="${custno }">
	<input type="text" name = "id" placeholder="id 입력하세요."> <br>
	<input type="text" name = "name" placeholder="이름 입력하세요."><br>
	<input type="text" name = "age" placeholder="나이 입력하세요."><br>
	<input type="text" name = "address" placeholder="주소 입력하세요."><br>
	<button>수정</button>
	<button type="button" onclick="location.href='list'">목록</button>
</form>

<a href="../">홈</a>
</body>
</html>