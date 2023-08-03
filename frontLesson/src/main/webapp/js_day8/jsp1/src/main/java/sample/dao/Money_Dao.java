package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.OracleUtility;
import sample.dto.Money_Dto;

public class Money_Dao {
	private static Money_Dao mdao = new Money_Dao();

	private Money_Dao() {
	}

	public static Money_Dao getMoney_Dao() {
		return mdao;
	}

	public List<Money_Dto> sales() throws SQLException {
		Connection connection = OracleUtility.getConnection();
		String sql = "select met.custno, custname,\r\n"
				+ "   decode(met.grade, 'A', 'VIP', 'B', '일반', 'C', '직원') as grade,\r\n"
				+ "   asum\r\n"
				+ "   from member_tbl_02 met join\r\n"
				+ "   (select custno, sum(price) asum from money_tbl_02 mot \r\n"
				+ "   group by custno\r\n"
				+ "   order by asum desc) sale\r\n"
				+ "   on met.custno = sale.custno ORDER BY asum desc";
		PreparedStatement ps = connection.prepareStatement(sql);
		List<Money_Dto> result = new ArrayList<>();
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
		 result.add(new Money_Dto(rs.getInt(1), 
				 rs.getString(2), 
				 rs.getString(3), 
				 rs.getInt(4)));
					
		}
		return result;
		
	}
}
