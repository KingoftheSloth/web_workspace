<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sample.dto.MyUser"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>14beanForward.jsp</title>
</head>
<body>
	<h3>요청 전달 받기</h3>
	<p>13forward.jsp로부터 요청을 전달을 받은 페이지 입니다. *주의 : 실행은 13forward.jsp 에서
		합니다.</p>
	<ul>
		<li>url은 무엇인가요 http://localhost:8081/jsp1/day3/13forward.jsp?</li>
		<li>화면에 표시되는 페이지는 무엇인가요? : 14beanForward.jsp</li>
	</ul>
	<p>요청이 전달 될 때, url은 변경되지 않습니다. 그리고 요청을 전달한 13forward.jsp 의 출력은 버퍼에서
		삭제되므로 화면에 웹페이지에 표시되지 않습니다. 13forward.jsp 에서 jsp:useBean
		scope="request"로 하면 자바빈 데이터가 요청과 함께 전달됩니다.</p>
	<hr>
	<!-- 자바빈을 사용(가져오기)하는 useBean 
	scope="request"를 작성하지 않으면 pageScope에서 reqDto 빈을 찾습니다. 
	pageScope에서는 reqDto 자바빈이 없으므로 null 입니다.-->
	<jsp:useBean id="reqDTO" class="sample.dto.MyUser" scope="request"/>
	이름이야 : <jsp:getProperty property="uname" name="reqDTO"/>
	<br>
	나이야 : <jsp:getProperty property="age" name="reqDTO"/>
	<br>
	주소야 : <jsp:getProperty property="address" name="reqDTO"/>
	<br>
	<% out.print(reqDTO); %>
</body>
</html>