<%@page import="sample.dto.Member_Dto"%>
<%@page import="sample.dao.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 관리</title>
<link rel="stylesheet" href=../../css/Layout2.css?v=3></link>
<link rel="stylesheet" href=../../css/memberRegister_Upd.css?v=3></link>
<title>Insert title here</title>
</head>
<body>
	<header>
		<h2>쇼핑몰 회원 관리 ver1.0</h2>
	</header>
	<nav>
		<ul>
			<li><a href="memberRegister.html">회원등록</a></li>
			<li><a href="memberUpdate.html">회원목록조회/수정</a></li>
			<li><a href="memberSales.html">회원매출조회</a></li>
			<li><a href="index.html">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<h3>홈쇼핑 회원 수정</h3>
		<%-- el을 쓰면  ${}는 getAttribute() 역할을 합니다. --%>
		<%-- <jsp:useBean id="member" scope="request"/> --%>
	
		<form action="UpdateSave.jsp" method="post">
			<table>
				<tr>
					<td><label for="lblNum">회원번호(자동발생)</label></td>
					<!-- param은 getParameter() 동작의 el 에서 사용하는 객체입니다.  -->
					<td><input size="15" type="text" id="lblNum"
						value="${param.custno}" name="cusNo" disabled>
						<input type="hidden" name="custNo" value="${param.custno}">
						<!--disabled로 설정된 것은 파라미터 전달이 안됩니다. readonly로 바꾸세요.  -->
						</td>
				</tr>
				<tr>
					<td><label for="lblName">회원성명</label></td>
					<td><input size="15" type="text" id="lblName"
						value="${member.custName}" name="custName"></td>
				</tr>
				<tr>
					<td><label for="lblPhone">회원전화</label></td>
					<td><input size="30" type="text" id="lblPhone"
						value="${member.phone }" name="phone"></td>
				</tr>
				<tr>
					<td><label for="lblAdd">회원주소</label></td>
					<td><input size="40" type="text" id="lblAdd"
						value="${member.address}" name="address"></td>
				</tr>
				<tr>
					<td><label for="lblreg">가입일자</label></td>
					<td><input size="15" type="text" id="lblreg"
						value="${member.join_date }" name="join_date"></td>
				</tr>
				<tr>
					<td><label for="lblgrade">고객등급[A:VIP,B:일반,C:직원]</label></td>
					<td><input size="15" type="text" id="lblgrade"
						value="${member.grade }" name="grade"></td>
				</tr>
				<tr>
					<td><label for="lblccode">도시코드</label></td>
					<td><input size="15" type="text" id="lblccode"
						value="${member.city }" name="city"></td>
				</tr>
				<tr>
					<td colspan="2"><button>수정</button>
						<button type="button" onclick="location.href='MemberList.jsp'">조회</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<h4>HRDKOREA Copyright &copy;2022 All rights reserved. Human
			Resources Development Service of Korea.</h4>
	</footer>

</body>
</html>