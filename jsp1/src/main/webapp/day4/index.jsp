<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
<h3>메인 Main</h3>
<hr>
<c:if test="${user !=null }">
	<h4><c:out value="${user.name }"/> 님 환영합니다.</h4>
	<a href="logout.jsp">로그아웃</a>
</c:if>
<c:if test="${user ==null }">
	<a href="17loginView.jsp">로그인</a>
</c:if>
<!-- 로그인 여부와 상관없이 항상 보이는 메뉴 -->
	<a href="#">커뮤니티</a>
</body>
</html>