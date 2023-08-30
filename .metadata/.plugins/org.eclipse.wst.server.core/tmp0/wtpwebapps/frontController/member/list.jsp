<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/test.css">
<script type="text/javascript" src="../js/test.js"></script>
<title>회원목록</title>
</head>
<body>
<h3>회원 목록</h3>
<p>${hello}</p>   <!-- request의 hello 이름의 애트리뷰트 가져오기 : 표현식 출력기호 사용-->
<a href="../">홈1</a>

<ul>
<!-- 무엇을 클릭하나에 따라 uri는 /member/update 이지만 파라미터 custno 는 다른값을 전달하기 (GET) -->
	<li><a href="update?custno=10001">10001</a></li>
	<li><a href="update?custno=10002">10002</a></li>
	<li><a href="update?custno=10003">10003</a></li>
	<li><a href="update?custno=10004">10004</a></li>
	<li><a href="update?custno=10005">10005</a></li>
</ul>
<img alt="test" src="9.jpg">
<img alt="test" src="RegEx3.png">
</body>
</html>