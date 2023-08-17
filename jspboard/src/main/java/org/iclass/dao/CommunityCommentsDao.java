package org.iclass.dao;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.CommunityComments;
import org.iclass.dto.Community;

import mybatis.SqlSessionBean;

public class CommunityCommentsDao {
	private static CommunityCommentsDao dao = new CommunityCommentsDao();
	private CommunityCommentsDao() {}
	public static CommunityCommentsDao getInstance() {
		return dao;
	}

	public int insert(CommunityComments vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int idx = mapper.insert("communityComments.insert",vo);
		mapper.commit();
		mapper.close();
		return idx;
	}
	
	public int delete(int idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("communityComments.delete",idx);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	//idx 최대값 구하기
	public int maxOf() {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("communityComments.maxOf");
		session.close();
		return result;
	}

	//메인글의 댓글 갯수 업데이트	
	public int setCommentCount(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("community.setCommentCount", idx);
		mapper.commit();
		mapper.close();
		return result;
	}

/*
	//댓글 기능
	
	//mref 메인글의 댓글 갯수
	public int commentsCount(long mref) {
		Sqlmapper mapper = SqlmapperBean.getmapper();
		int result = mapper.selectOne("community.commentsCount", mref);
		mapper.close();
		return result;
	}
	
	//idx 최대값 구하기
	public int maxOf() {
		Sqlmapper mapper = SqlmapperBean.getmapper();
		int result = mapper.selectOne("community.maxOf");
		mapper.close();
		return result;
	}
	
	//mref 메인글의 댓글목록 가져오기
	public List<CommunityComments> comments(long mref){
		Sqlmapper mapper = SqlmapperBean.getmapper();
		List<CommunityComments> commentList = mapper.selectList("community.comments",mref);
		mapper.close();
		return commentList;
	}
	
	*/	
	
}