package projectB.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import projectB.dto.Animal;
import projectB.dto.Message;
import projectB.dto.adopt;
import projectB.myBatis.SqlSessionBean;

public class usersDao {
   private static usersDao dao = new usersDao();
   private usersDao() {}
   public static usersDao getInstance() {
      return dao;
      }
   
        public String selectuserPhone(String id) {
          SqlSession mapperSession = projectB.myBatis.SqlSessionBean.getSession();           
          String result = mapperSession.selectOne("users.selectuserPhone", id);           
          mapperSession.close();
          return result;
       }
        
        public int sendMessage(Message vo) {
    		SqlSession mapper = SqlSessionBean.getSession();
    		int idx = mapper.insert("users.sendMessage",vo);
    		mapper.commit();
    		mapper.close();
    		return idx;
    	}
        
        public List<Message> checkMessage() {
    		SqlSession mapper = SqlSessionBean.getSession();
    		List<Message> list = mapper.selectList("users.checkMessage");
    		mapper.close();
    		return list;
    	}
        
        public int deleteAdopt(String aniid) {
        	SqlSession mapper = SqlSessionBean.getSession();
    		int idx = mapper.insert("users.deleteAdopt", aniid);
    		mapper.commit();
    		mapper.close();
    		return idx;
        	
        }
        
       
}