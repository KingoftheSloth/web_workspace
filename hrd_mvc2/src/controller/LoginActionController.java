package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.RequestMap;
//new RequestKeyValue("/login.hrd", "POST")
public class LoginActionController implements Controller {

	@Override
	public void handle(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userid");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		//할일 : dao 로 id,password 확인하는 메소드 실행
		//id,password 모두 admin 일 때 인증 성공으로 하는 예시입니다.
		if(id.equals("admin") && password.equals("admin")) {
			//로그인 성공
			session.setAttribute("userid", id);  //핵심.
		}
		
		response.sendRedirect(request.getContextPath());		//메인페이지로 요청 redirect
	}

}
