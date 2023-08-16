<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<header>
		<h2>홈쇼핑 회원관리 ver1.0</h2>
	</header>
	<nav>
		<ul>					
			<li><a href="<%= request.getContextPath() %>/register.hrd">회원등록</a></li>  <!-- 뷰 -> 등록 처리   -->
			<li><a href="<%= request.getContextPath() %>/list.hrd">회원목록조회/수정</a></li> <!--  목록 처리 -> 뷰  -->

			<c:if test="${userid eq null }">  <!-- userid 이름의 애트리뷰트 값이 null 이면 (eq , ==)? -->
				<li><a href="<%= request.getContextPath() %>/login.hrd">로그인</a></li>
			</c:if>

			<c:if test="${userid ne null }">  <!-- userid 이름의 애트리뷰트 값이 null이 아니면(ne , !=) ? -->
				<li><a href="<%= request.getContextPath() %>/sale.hrd">회원매출조회</a></li>
				<li><a href="">${userid } 님 🛒 </a> </li> 
				<li><a href="<%= request.getContextPath() %>/logout.hrd">로그아웃</a></li>
			</c:if>
			<li><a href="<%= request.getContextPath() %>">홈으로.</a></li>
		</ul>	
</nav>
<!-- include 되는 파일에서 지정한 상대 경로는 위치에 따라 오류 
	오류를 없애는 정확한 방법은 절대 경로를 사용. request.getContextPath() 로 시작하여 짖
-->