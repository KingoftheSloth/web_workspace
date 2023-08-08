<%@page import="sample.dto.Member_Dto"%>
<%@page import="sample.dao.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userInfo" class="sample.dto.Member_Dto" scope="session" />
<jsp:setProperty property="custName" name="userInfo"/>
이름:<jsp:getProperty property="custName" name="userInfo"/>

<%
//파라미터 가져오기
request.setCharacterEncoding("UTF-8");

String temp = request.getParameter("customNo");

String phone = request.getParameter("phoneNum");
out.println(phone); //테스트용 출력

String name = request.getParameter("name");
out.println(name); //테스트용 출력

String addr = request.getParameter("addr");
request.setCharacterEncoding("UTF-8");
out.println(addr); //테스트용 출력

String regidate = request.getParameter("regidate");
out.println(regidate); //테스트용 출력

String grade = request.getParameter("grade");
out.println(grade); //테스트용 출력

String cityCode = request.getParameter("cityCode");
out.println(cityCode); //테스트용 출력


//파라미터 값으로 dto 객체 생성
Member_Dao dao = Member_Dao.getMemberDao();
int custno = 0;
if (temp !=null)
	custno = Integer.parseInt(temp);
Member_Dto dto = new Member_Dto(custno,phone,name,addr,null,grade,cityCode);
dao.insert(dto); //db 테이블에 반영된 것 확인하세요.

%>