package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.MemberDao;
import vo.MemberVo;
// servlet path :/list.hrd, method : GET
public class ListController implements Controller
{
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// dao select list 생성 -> Attribute에 저장 -> listView.jsp에 전달
		MemberDao dao = MemberDao.getMemberDao();
		List<MemberVo> list = null;
		try {list = dao.selectList();} 
		catch (SQLException e) {logger.error("[MyInfo] - {}",e.getMessage());}
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("listView.jsp");
		dispatcher.forward(request, response);
	}	// method end
}	// Class end
