package org.iclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.Community;

import mybatis.SqlSessionBean;

public class CommunityDao {
	private static CommunityDao dao = new CommunityDao(); // private static 멤버변수가 참조하는 것은 자기자신 객체
	private CommunityDao() {}
	public static CommunityDao getInstance() { // 생성된 객체를 리턴해 주는 public 메소드 - 항상 동일한 객체를 리턴
		return dao;
	}

	public List<Community> list() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Community> list = mapper.selectList("list");
		mapper.close();
		return list;
	}

	public List<Community> pagelist(Map<String,Integer> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Community> list = mapper.selectList("community.pagelist",map);
		mapper.close();
		return list;

	}
	//전체 글 갯수
		public int count() {
				SqlSession mapper = SqlSessionBean.getSession();
				int result = mapper.selectOne("community.count");
				mapper.close();
				return result;
		}
			
		public Community selectByIdx(long idx) {
			SqlSession mapper = SqlSessionBean.getSession();
			Community vo = mapper.selectOne("community.selectByIdx",idx);
			mapper.close();
			return vo;
		}
		
		//읽은 메인글 조회수 증가
		public int setReadCount(long idx) {
			SqlSession session = SqlSessionBean.getSession();
			int result = session.update("community.setReadCount", idx);
			session.commit();
			session.close();
			return result;
		}
		
		public int update(Community vo) {
			SqlSession mapper = SqlSessionBean.getSession();
			int result = mapper.update("community.update",vo);
			mapper.commit();
			mapper.close();
			return result;
		}
		
		public int delete(long idx) {
			SqlSession mapper = SqlSessionBean.getSession();
			int result = mapper.delete("community.delete",idx);
			mapper.commit();
			mapper.close();
			return result;
		}
}
