package sample.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import sample.dto.OrderDto;

public class OrderDao {

	private static OrderDao dao = new OrderDao();

	private OrderDao() {
	}

	public static OrderDao getOrderDao() {
		return dao;
	}

//SqlSession 의 메서드 selectList, insert 의 첫번째 인자는 mapper xml의 sql id와 동일하게 합니다.
//  				 두번째 인자는 전달한 파라미터 
	public List<String> selectOrderByEmail() throws SQLException {
		SqlSession mapper = SqlSessionBean.getSession();
		List<String> list = mapper.selectList("selectOrderByEmail");
		mapper.close();
		return list;
	}

	public int insert(OrderDto order) throws SQLException {
		SqlSession mapper = SqlSessionBean.getSession();
		int count = mapper.insert("insert", order);
		// insert, update, delete는 commit 명령이 필요합니다.
		mapper.commit();
		mapper.close();
		return count;

	}

	public List<OrderDto> selectByEmail(String email) throws SQLException {
		SqlSession mapper = SqlSessionBean.getSession();
		List<OrderDto> list = mapper.selectList("selectByEmail",email);
		mapper.close();
		return list;

	}
}
