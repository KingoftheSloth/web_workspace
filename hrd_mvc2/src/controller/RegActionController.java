package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;
// path : /register.hrd  , method:POST
public class RegActionController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MemberVo vo = new MemberVo(Integer.parseInt(request.getParameter("custno")),
							request.getParameter("custname"),
							request.getParameter("phone"),
							request.getParameter("address"),
							null,
							request.getParameter("grade"),
							request.getParameter("city"));
		MemberDao dao = MemberDao.getMemberDao();
		int result=0;
		try {
			result = dao.insert(vo);
		} catch (SQLException e) {
		}
		
		//response 에 출력할 객체 생성
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		if(result==1) {
			out.print("alert('회원 등록을 완료했습니다.');");
		}else {
			out.print("alert('회원 등록 문제가 발생했습니다.');");
		}
		out.print("location.href='list.hrd'");
		out.print("</script>");

	}

}
