<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.SaleVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link rel="stylesheet" href="css/list.css">
<link rel="stylesheet" href="css/layout.css">
</head>
<body>
<%@ include  file="top.jsp"%>
	<main>
	<h3>회원 매출조회</h3>
	<div id="sale">
	<table>
		<tr>
		<th>회원번호</th><th>회원성명</th><th>고객등급</th><th>매출</th>
		</tr>
		<c:forEach items="${list }" var="vo">
				<tr>
				<td>${vo.custno }</td>
				<td>${vo.custname }</td>
				<td>${vo.agrade }</td>
				<td>${vo.psum }</td>
				</tr>
		</c:forEach>
	</table>
	</div>
	</main>
	<%@ include file="footer.jsp" %>	
</body>
</html>