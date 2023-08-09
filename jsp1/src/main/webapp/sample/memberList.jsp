<%@page import="sample.dto.Member_Dto"%>
<%@page import="java.util.List"%>
<%@page import="sample.dao.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sample JSP</title>
</head>
<body>
<%
/* 스크립트릿 : 자바 코드가 들어갈 수 있는 기호.  */
Member_Dao dao = Member_Dao.getMemberDao();
List<Member_Dto> list = dao.selectAll();


%>
<h3>회원목록</h3>
<%= list %><!-- 표현식 : 변수, 수식등 리턴값이 있는 것들.  -->
</body>
</html>