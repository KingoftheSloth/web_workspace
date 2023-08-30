<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양신청</title>
</head>
<body>
<hr>
<form action="reserve.jsp" method="post">

    <hr>
    <h3>신청목록</h3>
    <table border="1">
        <tr>
            <th>사진</th>
            <th>상태</th>
            <th>종</th>
            <th>색</th>
            <th>특이사항</th>
            <th>선택</th>
        </tr>
        <% 
        request.setCharacterEncoding("UTF-8");
        String[] photos = request.getParameterValues("photo");
        String[] processStates = request.getParameterValues("processState");
        String[] kinds = request.getParameterValues("kind");
        String[] colors = request.getParameterValues("color");
        String[] specials = request.getParameterValues("special");

        if (photos != null) {
            for (int i = 0; i < photos.length; i++) {
        %>
        <tr>
            <td><img src="<%= photos[i] %>" width="100"></td>
            <td><%= processStates[i] %></td>
            <td><%= kinds[i] %></td>
            <td><%= colors[i] %></td>
            <td><%= specials[i] %></td>
            <td><input type="checkbox" name="checkedItems" value="<%= i %>"></td>
        </tr>
        <input type="hidden" name="photo_<%= i %>" value="<%= photos[i] %>">
        <input type="hidden" name="processState_<%= i %>" value="<%= processStates[i] %>">
        <input type="hidden" name="kind_<%= i %>" value="<%= kinds[i] %>">
        <input type="hidden" name="color_<%= i %>" value="<%= colors[i] %>">
        <input type="hidden" name="special_<%= i %>" value="<%= specials[i] %>">
        <%
            }
        }
        %>
    </table>
    <hr>
    <button type="submit">신청하기</button>
</form>
</body>
</html>
