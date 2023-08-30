package projectB.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import projectB.dto.Animal;
import projectB.myBatis.SqlSessionBean;

public class animalDao {
	private static animalDao dao = new animalDao();
	private animalDao() {}
	public static animalDao getInstance() {
		return dao;
	}
	
	public int insert(Animal vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int idx = mapper.insert("animal.insert",vo);
		mapper.commit();
		mapper.close();
		return idx;
	}
	public List<Animal> selectAll() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Animal> list = mapper.selectList("animal.selectAll");
		mapper.close();
		return list;
	}
}