<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록보기</title>
</head>
<body>
<h3>멀티 상품 목록</h3>
<hr>
<a href="muploadForm.jsp">상품 등록</a>
<c:forEach items="${list}" var="dto">
<div style ="width: 500px; height: auto; border: 1px solid gray">
<c:out value="${dto.pname }"/>
<c:out value="${dto.price }"/>
<c:out value="${dto.picture }"/>
<!-- 상품 이미지는 img 태그에서 표시 서버폴더 d:\\iclass0419\\upload 경로명 src는 url이 필요합니다. 톰캣 server.xml 에 경로에 대한 url 지정하기  -->
<!-- picture 파일명이, 로 구분된 문자열(배열과 유사) -->
<c:forTokens items="${dto.picture }" delims="," var="file">
<img alt = "${file }" src="/upload/${file}" style="width : 100%;">
</c:forTokens>
</div>
</c:forEach>


</body>
</html>