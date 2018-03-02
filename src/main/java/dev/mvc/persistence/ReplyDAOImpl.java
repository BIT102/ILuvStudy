package dev.mvc.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dev.mvc.domain.Criteria;
import dev.mvc.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "dev.mvc.mapper.replyMapper"; //replyMapper.xml namespace
	
	@Override
	public List<ReplyVO> list(Integer bqBno) throws Exception {
		
		return session.selectList(namespace + ".list", bqBno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {

		session.insert(namespace + ".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {

		session.update(namespace + ".update", vo);
	}

	@Override
	public void deleteReply(Integer rno) throws Exception {

		session.delete(namespace + ".delete", rno);
	}
	
//¥Ò±€¿« ∆‰¿Ã¬° 
	@Override
	public List<ReplyVO> listPage(Integer bqBno, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bqBno", bqBno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace+ ".listPage", paramMap);
	}

	@Override
	public int count(Integer bqBno) throws Exception {

		return session.selectOne(namespace+ ".count", bqBno);
	}

}
