package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import jdbc.util.OracleUtility;
import sample.dto.Member_Dto;

//DAO 에는+ 입력과 출력은 포함시키지 않습니다. 오직 어떤 형식의 데이터를 받아서
// 어떤 SQL을 실행하여, 어떤 값을 리턴할 것인가를 중점을 두고 실행하면 됩니다.
// DTO 는 데이터를 저장하기 위한 목적의 클래스, DAO는 어떤 동작을 할 것인지 메서드만 있습니다. 
public class Member_Dao {
	// insert,select,update
	// singleton으로 만들어 봅시다.
	private static Member_Dao dao = new Member_Dao();

	private Member_Dao() {
	}

	public static Member_Dao getMemberDao() {
		// 메서드 getInstance외에 내용을 알 수 있는 이름으로 정하기
		return dao;
	}

	public int register(Member_Dto cdto) {
		int count = 0;
		Connection connection = OracleUtility.getConnection();
		try {
			connection.setAutoCommit(false);
			String sql = "Insert into MEMBER_TBL_02 values(rent_seq.nextval,?,?,?,sysdate,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
				ps.setInt(1, cdto.getCustNo());
				ps.setString(2, cdto.getCustName());
				ps.setString(3, cdto.getPhone());
				ps.setString(4, cdto.getAddress());
				ps.setString(5, cdto.getGrade());
				ps.setString(6, cdto.getCity());
				count += ps.executeUpdate();
			
			connection.commit();
			ps.close();
			rs.close();
			System.out.println("회원등록이 완료되었습니다.");

		} catch (SQLException e) {
			System.out.println("회원가입 예외" + e.getMessage());
		}
		try {
			connection.rollback(); // 롤백
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return count;

	}
public Member_Dto SelectOne(int custno) throws SQLException{
	Connection connection = OracleUtility.getConnection();
	String sql = "select * from member_tbl_02 where custno = ?";
  PreparedStatement ps = connection.prepareStatement(sql);
  ps.setInt(1, custno);
  Member_Dto result = null;
  ResultSet rs = ps.executeQuery();
  if(rs.next()) {
	  result = new Member_Dto(custno, 
			  rs.getString(2), 
			  rs.getString(3)
			  , rs.getString(4)
			  , rs.getDate(5)
			  , rs.getString(6)
			  , rs.getString(7)); 
			  
  }
	return result;
	
	
}
	public List<Member_Dto> SelectAll() throws SQLException {
		Connection connection = OracleUtility.getConnection();
		String sql = "Select custno, " + "custname, phone, " + "address, " + "joindate, "
				+ "decode(grade,'A', 'VIP' ,'B','일반', 'C','직원') as grade, city\r\n" + "from MEMBER_TBL_02";
		PreparedStatement ps = connection.prepareStatement(sql);

		List<Member_Dto> results = new ArrayList<>();
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			results.add(new Member_Dto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
					rs.getString(6), rs.getString(7)));
		}
		ps.close();
		connection.close();
		return results;

	}

	public int updateCustomer(Member_Dto dto) throws SQLException {
		Connection connection = OracleUtility.getConnection();
		// 수정 가능한 항목(컬럼)은 모두 set에 포함시키기
		int count = 0;
		String sql = "update MEMBER_TBL_02 set " + "phone = ?, " + "ADDRESS = ?," + "grade = ? ," + "city = ?"
				+ "where custno =?";
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, dto.getPhone());
		ps.setString(2, dto.getAddress());
		ps.setString(3, dto.getGrade());
		ps.setString(4, dto.getCity());
		ps.setString(5, dto.getCustName());
		count = ps.executeUpdate();

		ps.close();
		connection.close();

		return count;

	}

}
