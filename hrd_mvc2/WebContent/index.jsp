<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   <!-- JSP 를 위한 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외부평가 홈쇼핑 - Index </title>
<link rel="stylesheet" href="css/layout.css">
</head>
<body>
<!-- header,nav,footer,main,section 레이아웃 태그는 기능은 없고 태그의 이름에 
	 의미를 갖습니다.
	 jsp:include 는 컴파일 된것을 끼워 넣기 
	 지시자 include는 소스코드 끼워 넣기 
 -->
	<%@ include  file="top.jsp"%>
	<div style="clear: left;">
	</div>
	<main>
		<h3>쇼핑몰 회원관리 프로그램</h3>
		<p>쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리
		프로그램을 작성하는 프로그램이다. <br>
		<strong> list.jsp와 sale.jsp 로 MVC 모델1을 적용하면서 <br>
		서블릿, 스프링과 유사하게 처리되도록 Controller 역할을 하는 jsp를 만들었습니다.
		</strong></p>
		<ol>
			<li>회원 정보 테이블을 생성한다.</li>
			<li>매출 정보 테이블을 생성한다.</li>
			<li>회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li>회원정보 입력 화면프로그램을 작성한다</li>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </li>
			<li>회원정보 조회 프로그램을 작성한다.</li>
			<li>회원매출정보 조회 프로그램을 작성한다</li>
		</ol>
		
	</main>
	<%@ include file="footer.jsp" %>	
</body>
</html>