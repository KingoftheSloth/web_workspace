<%@page import="dao.animalDao"%>
<%@page import="dto.Animal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    long desertionNo = Long.parseLong(request.getParameter("desertionNo"));
    Animal animal = animalDao.getInstance().selectByDesertionNo(desertionNo); // 동물 정보 가져오기
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>동물 정보 수정</title>
</head>
<body>
    <h1>동물 정보 수정</h1>
    <form action="AnimalUpdateAction.jsp" method="post">
        <input type="hidden" name="desertionNo" value="<%=animal.getDesertionNo()%>">
        <label>종:</label>
        <input type="text" name="kind" value="<%=animal.getKind()%>"><br>
        <label>품종:</label>
        <input type="text" name="breed" value="<%=animal.getBreed()%>"><br>
        <label>중성화 여부:</label>
        <input type="checkbox" name="neuterYn" value="Y" <%=animal.getNeuterYn().equals("Y") ? "checked" : "" %>>중성화됨
        <input type="checkbox" name="neuterYn" value="N" <%=animal.getNeuterYn().equals("N") ? "checked" : "" %>>중성화안됨<br>
        <!-- 나머지 동물 정보 입력 폼을 추가하시면 됩니다. -->
        <input type="text" name="weight" value="<%=animal.getWeight()%>"><br>
        <label>무게:</label>
         <input type="text" name="age" value="<%=animal.getAge()%>"><br>
        <label>나이:</label>
         <input type="text" name="processState" value="<%=animal.getprocessState()%>"><br>
        <label>상태:</label>
         <input type="text" name="happenDt" value="<%=animal.gethappenDt()%>"><br>
        <label>발생일자:</label>
         <input type="text" name="filename" value="<%=animal.getfilename()%>"><br>
        <label>파일이름:</label>
        <input type="submit" value="수정">
    </form>
</body>
</html>