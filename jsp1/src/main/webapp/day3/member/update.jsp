<%@page import="sample.dto.Member_Dto"%>
<%@page import="sample.dao.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
<%
	String temp = request.getParameter("custno");
	Member_Dao dao = Member_Dao.getMemberDao();
	Member_Dto dto = null;
	if (temp == null)	temp = "100004";
	dto = dao.selectOne(Integer.parseInt(temp));

	//jsp:useBean scope="request" 와 동일한 메서드 입니다. 자바빈id="member"
	request.setAttribute("member",dto);
	
	//jsp:forward page="updateView.jsp"와 동일한 메서드 입니다. 
	pageContext.forward("updateView.jsp");
	%>
</body>
</html>