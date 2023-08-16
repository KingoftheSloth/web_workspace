package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.MemberDao;

public class RegisterController implements Controller
{ 
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		MemberDao dao = MemberDao.getMemberDao();
		int custno = 0;
		try {custno = dao.nextSeq();} 
		catch (SQLException e) {logger.error("[MyInfo] - {}",e.getMessage());}
		
		request.setAttribute("custno", custno);
		request.setAttribute("now", new Date());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("regView.jsp");
		dispatcher.forward(request, response);
	}	// method end
}	// Class end
