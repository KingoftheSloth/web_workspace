package sample.main;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import sample.dao.JBuyDao;
import sample.dao.JCustomerDao;
import sample.dao.JProductDao;
import sample.dto.JBuyDto;
import sample.dto.JCustomerDto;
import sample.dto.JProductDto;
import sample.dto.MyPageBuy;

public class MyMallMain {

	public static void main(String[] args) {
		System.out.println(":::::: 김땡땡 쇼핑몰에 오신걸 환영합니다. :::::");
		System.out.println("상품소개");
		JProductDao jproductDao = new JProductDao();
		try {
			List<JProductDto> products = jproductDao.SelectAllProduct();
			for (JProductDto product : products)
				System.out.println(product);
		} catch (SQLException e) {
			System.out.println("상품소개 예외 : " + e.getMessage());
		}
		System.out.println("편리한 상품구매를 위해 검색하기 ");
		Scanner sc = new Scanner(System.in);
		System.out.println("검색어 입력 :");
		String pname = sc.nextLine();

		try {
			List<JProductDto> products = JProductDao.SelectOne(pname);
			for (JProductDto product : products)
				System.out.println(product);
		} catch (SQLException e) {
			System.out.println("상품 검색 예외 : " + e.getMessage());
		}

		///////
		JCustomerDao cdao = new JCustomerDao();
		JCustomerDto customer = null;
		String customid = null;
		boolean isLogin = false; // 로그인 성공 여부 저장
		while (!isLogin) {
			System.out.println("\n<< 장바구니와 상품 구매를 위해 로그인하기(필수) >>");
			System.out.println("간편 로그인 - 사용자 id 입력(로그인 취소는 0000)");
			customid = sc.nextLine();
			if (customid.equals("0000"))
				break;
			try {
				customer = cdao.selectById(customid);
				if (customer != null) {
					System.out.println(customer.getName() + " 고객님 환영합니다.");
					isLogin = true;
				} else
					System.out.println("유효하지 않은 ID " + customid);
			} catch (Exception e) {
				System.out.println("간편 로그인 예외 " + e.getMessage());
			}
		}
// 장바구니 담기는 로그인 상태인 경우만 실행하기
		// 4. 상품 장바구니 담기 - 장바구니 테이블이 없으므로 구매를 원하는 상품을 List 에 담기
		// 꼭 필요한것은 pcode랑 quantity
		JBuyDao bdao = new JBuyDao();
		List<JBuyDto> carts = new ArrayList<>();
		if (isLogin) {
			while (true) {
				System.out.println("\n 장바구니에 담기 합니다. 그만하려면 상품코드 0000 입력하세요");
				System.out.println("구매할 상품 코드를 입력하세요 >>>");
				String pcode = sc.nextLine();
				if (pcode.equals("0000")) break;
				System.out.println("구매할 수량을 입력하세요 >>> ");
				int quantity = Integer.parseInt(sc.nextLine());
				carts.add(new JBuyDto(0, customid, pcode, quantity, null));
				System.out.println("장바구니에 담긴 상품을 결제하시겠습니까? (y/Y)");
				if (sc.nextLine().toLowerCase().equals("y"))
					break;

			}
			System.out.println("장바구니 확인 :" + carts);
			for(JBuyDto b : carts) {
				System.out.println("pcode :" + b.getPcode() + "\n수량 :" + b.getQuantity());
				
			}
			int count = bdao.insertMany(carts);
			if(count!=0)
				System.out.println("예외발생. 결제를 중단합니다.");
			// dao에서 carts를 전달받아 여러번 insert하면 됩니다.
			else
			System.out.println("\n" + "결제를 완료했습니다. 현재까지" + customer.getName() + "회원님의 구매 내역 입니다.");
			//6. 나의 구매내역 보기 
			System.out.println("나의 구매내역을 보시겠습니까");
			try {
//				System.out.println(bdao.mypagebuy(customid));
				List<MyPageBuy> results = bdao.mypagebuy(customid);
				
				System.out.println("현재까지 " + customer.getName() + "회원의 구매내역입니다.");
				for(MyPageBuy my :results) {
					System.out.print(my.getBuy_date());
					System.out.println(" "+ my.getPname()+ "\t" +my.getQuantity() +"개");
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println(customer.getName() + "님의 총 구매가격은 >>");
			JBuyDao s = new JBuyDao();
			try {
				System.out.println(s.myMoney(customid)+ "원입니다.");
				
				DecimalFormat df = new DecimalFormat("###,###,###");
				System.out.println(df.format(s.myMoney(customid))); 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		} else { // 로그인 안했을 때
			System.out.println("로그인을 취소했습니다. 프로그램을 종료합니다.");
		}
	}
}
