<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.iclass.dao.CommunityDao"%>
<%@page import="org.iclass.dto.Community"%>
<%@page import="org.iclass.dto.BookUser"%>
<%@page import="org.iclass.dao.BookUserDao"%>
<%


Long idx = Long.parseLong((request.getParameter("idx")));


CommunityDao dao = CommunityDao.getInstance();



int result = dao.delete(idx);
if(result ==1){
request.setAttribute("message", "글 삭제가 완료되었습니다.");
response.sendRedirect("list.jsp");
}

	%>
	
</body>		