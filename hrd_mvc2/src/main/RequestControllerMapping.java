package main;

import java.util.HashMap;
import java.util.Map;

import controller.Controller;
import controller.ListController;
import controller.LoginActionController;
import controller.LoginViewController;
import controller.LogoutController;
import controller.RegActionController;
import controller.RegisterController;
import controller.SaleController;
import controller.UpdateActionController;
import controller.UpdateController;

public class RequestControllerMapping {
	private static final Map<RequestMap,Controller> mapping = new HashMap<>();
	
	public static void init() {
		//설계된 url,method 에 따라 처리할 controller 구현체를 Key,Value 로 HashMap에 저장합니다.
		mapping.put(new RequestMap("/list.hrd", "GET"), new ListController());
		//매출조회 리스트 생성하고 view에 전달하는 컨트롤러
		mapping.put(new RequestMap("/sale.hrd", "GET"), new SaleController());
		mapping.put(new RequestMap("/update.hrd", "GET"), new UpdateController());
		mapping.put(new RequestMap("/register.hrd", "GET"), new RegisterController());
		mapping.put(new RequestMap("/register.hrd", "POST"), new RegActionController());
		mapping.put(new RequestMap("/update.hrd", "POST"), new UpdateActionController());
		
		//로그인 기능
		mapping.put(new RequestMap("/login.hrd", "GET"), new LoginViewController());
		mapping.put(new RequestMap("/login.hrd", "POST"), new LoginActionController());
		mapping.put(new RequestMap("/logout.hrd", "GET"), new LogoutController());
	
		
	}
	//url,method 필드를 저장하는 key 를 전달받아 HashMap에서 value(컨트롤러)를 리턴
	public static Controller getController(RequestMap key) {
		return mapping.get(key);
	}
}
