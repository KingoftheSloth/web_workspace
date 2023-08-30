<%@page import="sample.dto.Member_Dto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1start.jsp</title>
</head>
<body>
<%
//컬렉션 데이터를 반복문으로 태그 안에 넣어 주기 
String[] names = {"사나","나연","다현","모모","쯔위"};
List<String> list = List.of("사나","나연","다현","모모","쯔위");
Member_Dto dto = new Member_Dto(101111,"김땡땡","010-1111-2222","경기도",null,"A","11");
%>
<h4>배열 names</h4>
<ul>
<%
for(int i =0;i<names.length;i++){ // for 시작
	

%>
<li><%= names[i] %></li>
<% 
} // for 끝 , 자바와는 다르게 한줄이라도 {생략이 안되욤
%>
</ul>
<hr>
<h4>Member DTO</h4>
<table> <!--  출력방향 세로방향 -->
<tr>
<th>번호</th>
<td><%= dto.getCustNo() %></td>
</tr>
<tr>
<th>이름</th>
<td><%= dto.getCustName()%></td>
</tr>
<tr>
<th>전화번호</th>
<td><%= dto.getPhone()%></td>
</tr>
<tr>
<th>주소</th>
<td><%= dto.getAddress() %></td>
</tr>
</table>
<hr style="border: 1px dot gray">
<table> <!-- 출력방향 가로 방향 -->
<tr>
<th>번호</th><th>이름</th><th>전화번호</th><th>주소</th>
</tr>
<tr>
<td><%= dto.getCustNo() %></td>
<td><%= dto.getCustName()%></td>
<td><%= dto.getPhone()%></td>
<td><%= dto.getAddress() %></td>
</tr>


</table>
<!-- 위의 내용을 이용해서 hrd 폴더아래 MemberList.html 을 MemberList.jsp로 완성해보세요
파일은 jsp를 새로 만드시고 필요한 태그는 복사하세요. -->
</body>
</html>