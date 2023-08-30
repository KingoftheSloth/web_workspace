<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>9useBean.jsp</title>
</head>
<body>
<!-- 자바빈을 생성하는 액션태그 입니다. -->
<jsp:useBean id="dto" class="sample.dto.MyUser"></jsp:useBean>
<!-- 위에서 생성된 자바빈에 프로퍼티(클래스의 변수) 값을 저장
	 getParameter 와 setXXXX 메서드를 실행합니다. 
  -->
  <!-- name="dto"는 useBean 태그의 id 값으로 정합니다. -->
 <jsp:setProperty property="uname" name="dto" param="myname"/>
 myuser 이름 : <jsp:getProperty property="uname" name="dto"/>
 <!-- getXXX 메서드 역할 -->
 
 <jsp:setProperty property="age" name="dto" param="age"/>
 나이 : <jsp:getProperty property="age" name="dto"/>
 
 <jsp:setProperty property="address" name="dto" param="address"/>
 주소 : <jsp:getProperty property="address" name="dto"/>
 
</body>
</html>