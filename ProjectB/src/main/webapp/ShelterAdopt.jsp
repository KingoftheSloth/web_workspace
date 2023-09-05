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
    </tr>
    <%
        for (adopt item : list) {
            String desertionNo = item.getAniid(); // desertionNo를 동적으로 설정합니다.
    %>
    <tr>
        <td>
            <!-- 이 부분은 동물 정보를 표시할 div 요소입니다. id를 연결합니다. -->
            <div class="adopt" data-desertion-no="<%= desertionNo %>">
                <!-- 이 부분에 API 정보를 출력합니다. -->
                <div id="animalDetails_<%= desertionNo %>"></div>
            </div>
        </td>
        <td><%= item.getAdoptidx()%></td>
        <td><%= item.getAdoptdate()%></td>
        <td><%= item.getAniid()%></td>
        <td><%= item.getUserid()%></td>
    </tr>
    <%
        }
    %>
</table>

<script type="text/javascript" src="./js/checkReserveData.js"></script>
</body>
</html>