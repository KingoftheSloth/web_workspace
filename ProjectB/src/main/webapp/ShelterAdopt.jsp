<%@page import="projectB.dto.adopt"%>
<%@page import="java.util.List"%>
<%@page import="projectB.dao.animalDao"%>
<%@page import="com.oreilly.servlet.DaemonHttpServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>입양요청</title>
</head>
<body>
<h1>입양요청확인</h1>
<%
    List<adopt> list = animalDao.getInstance().infoAdopt();
%>
<table>
    <tr>
        <th>동물 정보</th>
        <th>유기번호</th>
        <th>방문예약날짜</th>
        <th>동물 ID</th>
        <th>사용자 ID</th>
        <th>확인여부</th>
    </tr>
    <%
        for (adopt item : list) {
            String desertionNo = item.getAniid(); // desertionNo를 동적으로 설정합니다.
    %>
    <tr>
        <td><img src ="<%= item.getFilename() %>" alt=''></td>
        <td><%= item.getAdoptidx()%></td>
        <td><%= item.getAdoptdate()%></td>
        <td><%= item.getAniid()%></td>
        <td><%= item.getUserid()%></td>
        <td><button>예약잡기</button><button>거절하기</button></td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>