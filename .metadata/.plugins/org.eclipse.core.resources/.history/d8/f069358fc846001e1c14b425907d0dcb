<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="dao.animalDao"%>
<%@page import="dto.Animal"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보호소 동물정보 관리 페이지</title>
</head>
<h1>동물정보관리</h1>
<hr>
<body>
	<h1>Animal List</h1>
	<button>등록하기</button>
	<form action="AnimalUpdate.jsp" method="post">
	<table border="1">
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
            <th>정보수정</th>
        </tr>
        <%
        try {
        	List<Animal> animalList = animalDao.getInstance().selectAll();
        	for (Animal animal : animalList) {
        %>
        <tr>
            <td><img src=<%=animal.getFilename()%>
				alt="Animal Image" width="100" height="100"></td>
            <td><%=animal.getDesertionNo()%></td>
            <td><%=animal.getKind()%></td>
            <td><%=animal.getBreed()%></td>
            <td><%=animal.getNeuterYn()%></td>
            <td><%=animal.getProcessState()%></td>
            <td><%=animal.getHappenDt()%></td>
            <td><%=animal.getWeight()%></td>
            <td><%=animal.getAge()%></td>
            <td><button onclick="location.href='AnimalUpdate.jsp'">수정하기</button>
            </td>
        </tr>
        <%
        }
        } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        }
        %>
    </table>
    </form>
</body>
<script type="text/javascript">
	
</script>
</html>
