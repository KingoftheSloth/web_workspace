<%@page import="org.iclass.dto.BookUser"%>
<%@page import="org.iclass.dto.Community"%>
<%@page import="org.iclass.dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
BookUser user = (BookUser)session.getAttribute("user");
if(user==null)
	throw new IllegalAccessException();
/* IllegalAccessException 은 일반적으로 임의의 Exception 발생 시킬 때 많이 씁니다. 
 new Excpetion도 가능 */

int idx=0;
int pageNo = 0; //페이지 번호를 받는 이유는 다음에 돌아가기 버튼에서 사용하기 위해서
if(request.getParameter("idx") !=null){
	idx = Integer.parseInt(request.getParameter("idx"));
	
}

if(request.getParameter("page")!= null){
	 pageNo = Integer.parseInt(request.getParameter("page"));
	 }
CommunityDao dao = CommunityDao.getInstance();
Community vo = dao.selectByIdx(idx); /* idx글 조회하기 */

if(!user.getId().equals(vo.getWriter())) /*  로그인한 사용자와 글쓴이가 다를 떄  이 부분도 필터로 보낼 수 있지만, 페이지를 한개만 설정해야되서 여기다가 작성*/
	throw new IllegalAccessException(); 

//(1)
request.setAttribute("vo", vo);
//(2)
request.setAttribute("page",pageNo);

pageContext.forward("updateView.jsp");

%>



%>
</body>
</html>