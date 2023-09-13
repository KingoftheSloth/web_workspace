package projectB.dao;


import org.apache.ibatis.session.SqlSession;
import projectB.dto.Animal;
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
}