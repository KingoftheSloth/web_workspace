package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.OracleUtility;
import sample.dto.JProductDto;

public class JProductDao {

	public List<JProductDto> SelectAllProduct() throws SQLException {
		// 2. 상품 목록 보기
		Connection connection = jdbc.util.OracleUtility.getConnection();
		String sql = "select * from j_product";
		PreparedStatement ps = connection.prepareStatement(sql);

		List<JProductDto> results = new ArrayList<>();
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			results.add(new JProductDto(rs.getString(1), rs.getString(2), 
							rs.getString(3), rs.getInt(4)));
		}
		ps.close();
		connection.close();
		return results;

	}
//3. 상품명으로 검색하기 (유사검색 -> **'검색어가 포함된 상품명'**을 목록 조회하기)
	public static List<JProductDto> SelectOne(String pname) throws SQLException {
// pname은 사용자가 입력한 검색어 
		Connection connection = OracleUtility.getConnection();
		String sql = "select * from j_product where pname like '%' || ? || '%'";
		//like는 유사비교, % 기호 사용
		PreparedStatement ps = connection.prepareStatement(sql);
		
		ps.setString(1, pname);
		ResultSet rs = ps.executeQuery();
		
		List<JProductDto> results = new ArrayList<>();
		while (rs.next()) {
			results.add(new JProductDto(rs.getString(1), rs.getString(2), 
					rs.getString(3), rs.getInt(4)));
		}
		return results;

	}
	

}
