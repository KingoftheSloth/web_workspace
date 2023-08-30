<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 외부라이브러리로 지원되는 태그를 사용하기 위한 import 입니다.  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listView.jsp-화면 출력 페이지</title>
<!-- 아래 href 의 주소는 애플리케이션 이름(context)를 기준으로 하는 절대 주소 입니다.  -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Layout2.css?v=3">
<!-- el로 표기할 때에는 현재 페이지의 request를 가져와야 합니다. (pageContext.request)-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MemberList.css?v=3">
</head>
<body>
	<header>
		<h2>쇼핑몰 회원 관리 ver1.0</h2>
	</header>
	<nav>
		<ul>
			<li><a href="${pageContext.request.contextPath}/hrd/MemberRegister.jsp">회원등록</a></li>
			<li><a href="${pageContext.request.contextPath}/hrd/MemberRegister.jsp">회원목록조회/수정</a></li>
			<li><a href="${pageContext.request.contextPath}/hrd/memberSales.html">회원매출조회</a></li>
			<li><a href="${pageContext.request.contextPath}/hrd/index.html">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<h2>회원목록조회/수정</h2>
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
			<c:forEach var="vo" items="${list}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/hrd/MemberRegister.jsp"> 
					<c:out value="${vo.custNo}" /></a></td>
					<td><c:out value="${vo.custName }" /></td>
					<td><c:out value="${vo.phone }" /></td>
					<td><c:out value="${vo.address }" /></td>
					<td><c:out value="${vo.join_date }" /></td>
					<!-- 문자열 메서드 연산은 fn 을 이용해서 해야하나. 
				 동등비교는 eq 또는 ne 연산으로 할 수 있습니다. -->
					<c:if test="${vo.grade eq 'VIP' }">
						<td>
						<span style="color:red;">VIP</span>
						</td>
					</c:if>
					<c:if test="${vo.grade ne 'VIP' }">
						<td>
						<c:out value="${vo.grade }" />
						</td>
					</c:if>
					<td><c:out value="${vo.city }" /></td>
				</tr>
			</c:forEach>
		</table>
		<!--  request.getAttribute("list") 실행 + List<Member_Dto> 타입변환 + 출력 -->
		<!--  출력을 반복해서 테이블 tr 태그에 넣기 : jstl 사용. 애트리뷰트(자바빈)은 자바for로는 못함.-->
	</section>
	<footer>
		<h4>HRDKOREA Copyright &copy;2022 All rights reserved. Human
			Resources Development Service of Korea.</h4>
	</footer>
</body>
</html>