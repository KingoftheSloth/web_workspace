<%@page import="sample.dto.Member_Dto"%>
<%@page import="sample.dao.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 관리</title>
<link rel="stylesheet" href=../hrd/Layout2.css?v=3></link>
<link rel="stylesheet" href=../hrd/memberRegister_Upd.css?v=3></link>
<title>Insert title here</title>
</head>
<body>
	<!-- 정보 수정화면은 현재값을 먼저 보여주고 수정할 수 있게 합니다. custno ,
즉 PK 값으로 db에서 select한 결과를 화면에 표시하는 코드가 필요 합니다. -->
	<!-- MemberList.jsp 에서 보낸 파라미터를 받아 custno 변수에 저장합니다. 그리고 value에서 출력하기  -->
	<%
	String custno = request.getParameter("custno");
	Member_Dao dao = Member_Dao.getMemberDao();
	Member_Dto dto = null;
	if (custno != null) /* 수정할 데이터를 가져오기. (참고 :custno가 테이블의 PK 값)  */
		dto = dao.selectOne(Integer.parseInt(custno));
	%>
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
		<h2>홈쇼핑 회원 수정</h2>
		<!-- action은 input 데이터를 전달받고 처리할 URL 입니다.  
	MemberSave.jsp를 만드세요. 그리고 전달받은 파라미터로 update를 실행하도록 하세요 
	ㄴ 이 파일에는 자바코드 만 작성하고 태그는 필요 없습니다. 
	MemeberUpdate.jsp 에서 보내는 파라미터의 이름은 input 태그의 name 속성입니다. -->
		<form action="UpdateSave.jsp" method="post">
		<!-- 이후 자바코드 작성 할 떄 가독성, 편리성을 위해 input 태그의 name이름은 dto클래스 변수명과 
		동일하게 하세요. UpdateSave.jsp 의 파라미터 저장변수도 DTO랑 동일하게 하세요.   -->
			<table>
				<tr>
					<td><label for="lblNum">회원번호(자동발생)</label></td>
					<td><input size="15" type="text" id="lblNum"
						value="<%=custno%>" name="cusNo" disabled>
						<input type="hidden" name="custNo" value="<%=custno%>">
						<!--disabled로 설정된 것은 파라미터 전달이 안됩니다. readonly로 바꾸세요.  -->
						</td>
				</tr>
				<tr>
					<td><label for="lblName">회원성명</label></td>
					<td><input size="15" type="text" id="lblName"
						value="<%=dto.getCustName() %>" name="custName"></td>
				</tr>
				<tr>
					<td><label for="lblPhone">회원전화</label></td>
					<td><input size="30" type="text" id="lblPhone"
						value="<%=dto.getPhone()%>" name="phone"></td>
				</tr>
				<tr>
					<td><label for="lblAdd">회원주소</label></td>
					<td><input size="40" type="text" id="lblAdd"
						value="<%=dto.getAddress()%>" name="address"></td>
				</tr>
				<tr>
					<td><label for="lblreg">가입일자</label></td>
					<td><input size="15" type="text" id="lblreg"
						value="<%=dto.getJoin_date()%>" name="join_date"></td>
				</tr>
				<tr>
					<td><label for="lblgrade">고객등급[A:VIP,B:일반,C:직원]</label></td>
					<td><input size="15" type="text" id="lblgrade"
						value="<%=dto.getGrade()%>" name="grade"></td>
				</tr>
				<tr>
					<td><label for="lblccode">도시코드</label></td>
					<td><input size="15" type="text" id="lblccode"
						value="<%=dto.getCity()%>" name="city"></td>
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