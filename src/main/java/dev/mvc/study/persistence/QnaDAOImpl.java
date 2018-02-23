package dev.mvc.study.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.study.domain.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject 
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.qnaMapper"; //qnaMapper.xml에서 설정한 namespace
	
	@Override
	public void create(QnaVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}

	@Override
	public QnaVO read(Integer bno) throws Exception {
		return session.selectOne(namespace+".read", bno);
	}

	@Override
	public void update(QnaVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete", bno);
	}

	@Override
	public List<QnaVO> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}
}
