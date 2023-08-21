<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.iclass.dao.CommunityDao"%>
<%@page import="org.iclass.dto.Community"%>
<%@page import="org.iclass.dto.BookUser"%>
<%@page import="org.iclass.dao.BookUserDao"%>
<%
request.setCharacterEncoding("UTF-8");
String ip = request.getRemoteAddr();
Long idx = Long.parseLong((request.getParameter("idx")));
String title = request.getParameter("title");
String content = request.getParameter("content");
String pageNO = request.getParameter("page");


Community vo = Community.builder()
					.idx(idx)
					.title(title)
					.content(content)
					.ip(ip)
					.build();

CommunityDao dao = CommunityDao.getInstance();
int result = dao.update(vo);
if(result ==1){
request.setAttribute("message", "글 수정이 완료되었습니다.");
request.setAttribute("url","read.jsp?idx="+idx + "&page="+pageNO);
pageContext.forward("alert.jsp");
	
}
	%>
</body>		