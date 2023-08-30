package dao;

import org.apache.ibatis.session.SqlSession;

import dto.animal;
import myBatis.SqlSessionBean;

public class animalDao {
	private static animalDao dao = new animalDao();
	private animalDao() {}
	public static animalDao getInstance() {
		return dao;
	}
	
	public int insert(animal vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int idx = mapper.insert("animal.insert",vo);
		mapper.commit();
		mapper.close();
		return idx;
	}
}

