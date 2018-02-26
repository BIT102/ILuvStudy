package dev.mvc.study.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.study.domain.Criteria;
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
		System.out.println("delete_2");
		session.delete(namespace+".delete", bno);
	}

	@Override
	public List<QnaVO> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}

	@Override  // 페이징
	public List<QnaVO> listPage(int page) throws Exception {

		if(page <=0){
			page = 1;
		}
		
		page = (page -1)*10;
		return session.selectList(namespace+".listPage", page);
	}

	@Override
	public List<QnaVO> listCriteria(Criteria cri) throws Exception {

		return session.selectList(namespace+".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}
}
