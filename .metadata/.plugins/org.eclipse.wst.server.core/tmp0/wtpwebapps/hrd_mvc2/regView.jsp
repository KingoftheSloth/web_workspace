<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   <!-- JSP 를 위한 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외부평가 쇼핑몰 - 회원등록</title>
<!-- 외부평가 : 화면이 보통 4~5개. 공통 레이아웃 css -->
<link rel="stylesheet" href="css/layout.css">
<!--  각 화면마다 다르게 적용되는 css -->
<link rel="stylesheet" href="css/reg.css">
</head>
<body>
<%@ include file="top.jsp" %>
	<main>
		<h3>홈쇼핑 회원 등록</h3>
		<form action="" method="POST">
		<table>
			<tr>
				<td>회원번호(자동발생)</td>
				<td>
				<input type="text" name="custno" value="${custno }" readonly>
				</td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td>
				<input type="text" name="custname" >
				</td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td>
				<input type="text" name="phone" size="30">
				</td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td>
				<input type="text" name="address" size="40">
				</td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td>
				<fmt:formatDate value="${now }" pattern="HH:mm:ss" var="regTime"/>
				<input type="text" name="regDate" disabled>  <!-- 자바스트립트 출력 -->
				<!-- 가입 시간 : --> <input type="text"  value="${regTime }" disabled>  
														<!-- fmt 로 시간 출력 테스트 -->
				
				</td>
			</tr>
			<tr>
				<td>고객등급[A:VIP,B:일반,C:직원]</td>
				<td>
				<input type="text" name="grade">
				</td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td>
				<input type="text" name="city">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="func_reg()">등록</button>  
					                      <!-- 유효성 검사 후 submit -->
					<button type="button">조회</button>  <!-- 일반버튼 -->
				</td>
			</tr>
		</table>
		</form>
	</main>
<script type="text/javascript" src="js/reg.js"></script>	
<%@ include file="footer.jsp" %>
</body>
</html>