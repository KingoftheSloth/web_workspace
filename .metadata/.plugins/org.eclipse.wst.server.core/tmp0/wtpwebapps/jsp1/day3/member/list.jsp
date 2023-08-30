<%@page import="sample.dto.Member_Dto"%>
<%@page import="java.util.List"%>
<%@page import="sample.dao.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp - 요청처리 기능</title>
<style>
td{
border : 1px solid black;
}
</style>
</head>
<body>
<%
Member_Dao dao = Member_Dao.getMemberDao();
List<Member_Dto> list = dao.selectAll();

//list 를 저장하는 애트리뷰트 
request.setAttribute("list",list);
// 요청을 listView(화면출력)로 전달하기
// -> list를 list.jsp 와 listView.jsp 가 공유하게 됩니다. 
pageContext.forward("listView.jsp");

%>
</body>
</html>