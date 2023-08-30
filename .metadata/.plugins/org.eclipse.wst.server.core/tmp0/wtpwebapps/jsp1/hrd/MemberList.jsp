<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sample.dao.Member_Dao"%>
<%@page import="sample.dto.Member_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 관리</title>
<link rel="stylesheet" href="../hrd/Layout2.css?v=3">
<link rel="stylesheet" href="../hrd/MemberList.css?v=3">
</head>
<body>
<header>
<%
Member_Dao dao = Member_Dao.getMemberDao();
List<Member_Dto> list = dao.selectAll();
//list를 태그에 출력하는 반복문은 향상for문 사용합시다.
%><% %>
<h2>쇼핑몰 회원 관리 ver1.0</h2></header>
<nav>
<ul>
<li><a href="MemberRegister.jsp">회원등록</a></li>
<li><a href="MemberRegister.jsp">회원목록조회/수정</a></li>
<li><a href="memberSales.html">회원매출조회</a></li>
<li><a href="index.html">홈으로</a></li>
</ul>
</nav>
<section>
<h2>회원목록조회/수정</h2>
<table>
<tr>
<th>회원번호</th><th>회원성명</th><th>전화번호</th><th>주소</th><th>가입일자</th><th>고객등급</th><th>거주지역</th>
</tr>
<tr>
<%
//list.get(i).getCustno()처럼 인덱스 쓰지말고 향상 for문
for(Member_Dto member : list){
%>
<td><a href = "MemberUpdate.jsp?custno=<%=member.getCustNo() %>">
<%= member.getCustNo() %></a></td>
<td><%= member.getCustName() %></td>
<td><%= member.getPhone()%></td>
<td><%= member.getAddress() %></td>
<td><%= member.getJoin_date() %></td>
<!--스크립트릿, 표현식 자바코드 주석기호는 아래와 같습니다.  -->
<%-- <td><%= member.getGrade() %></td> --%>
<!--스크립트릿 자바코드 위치는 body 안에 어디에나 가능합니다. -->
<td>
<!-- out:jsp 객체.html 문서에 출력기능을 갖고 텍스트와 태그를 출력합니다.
		 따로 선언하지 않고 사용하는 내장(embeded) 객체입니다. >  -->
<%
if(member.getGrade().equals("VIP"))
	out.println("<span style = 'color:red;'>VIP</span>");
	else
		out.println(member.getGrade());

%></td>
<td><%= member.getCity() %></td>
</tr>
<%
}
%>
</table>
</section>
<footer>
<h4>HRDKOREA Copyright &copy;2022 All rights reserved. Human
			Resources Development Service of Korea.</h4>
</footer>
</body>
</html>