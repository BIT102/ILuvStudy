package dev.mvc.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.BoardVO;

@Repository//DAO를 스프링에 인식시키는 애노테이션
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession Session;
	
	private static final String namespace = "dev.mvc.mapper.BoardMapper";
	

	@Override
	public void insertStudy(BoardVO vo) {
		Session.insert(namespace+".insertStudy", vo);
	}


	@Override
	public BoardVO read(Integer bno) throws Exception {
		return Session.selectOne(namespace+".read", bno);
		
	}


	@Override
	public List<BoardVO> listAll() throws Exception {
		return Session.selectList(namespace+".listAll");
	}
}
