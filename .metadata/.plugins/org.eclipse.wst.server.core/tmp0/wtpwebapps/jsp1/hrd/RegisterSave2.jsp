<%@page import="sample.dao.Member_Dao"%>
<%@page import="sample.dto.Member_Dto"%>
<%@page import="sample.dao.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="sample.dto.Member_Dto"  />    
<jsp:setProperty property="*" name="dto"/>
<hr>
<jsp:getProperty property="custName" name="dto"/><br>
<jsp:getProperty property="phone" name="dto"/><br>
<jsp:getProperty property="address" name="dto"/><br>
<%

out.print(dto);

	//파라미터 값으로 dto 객체 생성
	Member_Dao dao = Member_Dao.getMemberDao();
	dao.insert(dto);		//db 테이블에 반영된 것 확인하세요.
%>
<script type="text/javascript">
alert('회원 등록이 완료되었습니다.')
location.href='MemberList.jsp'
</script>