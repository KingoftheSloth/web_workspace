<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="addAnimalAction.jsp" method="post">
<table >
		<tr>
			<th>사진</th>
			<th>유기번호</th>
			<th>종</th>
			<th>품종</th>
			 <th>중성화여부</th>
            <th>상태</th>
            <th>발생일</th>
            <th>무게</th>
            <th>나이</th>
        </tr>
        <td><input type="file" name="filename"></td>
        <td><input type="text" name="desertionNo"></td>
        <td><input type="text" name="kind"></td>
        <td><input type="text" name="breed"></td>
        <td><input type="checkbox" name="neuterYn" value="Y">중성화됨
        <input type="checkbox" name="neuterYn" value="N">중성화안됨
        <td><input type="text" name="weight"></td>
        <td><input type="text"name="age"></td>
        <td><input type="text"name="processState"></td>
        <td><input type="text"name="happenDt"></td>
        </table>
        <button type=submit>등록하기</button>
        </form>
</body>
</html>