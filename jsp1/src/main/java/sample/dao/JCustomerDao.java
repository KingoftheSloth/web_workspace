package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.util.OracleUtility;
import sample.dto.JCustomerDto;

/* 
1. 회원 로그인 - 간단히 회원아이디를 입력해서 존재하면 로그인 성공
2. 상품 목록 보기
3. 상품명으로 검색하기
4. 상품 장바구니 담기 - 장바구니 테이블이 없으므로 구매를 원하는 상품을 List 에 담기
5. 상품 구매(결제)하기 - 장바구니의 데이터를 '구매' 테이블에 입력하기 (여러개 insert)
6. 나의 구매 내역 보기. 총 구매 금액을 출력해주기
*/
public class JCustomerDao {
//1. 회원로그인
	public JCustomerDto selectById(String id) throws SQLException {
		Connection connection = jdbc.util.OracleUtility.getConnection();
		String sql = "select * from j_custom where Custom_id = ? ";
		// PK 조회 : 결과 행은 0 또는 1개
		PreparedStatement ps = connection.prepareStatement(sql);
		//Statement : SQL, prepared : SQL 이 미리 컴파일되어 준비됨.
		// PreparedStatement 는 Statement 인터페이스와 비교할 수 있습니다. 
		// Statement : SQL 실행에 필요한 데이터를 동시에 포함시켜서 컴파일 합니다. 
		ps.setString(1, id);
		// 준비된 SQL 에 파라미터 전달하여
		JCustomerDto temp = null;
		ResultSet rs = ps.executeQuery();
		// select 쿼리 실행
		if(rs.next()) {
		temp = new JCustomerDto(rs.getString(1),rs.getString(2),
				rs.getString(3),rs.getInt(4),
				rs.getDate(5),null);
		}
		
		ps.close();
		connection.close();
		return temp;
		
	}
	
	public JCustomer login(String id, String password) throws SQLException {
		Connection conn = OracleUtility.getConnection();
	      // id는 custom_id 컬럼값, password는 password 컬럼값(평문으로 저장됨)
	      String sql = "select custom_id ,name "
	            + " from j_custom where custom_id =? and password=?";
	      JCustomer result = null;
	      try (PreparedStatement ps = conn.prepareStatement(sql)){
	         ps.setString(1, id);
	         ps.setString(2,password);
	         ResultSet rs = ps.executeQuery();
	         if(rs.next()) {
	        	 result = new JCustomer();
	        	 result.setCustom_id(rs.getString(1));
	        	 result.setName(rs.getString(2));
	         }
	         conn.close();
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }
	      System.out.println(result);
	      return result;      //result 가 null 이 아니면 로그인 성

	
	} 
}
