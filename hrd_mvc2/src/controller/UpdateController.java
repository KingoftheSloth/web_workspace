package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.MemberDao;
import vo.MemberVo;

public class UpdateController implements Controller {
		
		@Override
		public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
			MemberDao dao = MemberDao.getMemberDao();
			MemberVo vo = null;
			int custno = 0;
			
			try {
				custno = Integer.parseInt(request.getParameter("custno"));
				vo = dao.selectOne(custno);
			} 
			catch (SQLException | NumberFormatException e) {
				
			}
			
			request.setAttribute("vo", vo);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("updateView.jsp");
			dispatcher.forward(request, response);
		}	// method end
	}	// Class end

