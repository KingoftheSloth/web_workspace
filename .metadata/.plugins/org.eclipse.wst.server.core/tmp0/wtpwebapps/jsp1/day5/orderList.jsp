<%@page import="java.util.List"%>
<%@page import="sample.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderList.jsp</title>
</head>
<body> 
<h3> 고객 주문 현황</h3 > 
<hr> 
<ul> 
<% 
OrderDao dao = OrderDao.getOrderDao(); 
List<String> list = dao.selectOrderByEmail(); 
for (String email : list) { 
%> 
<li><a href = "orderDetail.jsp?email=<%=email%>" ><%=email%></a> 
</li> 
<% 
} 
%> 
</ul > 
</body > 
</html>