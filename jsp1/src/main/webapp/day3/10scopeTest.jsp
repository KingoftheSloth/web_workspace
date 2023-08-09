<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10scopeTest.jsp</title>
</head>
<body>
<h3>scope 테스트</h3>
<hr>
<h4>application</h4>
<!-- applicationScope에 저장된 appDto 자바빈을 가져오기   -->
<jsp:useBean id="appDto" class= "sample.dto.MyUser" scope="application"/>
<% out.println(appDto); %>
<ul>
<li>${appDto.uname}</li>
<li>${appDto.age}</li>
<li>${appDto.address}</li>
</ul>
<h4>session</h4>
<!-- sessionScope 에 저장된 sessionDto 자바빈을 가져오기 -->
<jsp:useBean id="sessionDto" class= "sample.dto.MyUser" scope="session"/>
<% out.println(sessionDto); %>
<ul>
<li>${appDto.uname}</li> <!--getUname(),getAge(), getter 대신에 필드 이름만 작성.  -->
<li>${appDto.age}</li>
<li>${appDto.address}</li>
</ul>
<h4>????</h4>
jsp:useBean의 기본 scope="page"입니다.
여기서 page는 pageContext입니다.
자바빈 id dto는 12UseBean.jsp에서만 
사용할 수 있습니다.
<jsp:useBean id="dto" class= "sample.dto.MyUser" scope="page"/>
<% out.println(dto); %>

</body>
</html>