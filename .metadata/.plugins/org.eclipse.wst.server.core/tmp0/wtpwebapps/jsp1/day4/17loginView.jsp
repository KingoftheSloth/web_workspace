<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>17loginView.jsp</title>
</head>
<body>
<!-- 패스워드 인증 방법으로  로그인 : id, password 입력 (제일 쉽고 단순)
	 패스워드 평문을 저장하면 정보보호법 위반.
	 첫번째 방법은 평문을 서버가 받으면 해시함수 만들어서 db에 저장 
	 두번째 방법은 '클라이언트(자바스크립트)에서 암호화'된 것을 서버에 보내는 방법
	 									ㄴ 해시함수(단방향. 평문->암호)
	 									ㄴ 공개키방식(양방향 암호화. 평문->암호->평문)
* 패스워드 인증 vs 토큰 인증  -->
<h3>로그인</h3>
<form action="18loginAction.jsp" method="post">
<input type="text" name="userid" placeholder="아이디를 입력하세요."><br>
<input type="password" name="password" placeholder="비밀번호 입력하세요."><br>
<button>로그인</button>
</form>
</body>
</html>