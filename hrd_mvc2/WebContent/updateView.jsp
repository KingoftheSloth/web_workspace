<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   <!-- JSP 를 위한 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외부평가 쇼핑몰 - 회원정보 수정</title>
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/reg.css">
</head>
<body>
<c:if test="${empty vo }">  <!-- null 비교와 동일하게 동작 -->
	<script type="text/javascript">
		alert("잘못된 요청 또는 파라미터 입니다.");
		location.href='list.hrd';
	</script>
</c:if>
<c:if test="${vo != null }">
		<%@ include  file="top.jsp"%>
	<main>
		<h3>홈쇼핑 회원 정보수정</h3>
		<form action="" method="POST"> 
		<table>
			<tr>
				<td>회원번호(자동발생)</td>
				<td>
				<input type="text" name="custno" value="${vo.custno }" >
				</td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td>
				<input type="text" name="custname" value="${vo.custname }" >
				</td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td>
				<input type="text" name="phone" size="30" value="${vo.phone }">
				</td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td>
				<input type="text" name="address" size="40" value="${vo.address }">
				</td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td>
				<input type="text" name="regDate" value="${vo.joindate }" disabled>
				</td>
			</tr>
			<tr>
				<td>고객등급[A:VIP,B:일반,C:직원]</td>
				<td>
				<input type="text" name="grade" value="${vo.grade }" >
				</td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td>
				<input type="text" name="city" value="${vo.city }">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="func_valid()">수정</button> 
										 <!-- 유효성 검사 후 submit -->
					<button type="button">조회</button>  <!-- 일반버튼 -->
				</td>
			</tr>
		</table>
		</form>
	</main>
<script type="text/javascript" src="js/update.js"></script>	
</c:if>
<%@ include file="footer.jsp" %>
</body>
</html>