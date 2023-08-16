<%@page import="java.util.List"%>
<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
<link rel="stylesheet" href="css/list.css">
<link rel="stylesheet" href="css/layout.css">
</head>
<body>
	<%@ include file="top.jsp"%>
	<!-- jsp 지시자 include 는 file속성으로 지정된 파일을 포함(단순 복붙) -->
	<main>
		<h3>회원목록조회/수정</h3>
		<div id="list">
			<table>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
				</tr>
				<c:forEach items="${list }" var="vo">
					<tr>
						<%-- <td><%= vo.getCustno() %></td>  --%>
						<!-- updateView.jsp로 custno 파라미터 넘겨주는 링크 -->
						<td><a href="update.hrd?custno=${vo.custno }">
								${vo.custno }</a></td>
						<td>${vo.custname }</td>
						<td>${vo.phone }</td>
						<td>${vo.address }</td>
						<td>${vo.joindate }</td>
						<td>${vo.grade }</td>
						<td>${vo.city }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</main>
	<%@ include file="footer.jsp"%>
</body>
</html>