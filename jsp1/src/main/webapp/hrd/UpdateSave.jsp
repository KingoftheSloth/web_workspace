<%@page import="java.sql.Date"%>
<%@page import="sample.dto.Member_Dto"%>
<%@page import="sample.dao.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


request.setCharacterEncoding("UTF-8");
String temp = request.getParameter("custNo");

String name = request.getParameter("custName");

String phone = request.getParameter("phone");

String address = request.getParameter("address");

String join_date = request.getParameter("join_date");

String grade = request.getParameter("grade");

String city = request.getParameter("city");

//파라미터 값으로 dto 객체 생성
int custno = 0;
if(temp !=null)
	custno = Integer.parseInt(temp);

Member_Dao dao = Member_Dao.getMemberDao();
Member_Dto dto = 
new Member_Dto(custno,name,phone,address,null,grade,
		city);

dao.update(dto);

//수정한 후에 alert 이 나와야 합니다.
out.print("<script>");
out.print("alert('회원 정보 수정이 완료되었습니다.');");
out.print("location.href='MemberList.jsp';");
out.print("</script>"); 
%>
<!-- RegisterSave.jsp에는 script 태그를 아래 라인에 작성해 보세요. -->
<script type ="text/javascript">
/* alert('테스트')
location.href='MemberList.jsp' */
</script>