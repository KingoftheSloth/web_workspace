<%@page import="sample.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="sample.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 처리  -->
<%
	ProductDao dao = ProductDao.getProductDao();
	List<ProductDto> list = dao.getProducts();
	/* jsp:usebean(scope='request') 와 jsp:forward 태그와 동일한 명령"  */
	request.setAttribute("list",list);
pageContext.forward("mproductListView.jsp");
	
%>
</body>
</html>