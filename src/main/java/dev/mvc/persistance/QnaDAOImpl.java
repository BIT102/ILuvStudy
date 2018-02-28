package dev.mvc.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.QnaVO;
import dev.mvc.domain.ReplyVO;
import dev.mvc.domain.SearchCriteria;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject 
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.qnaMapper"; //qnaMapper.xml에서 설정한 namespace
	private static String namespace2 = "dev.mvc.mapper.replyMapper"; //replyMapper.xml namespace2
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

	@Override
	public List<QnaVO> listSearch(SearchCriteria cri) throws Exception {

		return session.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return session.selectOne(namespace+".listSearchCount", cri);
	}

	@Override
	public List<ReplyVO> list(Integer bqBno) throws Exception {
		
		return session.selectList(namespace2 + ".list", bqBno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {

		session.insert(namespace2 + ".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		
		session.update(namespace2 + ".update", vo);
	}

	@Override
	public void deleteReply(Integer rno) throws Exception {

		session.delete(namespace2 + ".delete", rno);
	}
}
