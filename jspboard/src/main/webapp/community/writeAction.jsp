<%@page import="java.net.Inet4Address"%>
<%@page import="org.iclass.dao.CommunityDao"%>
<%@page import="org.iclass.dto.BookUser"%>
<%@page import="org.iclass.dto.Community"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정된 내용 db 테이블에 저장하기 -->
<!-- 승희 씨가 만들어준 코드 -->
<%
   request.setCharacterEncoding("UTF-8");   
    BookUser writer = (BookUser) session.getAttribute("user");
   // 아래 작성자는 문제점을 발견하기 위한 추가 사항이고 나중에는 삭제합니다. 아래와 같이하면 세션 비교 코드 필요함. 
	// BookUser writer = (BookUser)request.getAttribute("writer");
    
    String ip = request.getRemoteAddr();
   /*  if(ip.eqauls("127.0.0.1"){
	   Inet4Address ipv4 = Inet4Address.getLocalHost();
	   ip = ipv4.getHostAddress();
   } */
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    CommunityDao dao = CommunityDao.getInstance();
    long idx = dao.insert(Community.builder()
            .writer(writer.getId()) 
 // 		.writer(writer)
            .title(title)
            .content(content)
            .ip(null)
            .build());
%>
<script type="text/javascript">
   alert('글 등록이 완료되었습니다.')
   location.href='list.jsp'
</script>
