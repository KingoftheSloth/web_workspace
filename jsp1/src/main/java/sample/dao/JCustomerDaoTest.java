package sample.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class JCustomerDaoTest {

	@Test
	void daoTest() {
		JCustomerDao dao = new JCustomerDao();
		assertNotNull(dao);
		
	}
	
	@Test
	void login() {
		JCustomerDao dao = new JCustomerDao();
		try {
			JCustomer dto = dao.login("twice","2222");
			assertNotNull(dto);
		} catch (Exception e) {
		}
	
		
	}
	
	
}
