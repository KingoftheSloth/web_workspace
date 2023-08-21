package mybatis;

import static org.junit.jupiter.api.Assertions.*;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dao.CommunityDao;
import org.iclass.dto.Community;
import org.junit.jupiter.api.Test;


class SqlSessionTest {

	@Test
	void connect() {
SqlSession sqlsession = SqlSessionBean.getSession();
assertNotNull(sqlsession);
	}

	@Test
	void write() {
		CommunityDao dao = CommunityDao.getInstance();
		long idx = dao.insert(Community.builder()
				.title("test")
				.writer("sana")
				.content("테스트")
				.build()
				);
		
		System.out.println("idx =" + idx);
		assertNotEquals(0, idx);
	}
}

