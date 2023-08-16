package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.SaleDao;
import vo.SaleVo;

public class SaleController implements Controller
{
	private static final Logger logger = LoggerFactory.getLogger(SaleController.class);
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//관리자 로그인 후에 매출조회 보기 가능 - 세션의 상태를 애트리뷰트값으로 검사
		HttpSession session = request.getSession();
		Object userid = session.getAttribute("userid");
		String url=null;
		if(userid!=null && ((String)userid).equals("admin"))
		{
			SaleDao dao = SaleDao.getSaleDao();
			List<SaleVo> list = null;
			
			try {
				list = dao.salesTotal();
			}catch (SQLException e) {
				logger.error("[MyInfo] - {}", e.getMessage());
			}
			
			request.setAttribute("list", list);
			url = "saleView.jsp";
		}else {
			url ="auth.jsp"	;	
			//이 소스파일에 자바스크립트 코드는 saleView.jsp에 넣어도 됩니다.(실행은 userid애트리뷰트 null이거나 admin 아닐때)
			//결론 : alert 처리는 서버(서블릿)와 클라이언트(jsp,html) 양쪽에서 가능
		}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
	}	// method end
}	// Class end
/*
 * 인증 authentication: 아이디와 패스워드 일치확인(패스워드 인증) 또는 토큰 인증
 * 인가 authorization : 권한이 있을때만 사용할 수 있도록함.권한확인 후 입장 (예: 관리자 또는 적정한 레벨 사용자..)
 */



