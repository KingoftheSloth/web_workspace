<%@page import="projectB.dao.animalDao"%>
<%@page import="projectB.dto.adopt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String aniid = request.getParameter("desertionNo");
String adoptDate= request.getParameter("selectedDate");
String filename = request.getParameter("filename");

adopt dto = adopt.builder() 
.adoptdate(adoptDate).aniid(aniid).userid("test").filename(filename).build();
animalDao.getInstance().insertMeeting(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청 완료</title>
</head>
<body>
<script>
// 신청이 완료되었습니다. 메시지 표시
alert('신청이 완료되었습니다.');

// 첫 페이지로 리디렉션
window.location.href = 'listAnimal.jsp';
</script>
console.log(<%=filename%>)
</body>
</html>

