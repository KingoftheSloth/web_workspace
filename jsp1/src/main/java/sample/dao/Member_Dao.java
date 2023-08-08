package sample.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.OracleUtility;
import sample.dto.Member_Dto;

//DAO 에는 입력과 출력은 포함시키지 않습니다. 오직 어떤 형식의 데이터를 받아서
//어떤 SQL을 실행하여 , 어떤 값을 리턴할 것인가를 중점을 두고 정의하면 됩니다.
//DTO 는 데이터를 저장하는 목적의 클래스 , DAO 는 어떤 동작을 할것인지를 정의한 메소드만 있습니다. 
public class Member_Dao {
// insert,select,update
// 싱글톤으로 만들어 봅니다.
	
	private static Member_Dao dao = new Member_Dao();
	private Member_Dao() {}
	public static Member_Dao getMemberDao() {   //메소드 getInstance외에 내용을 알수 있는 이름으로 정하기
		return dao;
	}
	
		
	public int insert(Member_Dto dto) throws SQLException {
		Connection conn = OracleUtility.getConnection();
		String sql = "insert into MEMBER_TBL_02 values (?, ?, ?, ?, sysdate, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, dto.getCustNo());	
		ps.setString(2, dto.getCustName());
		ps.setString(3, dto.getPhone());
		ps.setString(4, dto.getAddress());
		ps.setString(5, dto.getGrade());
		ps.setString(6, dto.getCity());
			int result = ps.executeUpdate();
			ps.close();
			conn.close();
			return result;
		}
	
	public Member_Dto selectOne(int custno) throws SQLException {		//수정할 데이터 가져오기
		Connection conn = OracleUtility.getConnection();
		String sql = "select * from MEMBER_TBL_02 where custno = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1,custno);
		Member_Dto result = null;
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			String custname = rs.getString(2);
			String phone = rs.getString(3);
			String address = rs.getString(4);
			Date joindate = rs.getDate(5);
			String grade = rs.getString(6);
			String city = rs.getString(7);
			result = new Member_Dto(custno, custname, phone, address, joindate, grade, city);
		}
		rs.close();
		ps.close();
		conn.close();
		return result;
	}
	
	public List<Member_Dto> selectAll() throws SQLException {		//전체 목록 가져오기
		Connection conn = OracleUtility.getConnection();
		String sql = "select custno,custname,phone,address,joindate,"
				+ " decode(grade,'A','VIP','B','일반','C','직원') ,city "
				+ " from MEMBER_TBL_02";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		List<Member_Dto> result = new ArrayList<>();
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Member_Dto md = new Member_Dto(rs.getInt(1), 
						rs.getString(2), 
						rs.getString(3), 
						rs.getString(4), 
						rs.getDate(5), 
						rs.getString(6), 
						rs.getString(7));
			result.add(md);
		}
		ps.close();
		conn.close();
			return result;
		
	}
	
	public int update(Member_Dto dto) throws SQLException {
		Connection conn = OracleUtility.getConnection();
		//수정 가능한 항목(컬럼)은 모두 set에 포함시키기
		String sql = "UPDATE MEMBER_TBL_02 SET custname = ?, phone = ?, address = ?, city = ? WHERE custno = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, dto.getCustName());
		ps.setString(2, dto.getPhone());
		ps.setString(3, dto.getAddress());
		ps.setString(4, dto.getCity());
		ps.setInt(5, dto.getCustNo());
		int result = ps.executeUpdate();
		
		ps.close();
		conn.close();
		return result;
	}
	
	
}
