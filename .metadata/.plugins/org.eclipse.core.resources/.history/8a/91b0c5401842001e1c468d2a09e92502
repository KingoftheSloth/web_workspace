<%@page import="org.iclass.dto.CommunityComments"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.CommunityCommentsDao"%>
<%@page import="org.iclass.dto.Community"%>
<%@page import="org.iclass.dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int idx=0;
int pageNo = 0; //페이지 번호를 받는 이유는 다음에 돌아가기 버튼에서 사용하기 위해서
if(request.getParameter("idx") !=null){
	idx = Integer.parseInt(request.getParameter("idx"));
	
}

if(request.getParameter("page")!= null){
	 pageNo = Integer.parseInt(request.getParameter("page"));
	 }
CommunityDao dao = CommunityDao.getInstance();
dao.setReadCount(idx);
Community vo = dao.selectByIdx(idx);

//(1)
request.setAttribute("vo", vo);
//(2)
request.setAttribute("page",pageNo);


//(3) 댓글 목록 전달하기
CommunityCommentsDao cmtdao = CommunityCommentsDao.getInstance();
List<CommunityComments> cmtlist = cmtdao.commentsList(idx);

request.setAttribute("cmtlist", cmtlist);

pageContext.forward("readView.jsp");
%>