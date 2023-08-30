<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양신청</title>
</head>
<body>
<h1>방문날짜를 선택하세요</h1>
<hr>
<form action="confirmation.jsp" method="post">
    <label><input type="date" name="visitDate"></label>

    <hr>
    <h3>신청목록</h3>
    <table border="1">
        <tr>
            <th>사진</th>
            <th>상태</th>
            <th>종</th>
            <th>색</th>
            <th>특이사항</th>
        </tr>
        <% 
        request.setCharacterEncoding("UTF-8");
        String[] photos = request.getParameterValues("photo");
        String[] processStates = request.getParameterValues("processState");
        String[] kinds = request.getParameterValues("kind");
        String[] colors = request.getParameterValues("color");
        String[] specials = request.getParameterValues("special");
        String[] checkedItems = request.getParameterValues("checkedItems"); // 체크한 아이템의 인덱스 배열

        if (checkedItems != null && photos != null) {
            for (String checkedItem : checkedItems) {
                int index = Integer.parseInt(checkedItem);
        %>
        <tr>
            <td><img src="<%= photos[index] %>" width="100"></td>
            <td><%= processStates[index] %></td>
            <td><%= kinds[index] %></td>
            <td><%= colors[index] %></td>
            <td><%= specials[index] %></td>
        </tr>
        <input type="hidden" name="checkedItems" value="<%= index %>"> <!-- 선택한 아이템의 인덱스를 숨겨서 전달 -->
        <input type="hidden" name="photo_<%= index %>" value="<%= photos[index] %>">
        <input type="hidden" name="processState_<%= index %>" value="<%= processStates[index] %>">
        <input type="hidden" name="kind_<%= index %>" value="<%= kinds[index] %>">
        <input type="hidden" name="color_<%= index %>" value="<%= colors[index] %>">
        <input type="hidden" name="special_<%= index %>" value="<%= specials[index] %>">
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
