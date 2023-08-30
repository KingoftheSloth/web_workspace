package projectB.myBatis;

import java.io.IOException;
import java.io.InputStream;
//Mybatis 프레임웍의 클래스들..
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionBean {
/*
 * Mybatis 라이브러리의 SqlSession 클래스가 SQL 실행메소드를 제공합니다.
 * SqlSesseionFactoryBuilder 가  SqlSessionFactory 객체 생성
 * SqlSessionFactory 객체가 SqlSession 객체 생성  : 클래스 의존관계
 ****SqlSession 객체로 dao에서 db sql을 실행합니다.***
 * 
 * https://mybatis.org/mybatis-3/ko/getting-started.html 참고로 작성합니다.
 * String resource = "org/mybatis/example/mybatis-config.xml";
   InputStream inputStream = Resources.getResourceAsStream(resource);
   SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
 * 
 */
	public static SqlSessionFactory sqlSessionFactory;
	static {
	    String resource = "projectB/myBatis/mybatis-config.xml";
	    InputStream inputStream = null;

	    try {
	        inputStream = Resources.getResourceAsStream(resource);
	    } catch (IOException e) {
	        System.out.println("mybatis 설정 파일 읽기 오류입니다.");
	        e.printStackTrace(); // 예외 내용 출력
	    }

	    if (inputStream != null) {
	        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	    } else {
	        System.out.println("inputStream이 null입니다."); // 오류 메시지 출력
	    }
	}
	
	public static SqlSession getSession() {    
		//**생성된 sqlSessionFactory 리턴하는 메소드 -> sql 실행하는 객체
		return sqlSessionFactory.openSession();
	}
}