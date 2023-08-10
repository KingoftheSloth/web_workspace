<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- 외부라이브러리로 지원되는 태그를 사용하기 위한 import 입니다.  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listView.jsp-화면 출력 페이지 </title>
</head>
<body>
${list }
<hr>
<ul>
<c:forEach  var="vo" items="${list}">
<li>${vo.custNo }</li> <!-- vo.getCustno() member_dto에 getter가 있어야함 -->
<li>${vo.custName }</li>
<li>${vo.phone }</li>
<li>${vo.address }</li>
<!-- 아래 코드는 없는 필드이므로 오류  -->
<%-- <li>${vo.citycode }</li> --%>
</c:forEach>
</ul>
<%-- <tr>
			<td><c:out value="${vo.custNo}"/></td>
			<td><c:out value="${vo.custName }"/></td>
			<td><c:out value="${vo.phone }"/></td>
			<td><c:out value="${vo.address }"/></td>
			<td><c:out value="${vo.join_date }"/></td>
			<td><c:out value="${vo.grade}"/></td>
			<td><c:out value="${vo.city }"/></td>
		</tr>
		</table>
		</c:forEach> --%>

<!--  request.getAttribute("list") 실행 + List<Member_Dto> 타입변환 + 출력 -->
<!--  출력을 반복해서 테이블 tr 태그에 넣기 : jstl 사용. 애트리뷰트(자바빈)은 자바for로는 못함.-->
</body>
</html>